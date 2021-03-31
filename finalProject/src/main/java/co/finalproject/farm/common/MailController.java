package co.finalproject.farm.common;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;


@Controller
public class MailController {

	@Autowired private JavaMailSender mailSender;
	@Autowired UserService userService;
	
	//회원가입시 이메일 인증코드 메일 발송
	@RequestMapping("/sendEmailJoinCode")
	@ResponseBody
	public String sendEmailJoinCode(@RequestParam String user_email) {
		
		int leftLimit = 48; //시작문자  0으로.
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10; //총 길이
		
		/* joinCode : 난수로 생성한 인증번호. */
		Random random = new Random();
		String joinCode = random.ints(leftLimit, rightLimit + 1)
			  .filter(i -> (i<=57 || i>=65) && (i<=90 || i >= 97))
			  .limit(targetStringLength)
			  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
			  .toString();
		
        /* 
         * setFrom : 발신자 메일주소 (email-context.xml 내의 username과 같아야한다.)
         * toMail : 수신자 메일주소 (파라미터로 받음)
         * title : 메일 제목
         * content : 메일 내용 (인증번호 포함)
         */
        String setFrom = "yellowsys92@gmail.com";
        String toMail = user_email;
        String title = "청년농장 회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "인증 번호는 " + joinCode + "입니다." + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        /* 메일 전송 */
        try {
        	MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content);
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
        //인증코드 ajax로 반환 
		return joinCode;
        
	}

		
		//임시비밀번호 보내고 db에 임시비밀번호로 바꿔서 저장하기
		@RequestMapping("/pwFindEmail")
		@ResponseBody
		public int pwFindEmail(@RequestParam String user_id,@RequestParam String user_email) {
			
			int mailSendResult = 0; //이메일 보내고 나면 1 / 아니면 0
			int leftLimit = 48; 	//시작문자  0으로.
			int rightLimit = 122; 	// letter 'z'
			int targetStringLength = 15; //총 길이
			
			/* joinCode : 난수로 생성한 인증번호. */
			Random random = new Random();
			String pwTempCode = random.ints(leftLimit, rightLimit + 1)
				  .filter(i -> (i<=57 || i>=65) && (i<=90 || i >= 97))
				  .limit(targetStringLength)
				  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				  .toString();
			
	        /* 
	         * setFrom : 발신자 메일주소 (email-context.xml 내의 username과 같아야한다.)
	         * toMail : 수신자 메일주소 (파라미터로 받음)
	         * title : 메일 제목
	         * content : 메일 내용 (인증번호 포함)
	         */
	        String setFrom = "yellowsys92@gmail.com";
	        String toMail = user_email;
	        String title = "청년농장 임시 비밀번호 발급 안내입니다.";
	        String content = "<h2>안녕하세요</h2><br><br>" 
	        				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
	        				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + pwTempCode +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
	        				+ "<h3><a href='http://192.168.0.68/temp/'>MS :p 홈페이지 접속 ^0^</a></h3><br><br>"
	        				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";

	        UserVO vo = new UserVO();
	        vo.setUser_pwd(pwTempCode);
	        vo.setUser_id(user_id);
	        int result = userService.updateUser(vo);
	        System.out.println("============= 비밀번호 변경 완료시 1 ============" + result);
	        
	        /* 메일 전송 */
	        try {
	        	MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content);
				mailSender.send(message);
				mailSendResult = 1;
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return mailSendResult;
	        
		}
		
}

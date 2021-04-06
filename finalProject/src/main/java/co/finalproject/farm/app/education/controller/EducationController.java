package co.finalproject.farm.app.education.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.education.service.EduPagingVO;
import co.finalproject.farm.app.education.service.EducationService;
import co.finalproject.farm.app.education.service.EducationVO;
import co.finalproject.farm.app.notice.controller.FaqController;
import co.finalproject.farm.common.Paging;

@Controller
public class EducationController {
	
    @Autowired EducationService eduService;
	
	Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@GetMapping("/onEducation")
	public String onEducation() {
		return "education/onEducation";
	}
	
	//농사로 api 샘플 소스에 있던 콜백함수임
	//그냥 ajax_local_callback.jsp 페이지를 webapp 바로 밑에 넣어도 상관 없긴 함 
	//(onEducation에서 ajax_local_callback.jsp로 바꿔주고..)
	// ajax_local_callback은 뷰페이지가 아니기 때문에 매핑을 하려면
	//컨트롤러에 내용을 그대로 적어주는 방식으로 매핑해줘야 함
	@GetMapping("/ajax_local_callback")
	public void ajax_local_callback(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String openapi_url = "http://api.nongsaro.go.kr/service/"+ request.getQueryString();

		StringBuffer sbf = new StringBuffer();
		try{
			System.out.println(openapi_url);
		    URL url = new URL(openapi_url);
		    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
		    String inputLine;
		    while( (inputLine = in.readLine() ) != null ) sbf.append(inputLine);
		} catch( Exception e ) {   
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(sbf.toString()); 
	}
	
	@GetMapping("/getOffEdu")
	 public String getFaq(EduPagingVO vo, Paging paging, Model model) {
		paging.setPageUnit(7); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(4); //페이지 번호수
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(eduService.getCount(vo)); 
		model.addAttribute("paging", paging);
    	model.addAttribute("list", eduService.getOffEdu(vo) );
		return "education/offEducation";
	}
	
	//단건 조회 
    @RequestMapping("/getSchOffEdu")
    public String getSchOffEdu (Model model, EducationVO vo, EduPagingVO pagingvo) {
    	model.addAttribute("edu", eduService.getSchOffEdu(vo));
        return "education/offEducation";
    }

    
	//등록폼
    @RequestMapping("/insertEdu")
    public String insertEdu(Model model) {
    	return "education/insertEdu";
    }
	
	//등록처리
    @PostMapping("/insertEdu")
    public String insertEduProc(EducationVO vo, EduPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	eduService.insertEdu(vo);
    	return "redirect:getOffEdu";
    }
    	
	//수정처리
    @PostMapping("/updateEdu")
    public String updateFaqProc(EducationVO vo, EduPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	eduService.updateEdu(vo);
    	return "redirect:getSchOffEdu?edu_no="+vo.getEdu_no()+"&page="+pagingvo.getPage();
    }
    
    //삭제처리
    @RequestMapping("/deleteEdu") //원래 get으로 처리하는 게 정석인데 삭제 버튼이 post 폼 안에 묶여있어서 request로 바꿈.
    public String deleteFaqProc(EducationVO vo, EduPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	eduService.deleteEdu(vo);
		return "redirect:getOffEdu?page="+pagingvo.getPage();	
    }
	
}

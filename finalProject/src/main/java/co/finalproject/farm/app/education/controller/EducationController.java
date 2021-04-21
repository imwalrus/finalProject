package co.finalproject.farm.app.education.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.finalproject.farm.app.education.service.EduPagingVO;
import co.finalproject.farm.app.education.service.EducationService;
import co.finalproject.farm.app.education.service.EducationVO;
import co.finalproject.farm.app.notice.controller.FaqController;
import co.finalproject.farm.common.FileRenamePolicy;
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
	 public String getFaq(EduPagingVO vo, Paging paging, Model model ) {
		paging.setPageUnit(10); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(5); //페이지 번호수
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
        return "notiles/education/schOffEdu";
    }
    
    
	//등록폼
    @RequestMapping("/insertEdu")
    public String insertEdu(Model model) {
    	return "education/insertEdu";
    }
	
    //등록 처리
 	@PostMapping("/insertEdu")
 	public String insertEduImg(EducationVO vo, HttpServletRequest req) throws IOException {
 		// 첨부 파일 처리
 		String path = req.getSession().getServletContext().getRealPath("/resources/images/education");
 		MultipartFile uploadFile = vo.getUploadFile();
 		String edu_filename = "";

 		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
 			String filename = uploadFile.getOriginalFilename();
 			// 파일명 중복체크 -> rename
 			File rename = FileRenamePolicy.rename(
 					new File(path, filename));
 			edu_filename += rename.getName();
 			uploadFile.transferTo(rename); // 임시폴더에서 업로드 폴더로 이동
 		} else if (uploadFile.getOriginalFilename() == null && uploadFile.getOriginalFilename() == "") {
 			vo.setEdu_filename(req.getParameter("edu_filename"));
 		}
 		vo.setEdu_filename(edu_filename); // vo 업로드된 파일명 담아서 DB에 저장
 		eduService.insertEdu(vo);
 		return "redirect:getOffEdu";
 	}

    	
	//수정처리
 	@ResponseBody
 	@RequestMapping("/updateEdu")
    public String updateFaqProc(EducationVO vo, EduPagingVO pagingvo, HttpServletRequest req) throws IllegalStateException, IOException {
 	        // 첨부 파일 처리
 	 		String path = req.getSession().getServletContext().getRealPath("/resources/images/education");
 	 		MultipartFile uploadFile = vo.getUploadFile();
 	 		String edu_filename = "";

 	 		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
 	 			String filename = uploadFile.getOriginalFilename();
 	 			// 파일명 중복체크 -> rename
 	 			File rename = FileRenamePolicy.rename(
 	 					new File(path, filename));
 	 			edu_filename += rename.getName();
 	 			uploadFile.transferTo(rename); // 임시폴더에서 업로드 폴더로 이동
 	 		} else if (uploadFile.getOriginalFilename() == null && uploadFile.getOriginalFilename() == "") {
 	 			vo.setEdu_filename(req.getParameter("edu_filename"));
 	 		}
 	 		vo.setEdu_filename(edu_filename); // vo 업로드된 파일명 담아서 DB에 저장
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

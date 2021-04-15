package co.finalproject.farm.app.community.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.finalproject.farm.app.community.service.CommPagingVO;
import co.finalproject.farm.app.community.service.CommunityService;
import co.finalproject.farm.app.community.service.CommunityVO;
import co.finalproject.farm.app.notice.controller.NoticeController;
import co.finalproject.farm.common.FileRenamePolicy;
import co.finalproject.farm.common.Paging;

@Controller
public class CommunityController {
	
@Autowired CommunityService communityService;
	
	Logger logger = LoggerFactory.getLogger(NoticeController.class);
    
	//게시글 목록
    @GetMapping("/getComm")
    public String  getComm(CommPagingVO vo, Paging paging, Model model) {
    	paging.setPageUnit(7); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(4); //페이지 번호수
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(communityService.getCount(vo)); 
		model.addAttribute("paging", paging);
    	model.addAttribute("list", communityService.getComm(vo) );
    	return "community";
    }
    
    //단건 조회 ( + 조회수 증가 )
    @RequestMapping("/getSchComm")
    public ModelAndView getSchComm(HttpSession session, Model model, CommunityVO vo, CommPagingVO pagingvo) {
    	communityService.updatereviewcnt(vo, session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/selectComm");
        // 뷰에 전달할 데이터
        mav.addObject("communityVO", communityService.getSchComm(vo));
        return mav;
    }

    
	//등록폼
    @RequestMapping("/insertComm")
    public String insertComm(Model model) {
    	return "community/insertComm";
    }
    
    //등록처리
    @PostMapping("/insertComm")
    public String insertCommProc(CommunityVO vo, CommPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	communityService.insertComm(vo);
    	return "redirect:getComm";
    }
	
	//이미지등록
    @PostMapping("/uploadImg")
    @ResponseBody
    public String uploadImg(CommunityVO vo, HttpServletRequest req) throws IllegalStateException, IOException {
    	// 첨부 파일 처리
    	        String path = "/resources/main/images/";
    	 		String realPath = req.getSession().getServletContext().getRealPath(path);
    	 		MultipartFile uploadFile = vo.getUploadFile();
    	 		String comm_filename = "";
    	 		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
    	 			String filename = uploadFile.getOriginalFilename();
    	 			// 파일명 중복체크 -> rename
    	 			File rename = FileRenamePolicy.rename(
    	 					new File(realPath, filename));
    	 			comm_filename = rename.getName();
    	 			uploadFile.transferTo(rename); // 임시폴더에서 업로드 폴더로 이동
    	 		} 
    	 		return req.getContextPath() + path + URLEncoder.encode(comm_filename, "UTF-8");
    }
    
    //수정폼
    @RequestMapping("/updateComm")
    public String updateComm(Model model, CommunityVO vo, CommPagingVO pagingvo) {
    	model.addAttribute("communityVO", communityService.getSchComm(vo));
    	return "community/updateComm";
    }
    	
	//수정처리
    @PostMapping("/updateComm")
    public String updateCommProc(CommunityVO vo, CommPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	communityService.updateComm(vo);
    	return "redirect:getSchComm?comm_no="+vo.getComm_no()+"&page="+pagingvo.getPage();
    }
    
    //삭제처리
    @RequestMapping("/deleteComm") //원래 get으로 처리하는 게 정석인데 삭제 버튼이 post 폼 안에 묶여있어서 request로 바꿈.
    public String deleteCommProc(CommunityVO vo, CommPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	communityService.deleteComm(vo);
		return "redirect:getComm?page="+pagingvo.getPage();	
    }

}

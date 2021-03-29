package co.finalproject.farm.app.notice.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.notice.service.NoticeService;
import co.finalproject.farm.app.notice.service.NoticeVO;


@Controller
public class NoticeController {
	
	@Autowired NoticeService noticeService;
	
	Logger logger = LoggerFactory.getLogger(NoticeController.class);
    
	//게시글 목록
    @RequestMapping("/getNotices")
    public String  getNotices(Model model) {
    	model.addAttribute("list", noticeService.getNotices(null) );
    	return "notice";
    }
    
    //단건 조회
    @RequestMapping("/getSearchNotices")
    public String  getSearchNotices(Model model) {
    	model.addAttribute("list", noticeService.getSearchNotices(null) );
    	return "";
    }
    
	//등록폼
    @GetMapping("/insertNotices")
    public String insertNotices(Model model) {
    	return "notice/insertNotice";
    	
    }
	
	//등록처리
    @PostMapping("/insertNotices")
    public String insertNoticesProc(NoticeVO vo) {
    	logger.debug(vo.toString());
    	noticeService.insertNotices(vo);
    	return "";
    }
    	
	//수정폼
    @GetMapping("/updateNotices")
    public String updateNotices(NoticeVO vo, Model model) {
    	model.addAttribute("NoticeVO", noticeService.getSearchNotices(vo));
    	return "notice/updateNotice";
    }
	
	//수정처리
    @PostMapping("/updateNotices")
    public String updateNoticesProc(NoticeVO vo) {
    	logger.debug(vo.toString());
    	noticeService.updateNotices(vo);
    	return "";
    }
    
    //삭제처리
    @PostMapping("/deleteNotices")
    public String deleteNoticesProc(NoticeVO vo) {
    	logger.debug(vo.toString());
    	noticeService.deleteNotices(vo);
		return "";	
    }
	
}

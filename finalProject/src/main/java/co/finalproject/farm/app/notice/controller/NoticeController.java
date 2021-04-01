package co.finalproject.farm.app.notice.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.finalproject.farm.app.notice.service.NoticePagingVO;
import co.finalproject.farm.app.notice.service.NoticeService;
import co.finalproject.farm.app.notice.service.NoticeVO;
import co.finalproject.farm.common.Paging;


@Controller
public class NoticeController {
	
	@Autowired NoticeService noticeService;
	
	Logger logger = LoggerFactory.getLogger(NoticeController.class);
    
	//게시글 목록
    @RequestMapping("/getNotices")
    public String  getNotices(NoticePagingVO vo, Paging paging, Model model) {
    	paging.setPageUnit(7); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(4); //페이지 번호수
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(noticeService.getCount(vo)); 
		model.addAttribute("paging", paging);
    	model.addAttribute("list", noticeService.getNotices(vo) );
    	return "notice";
    }
    
    //단건 조회 ( + 조회수 증가 )
    @RequestMapping("/getSearchNotices")
    public ModelAndView getSearchNotices(HttpSession session, Model model, NoticeVO vo, NoticePagingVO pagingvo) {
    	noticeService.updatereviewcnt(vo, session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/selectNotice");
        // 뷰에 전달할 데이터
        mav.addObject("NoticeVO", noticeService.getSearchNotices(vo));
        return mav;
    }

    
	//등록폼
    @RequestMapping("/insertNotices")
    public String insertNotices(Model model) {
    	return "notice/insertNotice";
    }
	
	//등록처리
    @PostMapping("/insertNotices")
    public String insertNoticesProc(NoticeVO vo, NoticePagingVO pagingvo) {
    	logger.debug(vo.toString());
    	noticeService.insertNotices(vo);
    	return "redirect:getNotices";
    }
    	
	//수정처리
    @PostMapping("/updateNotices")
    public String updateNoticesProc(NoticeVO vo, NoticePagingVO pagingvo) {
    	logger.debug(vo.toString());
    	noticeService.updateNotices(vo);
    	return "redirect:getSearchNotices?notice_no="+vo.getNotice_no()+"&page="+pagingvo.getPage();
    }
    
    //삭제처리
    @RequestMapping("/deleteNotices") //원래 get으로 처리하는 게 정석인데 삭제 버튼이 post 폼 안에 묶여있어서 request로 바꿈.
    public String deleteNoticesProc(NoticeVO vo, NoticePagingVO pagingvo) {
    	logger.debug(vo.toString());
    	noticeService.deleteNotices(vo);
		return "redirect:getNotices?page="+pagingvo.getPage();	
    }
	
}

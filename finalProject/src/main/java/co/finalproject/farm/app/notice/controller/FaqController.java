package co.finalproject.farm.app.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.notice.service.FaqPagingVO;
import co.finalproject.farm.app.notice.service.FaqService;
import co.finalproject.farm.app.notice.service.FaqVO;
import co.finalproject.farm.common.Paging;


@Controller
public class FaqController {
	
	@Autowired FaqService faqService;
	
	Logger logger = LoggerFactory.getLogger(FaqController.class);
    
	//게시글 목록
    @RequestMapping("/getFaq")
    public String getFaq(FaqPagingVO vo, Paging paging, Model model) {
    	paging.setPageUnit(10); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(5); //페이지 번호수
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(faqService.getCount(vo)); 
		model.addAttribute("paging", paging);
    	model.addAttribute("list", faqService.getFaq(vo) );
    	return "faq/faq";
    }
    
    //단건 조회 
    @RequestMapping("/getSearchFaq")
    public String getSearchFaq (Model model, FaqVO vo, FaqPagingVO pagingvo) {
    	model.addAttribute("faq", faqService.getSearchFaq(vo));
        return "faq/selectFaq";
    }

    
	//등록폼
    @RequestMapping("/insertFaq")
    public String insertFaq(Model model) {
    	return "faq/insertFaq";
    }
	
	//등록처리
    @PostMapping("/insertFaq")
    public String insertFaqProc(FaqVO vo, FaqPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	faqService.insertFaq(vo);
    	return "redirect:getFaq";
    }
    
    //수정폼
    @RequestMapping("/updateFaq")
    public String updateFaq(FaqVO vo, FaqPagingVO pagingvo, Model model) {
    	model.addAttribute("faq", faqService.getSearchFaq(vo));
    	return "faq/updateFaq";
    }
    	
	//수정처리
    @PostMapping("/updateFaq")
    public String updateFaqProc(FaqVO vo, FaqPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	faqService.updateFaq(vo);
    	return "redirect:getSearchFaq?faq_no="+vo.getFaq_no()+"&page="+pagingvo.getPage();
    }
    
    //삭제처리
    @RequestMapping("/deleteFaq") //원래 get으로 처리하는 게 정석인데 삭제 버튼이 post 폼 안에 묶여있어서 request로 바꿈.
    public String deleteFaqProc(FaqVO vo, FaqPagingVO pagingvo) {
    	logger.debug(vo.toString());
    	faqService.deleteFaq(vo);
		return "redirect:getFaq?page="+pagingvo.getPage();	
    }
	
}

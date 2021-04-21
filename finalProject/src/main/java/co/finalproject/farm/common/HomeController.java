package co.finalproject.farm.common;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.finalproject.farm.app.admin.service.BannerVO;
import co.finalproject.farm.app.admin.service.impl.BannerMapper;
import co.finalproject.farm.app.community.service.CommPagingVO;
import co.finalproject.farm.app.community.service.impl.CommunityMapper;
import co.finalproject.farm.app.notice.service.NoticePagingVO;
import co.finalproject.farm.app.notice.service.impl.NoticeMapper;

@Controller
public class HomeController {
	@Autowired BannerMapper 	 bannerMapper;
	@Autowired CommunityMapper   communityMapper;
	@Autowired NoticeMapper 	 noticeMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, NoticePagingVO nvo, CommPagingVO cvo, BannerVO bvo, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
    	model.addAttribute("notice", noticeMapper.getNotices(nvo) );
    	model.addAttribute("community", communityMapper.getComm(cvo));
		model.addAttribute("banner", bannerMapper.getListBanner(bvo));

		return "home";
	}
	
}

package co.finalproject.farm.app.admin.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import co.finalproject.farm.app.admin.service.impl.BannerMapper;

@WebListener
public class BannerListener implements ServletContextListener {

    public BannerListener() {
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    }

    public void contextInitialized(ServletContextEvent sce)  {
    	WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
    	BannerMapper bannerMapper = context.getBean(BannerMapper.class);
    	sce.getServletContext().setAttribute("banner", bannerMapper.getListBanner(null));
    }
	
}

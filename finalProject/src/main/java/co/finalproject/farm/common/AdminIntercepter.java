package co.finalproject.farm.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminIntercepter implements HandlerInterceptor {

	@Override //controller 실행전
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String auth = (String) session.getAttribute("user_auth");
		if(auth == null || !auth.equals("admin")) {
			session.invalidate();
			response.sendRedirect("login");
			return false;
		}
		return true;
	}
	
}

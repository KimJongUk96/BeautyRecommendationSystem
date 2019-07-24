package com.brs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.brs.domain.AdminVO;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AdminAuthInterceptor.class);
	private static final String LOGIN = "login";

	// adminVO
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object adminVO = modelMap.get("adminVO");

		if(adminVO != null) { //관리자 로그인 
	    	  
	    	  logger.info("new login success");
	          session.setAttribute(LOGIN, adminVO);
	          
	          Object dest = session.getAttribute("dest");
	          response.sendRedirect(dest != null ? (String) dest : "/");
	    	  
	      }
	}

	// 미리 ?��?�� : HttpSession초기?��
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute(LOGIN) != null) {
			
			try {
				
				//사용자 인지 관리자 인지 확인
				AdminVO vo = (AdminVO)session.getAttribute(LOGIN);
				
			} catch (ClassCastException e) {
				logger.error("사용자 관리자 페이지 접속");
				
				response.sendRedirect("/user/login");
		         return false;
				
			}
			
		}
		
		return true;
	}
	
	
}

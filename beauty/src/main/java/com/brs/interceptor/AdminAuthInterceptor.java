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

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(AdminAuthInterceptor.class);

	// adminVO
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object adminVO = modelMap.get("adminVO");

		if(adminVO != null) { //愿�由ъ옄 濡쒓렇�씤 
	    	  
	    	  logger.info("new login success");
	          session.setAttribute(LOGIN, adminVO);
	          
	          Object dest = session.getAttribute("dest");
	          response.sendRedirect(dest != null ? (String) dest : "/method/list");
	    	  
	      }
	}

	// 誘몃━ ?占쏙옙?占쏙옙 : HttpSession珥덇린?占쏙옙
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute(LOGIN) != null) {
			
			try {
				
				//�궗�슜�옄 �씤吏� 愿�由ъ옄 �씤吏� �솗�씤
				AdminVO vo = (AdminVO)session.getAttribute(LOGIN);
				
			} catch (ClassCastException e) {
				logger.error("�궗�슜�옄 愿�由ъ옄 �럹�씠吏� �젒�냽");
				
				response.sendRedirect("/user/login");
		         return false;
				
			}
			
		}
		
		return true;
	}
	
	
}

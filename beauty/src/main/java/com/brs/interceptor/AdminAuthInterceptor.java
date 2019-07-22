package com.brs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AdminAuthInterceptor.class);
	private static final String LOGIN = "login";

	// adminVO
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");

		if (userVO != null) {

			logger.info("new login success");
			session.setAttribute(LOGIN, userVO);
			// response.sendRedirect("/");

			// 로그?�� ?��?�� 보고 ?��?�� 경로, 로그?�� ?�� 보여줘야 ?��?�� ?��?���? 경로
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
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}

		return true;
	}

}

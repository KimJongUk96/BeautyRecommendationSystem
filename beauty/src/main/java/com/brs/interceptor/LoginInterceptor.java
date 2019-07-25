package com.brs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

   private static final String LOGIN = "login";
   private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

   //UserVO, adminVO 처리
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {

      HttpSession session = request.getSession();

      ModelMap modelMap = modelAndView.getModelMap();
      Object userVO = modelMap.get("userVO");

      if (userVO != null) { //사용자 로그인

         logger.info("new login success");
         session.setAttribute(LOGIN, userVO);
         
         Object dest = session.getAttribute("dest");
         response.sendRedirect(dest != null ? (String) dest : "/");
         
      }
   }

   //미리 ?��?�� : HttpSession초기?��
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

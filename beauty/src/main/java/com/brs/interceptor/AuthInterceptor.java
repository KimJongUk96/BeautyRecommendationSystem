package com.brs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthInterceptor extends HandlerInterceptorAdapter {

   private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);


   private String saveDest(HttpServletRequest req) {

      String uri = req.getRequestURI();
      String query = req.getQueryString();
      
      String path ="/user/login";

      if (query == null || query.equals("null")) {
         query = "";
      } else {
         query = "?" + query;
      }
      
      logger.info("uri: " + uri);
      logger.info("query: " + query);

      if (req.getMethod().equals("GET")) {
         logger.info("dest: " + (uri + query));
         req.getSession().setAttribute("dest", uri + query);
      }
      

      return path;
      
   }

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {

      HttpSession session = request.getSession();

      if (session.getAttribute("login") == null) {

         logger.info("current user is not logined");

         String path = saveDest(request);
         response.sendRedirect(path);
         return false;
      }
      return true;
   }
}

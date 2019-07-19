package com.brs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.brs.domain.AdminVO;
import com.brs.domain.product.CategoryVO;
import com.brs.dto.LoginDTO;
import com.brs.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private AdminService service;
	
	// admin/login.jsp 로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
	}	
	
	// 로그인
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception{
		
		AdminVO vo = service.login(dto);
		
		logger.info("login ifo.." + vo);
		
		if(vo == null) {
			return;
		}
		
		model.addAttribute("adminVO", vo);
	}
	
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	throws Exception {
		Object obj = session.getAttribute("login");

		if(obj != null) {
			
			session.removeAttribute("login");
			session.invalidate();
			
		}
		
		return "admin/logout";

	}
	
	// 기초 정보 등록 화면으로 이동
	@RequestMapping(value = "/registerCategory", method = RequestMethod.GET)
	public void registerCategoryGET(@ModelAttribute("dto") LoginDTO dto) {
	}	
	
	// 회원가입
	@RequestMapping(value = "/registerCategory", method = RequestMethod.POST)
	public String registerCategoryPOST(CategoryVO cVO, RedirectAttributes rttr) throws Exception{
				
		logger.info("registerCategory post...");
		logger.info(cVO.toString());
				
		service.registerCategory(cVO);
				
		return "redirect:/main";
		}
	
	
}

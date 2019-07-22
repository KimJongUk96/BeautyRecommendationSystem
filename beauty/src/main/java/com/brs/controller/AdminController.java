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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.brs.domain.AdminVO;
import com.brs.domain.product.CategoryVO;
import com.brs.domain.util.PageMaker;
import com.brs.domain.util.SearchCriteria;
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
	
	
	//주현이 part
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	   public void registerGET(AdminVO admin, Model model) throws Exception {

	      logger.info("register get ..........");
	   }

	   @RequestMapping(value = "/register", method = RequestMethod.POST)
	   public String registPOST(AdminVO admin, RedirectAttributes rttr) throws Exception {

	      logger.info("register post ..........");
	      logger.info(admin.toString());

	      service.regist(admin);

	      rttr.addAttribute("result", "success");

	       /* return "/board/success"; */
	      return "redirect:/admin/list";
	   }

	   @RequestMapping(value = "/list", method = RequestMethod.GET)
	   public void listSearchPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	      logger.info(cri.toString());
	      
	      System.out.println("=====" + cri);
	      model.addAttribute("list", service.listCriteria(cri));
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);

	      pageMaker.setTotalCount(service.listCountCriteria(cri));
	      model.addAttribute("pageMaker", pageMaker);
	   }


	   @RequestMapping(value = "/read", method = RequestMethod.GET)
	   public void read(@RequestParam("adminNo") int adminNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	      model.addAttribute(service.read(adminNo));
	   }

	   @RequestMapping(value = "/remove")
	   public String remove(@RequestParam("adminNo") int adminNo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	      service.remove(adminNo);

	      rttr.addAttribute("page", cri.getPage());
	      rttr.addAttribute("perPageNum", cri.getPerPageNum());
	      rttr.addAttribute("searchType", cri.getSearchType());
	      rttr.addAttribute("keyword", cri.getKeyword());
	      rttr.addFlashAttribute("msg", "SUCCESS");

	      return "redirect:/admin/list";
	   }

	   @RequestMapping(value = "/modify", method = RequestMethod.GET)
	   public void modifyGET(@RequestParam("no") int no, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	      model.addAttribute(service.read(no));
	   }

	   @RequestMapping(value = "/modify", method = RequestMethod.POST)
	   public String modifyPOST(AdminVO admin, RedirectAttributes rttr, SearchCriteria cri) throws Exception {

	      logger.info(cri.toString());
	      service.modify(admin);
	      
	      rttr.addAttribute("page", cri.getPage());
	      rttr.addAttribute("perPageNum", cri.getPerPageNum());
	      rttr.addAttribute("searchType", cri.getSearchType());
	      rttr.addAttribute("keyword", cri.getKeyword());
	      rttr.addFlashAttribute("msg", "SUCCESS");

	      logger.info(rttr.toString());
	      
	      return "redirect:/admin/list";

	
	   }
}

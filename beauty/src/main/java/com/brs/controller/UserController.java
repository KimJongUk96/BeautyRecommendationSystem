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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.brs.domain.UserVO;
import com.brs.dto.LoginDTO;
import com.brs.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService service;

	// 로그인 화면 user/login.jsp 로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
	}

	// 로그인
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception {

		UserVO vo = service.login(dto);

		logger.info("login ifo.." + vo);

		if (vo == null) {
			return;
		}

		model.addAttribute("userVO", vo);
	}

	// 로그아웃(미완)
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		
		logger.info("logout get...");
		
		Object obj = session.getAttribute("login");

		if (obj != null) {

			session.removeAttribute("login");
			session.invalidate();

		}

		return "user/login";
	}

	// 회원가입 폼으로 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(UserVO vo, Model model) throws Exception {

		logger.info("regiser get...");
	}

	// 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("register post...");
		logger.info(vo.toString());

		service.regist(vo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/home";
	}
	
	//아이디 중복 체크
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	public @ResponseBody String checkidPOST(@RequestParam("email") String email, Model model) throws Exception{
		
		logger.info("checkid post...");
		
		int result = service.checkid(email);
		return String.valueOf(result);
	}

	// 비밀번호 확인하는 폼으로 이동
	@RequestMapping(value = "/checkpw", method = RequestMethod.GET)
	public void checkpwGET(String password, Model model) throws Exception {

		logger.info("checkpw get...");
	}

	// 비밀번호 확인 -> 내 정보 수정으로 이동
	// @RequestMapping(value = "/checkpw", method = RequestMethod.POST)
	// public String checkpwPOST(@RequestParam("password") String password, Model
	// model,
	// @RequestParam("email") String email, RedirectAttributes rttr) throws
	// Exception {
	
	// 비밀번호 확인 -> 내 정보 수정으로 이동
	@RequestMapping(value = "/checkpw", method = RequestMethod.POST)
	public String checkpwPOST(UserVO vo, Model model, RedirectAttributes rttr) throws Exception {

		logger.info("checkpw post...");

		String ckpw = service.checkpw(vo) == null ? "" : service.checkpw(vo);

		if (ckpw.equals("1")) {// 비밀번호가 일치했을 경우

			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/user/read?email=" + vo.getEmail();

		}

		model.addAttribute("msg", "FAIL");
		return "user/checkpw";
	}

	// 내 정보 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readPage(@RequestParam("email") String email, Model model) throws Exception {

		logger.info("read get...");
		
		model.addAttribute(service.read(email));
	}

	// 내 정보 수정
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPOST(UserVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("modify post...");

		service.modify(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/";
	}
	
	// 비밀번호 확인하는 폼으로 이동
	@RequestMapping(value = "/forgetpw", method = RequestMethod.GET)
	public void forgetpwGET(String email, Model model) throws Exception {

		logger.info("forgetpw get...");
	}
	
	// 아이디를 입력해서 비밀번호 찾기
	@RequestMapping(value = "/forgetpw", method = RequestMethod.POST)
	public void forgetpwPOST(@RequestParam("email") String email, Model model) throws Exception {
		
		logger.info("forgetpw post...");
		
		String pw = service.forgetpw(email) == null ? "null" : service.forgetpw(email);
		
		if (pw.equals("null")) {// 비밀번호가 일치하지 않았을 경우

			logger.info("forgetpw post... FAIL");
			model.addAttribute("msg", "FAIL");

		}

		else{
			logger.info("forgetpw post... SUCCESS");
			model.addAttribute("msg", "SUCCESS");
			model.addAttribute("password", pw);
		}

	}
		
}

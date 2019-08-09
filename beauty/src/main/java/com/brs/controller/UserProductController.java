package com.brs.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.brs.domain.product.ProductVO;
import com.brs.domain.review.ReviewVO;
import com.brs.domain.util.PageMaker;
import com.brs.domain.util.SearchCriteria;
import com.brs.service.product.UserProductService;

@Controller
@RequestMapping("/usprod")
public class UserProductController {

	private static final Logger logger = LoggerFactory.getLogger(UserProductController.class);

	@Inject
	private UserProductService service;
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		System.out.println("===========" + cri.toString());

		model.addAttribute("list", service.listSearch(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 由ъ뒪�듃
	@RequestMapping(value = "/listOrder", method = RequestMethod.GET)
	public void listPageOrder(@ModelAttribute("cri") SearchCriteria cri, String order, Model model) throws Exception {

		logger.info(cri.toString());

		System.out.println("===========" + cri.toString());

		model.addAttribute("list", service.listSearch(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("prodNo") int prodNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		logger.info("");
		model.addAttribute(service.read(prodNo));
		model.addAttribute("list", service.listReview(prodNo));

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(ProductVO vo, Model model) throws Exception {

		logger.info("regiser get...");
		logger.info(vo.toString());
		
		model.addAttribute(vo);
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(ReviewVO vo, RedirectAttributes rttr) throws Exception {

//		ReviewVO vo, 
		logger.info("register post...");
		logger.info("ReviewVO :" + vo);
//
		service.register(vo);
//
		rttr.addAttribute("prodNo", vo.getProdNo());
		rttr.addFlashAttribute("msg","review");

		return "redirect:/usprod/read";
	}

}

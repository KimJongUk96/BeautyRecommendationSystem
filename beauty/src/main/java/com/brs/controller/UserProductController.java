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

	//리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		System.out.println("==========="+cri.toString());
		
		model.addAttribute("list", service.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//세안 제품 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("prodNo") int prodNo, 
			@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
		
		logger.info("세안 제품 상세보기");
		model.addAttribute(service.read(prodNo));
		model.addAttribute("list", service.listReview(prodNo));
		
	}
	
	//리뷰 등록 화면 넘어가기
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(ProductVO vo, Model model) throws Exception {

	/*public void registerGET(@RequestParam("prodNo") int prodNo, @RequestParam("name") String name,
			@RequestParam("prodtypeNo") String prodtypeNo, @RequestParam("prodtypeName") String prodtypeName, 
			Model model) throws Exception {*/

		logger.info("regiser get...");
		logger.info(vo.toString());
	}
	
	//리뷰 등록하기
	@RequestMapping(value="register", method = RequestMethod.POST)
	public String registerPOST(ReviewVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("register post...");
		logger.info("ReviewVO :" +vo);
		
		service.register(vo);
		
		rttr.addAttribute("prodNo",vo.getProdNo());
		
		return "redirect:/usprod/read";
	}
		
}

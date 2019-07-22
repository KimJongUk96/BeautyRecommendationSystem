
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

import com.brs.domain.product.ProdSuggestVO;
import com.brs.domain.product.ProductVO;
import com.brs.domain.util.PageMaker;
import com.brs.domain.util.SearchCriteria;

import com.brs.service.product.ProductService;

@Controller
@RequestMapping("/productSuggest/*")
public class ProdSuggestController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProdSuggestController.class);
	
	@Inject
	private ProductService service;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("prodSuggest") ProdSuggestVO prodSuggest, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
        logger.info(cri.toString());
		
		System.out.println("====" + cri.toString());
		model.addAttribute("list", service.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131);
		
		// button을 몇개 만들어야 하는지를 담당하는 부분
		pageMaker.setTotalCount(service.listSearchCount(cri)); //fixed
		
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("prodSuggestVO", prodSuggest);
	}
	
	
	@RequestMapping(value = "/infoInput", method = RequestMethod.GET)
	public void prodSuggestionGET() throws Exception {
		
		logger.info("infoInput get .........");
	}
	
	// data 형식 [prodNo : 추첨점수] -> 제품 10개 추천 
	
	@RequestMapping(value = "/infoInput", method = RequestMethod.POST)
	public String prodSuggestionPOST(ProdSuggestVO prodSuggest, RedirectAttributes rttr) throws Exception {
		logger.info("infoInput post .........");
		logger.info(prodSuggest.toString());
		
		//service.create(product);
		//rttr.addFlashAttribute("msg", "");
		rttr.addAttribute("gender", prodSuggest.getGender());
		rttr.addAttribute("age", prodSuggest.getAge());
		rttr.addAttribute("skinType", prodSuggest.getSkinType());
		return "redirect:/productSuggest/list";
		
	}
	
	
	
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("prodNo") int prodNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute(service.read(prodNo));
	}
	

	

	

}

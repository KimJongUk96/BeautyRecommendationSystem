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

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.util.MethodSuggestCriteria;
import com.brs.domain.util.PageMaker;
import com.brs.service.method.MethodDetailService;
import com.brs.service.method.MethodSuggestService;

@Controller
@RequestMapping("/methodSuggest/*")
public class MethodSuggestController {
	
	private static final Logger logger = LoggerFactory.getLogger(MethodSuggestController.class);
	
	@Inject
	private MethodSuggestService service;
	
	@Inject
	private MethodDetailService detailService;
	
	
	@RequestMapping(value="/suggest", method=RequestMethod.GET)
	public void Suggest(MethodSuggestVO mVO, Model model) throws Exception{
		//세안법 추천 화면 method
	}
	
	
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public void ListPost(MethodSuggestCriteria cri, Model model) throws Exception{
		//세안법 추천 결과 화면 method
		
		logger.info(cri.toString());
		
		model.addAttribute("methodList", service.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.countPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("methodNo") int methodNo,
						 @ModelAttribute("dVO") MethodDetailVO dVO,
						 @ModelAttribute("cri") MethodSuggestCriteria cri, Model model) throws Exception {
		
		logger.info("methodNo: " + methodNo);
	
		model.addAttribute(service.read(methodNo));
		
		model.addAttribute("detailList", detailService.readDetail(dVO));
		model.addAttribute("prodList", detailService.prodList());
		
		
		
	}

}

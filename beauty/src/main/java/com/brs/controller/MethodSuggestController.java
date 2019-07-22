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

import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.method.MethodVO;
import com.brs.domain.util.MethodSuggestCriteria;
import com.brs.service.method.MethodSuggestService;

@Controller
@RequestMapping("/methodSuggest/*")
public class MethodSuggestController {
	
	private static final Logger logger = LoggerFactory.getLogger(MethodSuggestController.class);
	
	@Inject
	private MethodSuggestService service;
	
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void Read(@ModelAttribute("mVO") MethodVO mVO, 
			@ModelAttribute("cri") MethodSuggestCriteria cri, @RequestParam("methodNo") int methodNo, Model model)throws Exception {
		 
		model.addAttribute(service.read(mVO));
		
		model.addAttribute("read", service.read(mVO));
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
//	@RequestMapping(value="suggest", method=RequestMethod.POST)
//	public String suggest(MethodSuggestVO mVO, @ModelAttribute("cri") MethodSuggestCriteria cri) throws Exception{
//		
//		logger.info("mVo : " + mVO.toString());
//		
//		/*rttr.addAttribute(mVO.getSkinType());
//		rttr.addAttribute(mVO.getMakeUp());
//		rttr.addAttribute(mVO.getWeather());
//		rttr.addAttribute(mVO.getDust());*/
//		
//		
//		return "redirect:/methodSuggest/list";
//	}
	
	@RequestMapping(value="suggest", method=RequestMethod.POST)
	public String suggest(MethodVO mVo, RedirectAttributes rttr) throws Exception{
		
		logger.info("mVo : " + mVo.toString());
		
		rttr.addAttribute("list", service.search(mVo));
		System.out.println(service.search(mVo));
		
		return "redirect:/methodSuggest/list";
	}
	
	@RequestMapping(value="suggest", method=RequestMethod.GET)
	public void Suggest() throws Exception{
		
	}

	
//	@RequestMapping(value="list", method=RequestMethod.GET)
//	public void List(@ModelAttribute("cri") MethodSuggestCriteria cri, MethodSuggestVO mVO, Model model) throws Exception{
//		model.addAttribute("list", service.listCriteria(cri));
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		
//		pageMaker.setTotalCount(service.countPaging(cri));
//		
//		model.addAttribute("pageMaker", pageMaker);
//		
//	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void List(MethodSuggestVO mVO) throws Exception{
		
		
	}

}

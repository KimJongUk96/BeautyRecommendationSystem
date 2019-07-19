package com.brs.controller;




import java.util.List;

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

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.method.MethodVO;
import com.brs.domain.util.PageMaker;
import com.brs.domain.util.SearchCriteria;
import com.brs.service.method.MethodDetailService;
import com.brs.service.method.MethodService;

@Controller
@RequestMapping("/method/*")
public class MethodController {

	private static final Logger logger = LoggerFactory.getLogger(MethodController.class);
	
	@Inject
	private MethodService service;
	
	@Inject
	private MethodDetailService detailservice;
	
	//등록
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void methodRegisterGET(MethodVO mVO, MethodDetailVO dVO, Model model) throws Exception {
		model.addAttribute("prodList", detailservice.prodList());
		//model.addAttribute("prodTypeList", detailservice.prodTypeList());
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String methodRegisterPOST(MethodVO mVO, 
			@RequestParam(value="method", required=true) List<String> methods,
			@RequestParam(value="prodNo", required=true) List<String> prodNos,
			RedirectAttributes rttr)throws Exception{
		
		//세안법(TBL_METHOD) 저장
		Integer methodNo = service.create(mVO);
		logger.info("methodNo : " + mVO);
		
		logger.info("method.size() : " + methods.size());
		logger.info("prodNos.size() : " + prodNos.size());
		
		for(int i=1; i<=mVO.getMethodStep(); i++ ) {
			
			MethodDetailVO newVo = new MethodDetailVO();
			//세안법 등록한 PK 가져와서 디데일에 부모키(FK) setting
			newVo.setMethodNo(methodNo);
			
			//Step별 setting
			newVo.setStep(i);
			newVo.setMethod(methods.get(i-1));
			newVo.setProdNo(Integer.parseInt(prodNos.get(i-1)));
			
			logger.info("newVo : " + newVo.toString());
			
			detailservice.insert(newVo);
			
		}
		
		return "redirect:/method/list";
	}
	
	//리스트
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void methodList(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
		
		model.addAttribute("methodList", service.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	//상세조회
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void methodRead(@ModelAttribute("mVO") MethodDetailVO mVO, 
			@ModelAttribute("cri") SearchCriteria cri, @RequestParam("methodNo") int methodNo, Model model)throws Exception {
		//method 상세조회 
		model.addAttribute(service.readMethod(methodNo));
		//methodDetail 리스트 (가져와서 분기해주기)
		model.addAttribute("detailList", detailservice.readDetail(mVO));
		//prodNo 리스트 가져오기
		model.addAttribute("prodList", detailservice.prodList());
	}
	
	@RequestMapping(value="/modifyPage", method = RequestMethod.GET)
	public void methodModify(@ModelAttribute("mVO") MethodDetailVO mVO, 
			@ModelAttribute("cri") SearchCriteria cri, 
			@RequestParam("methodNo") int methodNo, Model model)throws Exception {
		
		model.addAttribute(service.readMethod(methodNo));
		model.addAttribute("detailList", detailservice.readDetail(mVO));
		model.addAttribute("prodList", detailservice.prodList());
	}
	
	@RequestMapping(value="/modifyPage", method = RequestMethod.POST)
	public String methodModifyPOST(MethodVO mVO, MethodDetailVO dVO,
			@RequestParam(value="method", required=true) List<String> methods,
			@RequestParam(value="prodNo", required=true) List<String> prodNos,
			RedirectAttributes rttr, SearchCriteria cri)throws Exception {
		
			Integer methodNo = service.methodUpdate(mVO);
		
		for(int i=1; i<=mVO.getMethodStep(); i++ ) {
			
			MethodDetailVO newVo = new MethodDetailVO();
			
			newVo.setMethodNo(methodNo);
			//Step별 setting
			newVo.setStep(i);
			newVo.setMethod(methods.get(i-1));
			newVo.setProdNo(Integer.parseInt(prodNos.get(i-1)));
			
			logger.info("newVo : " + newVo.toString());
			
			detailservice.detailUpdate(newVo);
		}
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/method/list";
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("methodNo") int methodNo, SearchCriteria cri, RedirectAttributes rttr)throws Exception {
		
		detailservice.detailRemove(methodNo);
		service.removeMethod(methodNo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/method/list";
	}
}

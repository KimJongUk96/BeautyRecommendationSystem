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

import com.brs.domain.product.ProdTypeVO;
import com.brs.domain.util.Criteria;
import com.brs.domain.util.PageMaker;
import com.brs.service.product.ProdTypeService;

@Controller
@RequestMapping("/prodtype/*")
public class ProdTypeController {

	private static final Logger logger = LoggerFactory.getLogger(MethodController.class);
	
	@Inject
	private ProdTypeService service;

	
	@RequestMapping(value="register", method = RequestMethod.GET)
	public void registerGET(ProdTypeVO pVO, Model model) throws Exception{
		
	}
	//prodtype등록,msg
	@RequestMapping(value="register", method = RequestMethod.POST)
	public String registerPOST(ProdTypeVO pVO, RedirectAttributes rttr) throws Exception{
		
		String res = service.check(pVO) == null ? "":service.check(pVO);
		
		
		
		if(res.equals("1")) {
			rttr.addFlashAttribute("msg", "ERROR");
			return "redirect:/prodtype/list";
		}
		
		service.create(pVO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/prodtype/list";
		
	}
	//list, countPaging
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		model.addAttribute("list", service.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.countPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	//상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readPage(@RequestParam("prodtypeNo") int prodtypeNo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("prodtypeNo : "+ prodtypeNo);
		model.addAttribute(service.read(prodtypeNo));
	}
	//수정 후 상세보기 페이지로 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("prodtypeNo") int prodtypeNo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		model.addAttribute(service.read(prodtypeNo));
	}
	//수정, msg
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPagingPOST(ProdTypeVO pVO, RedirectAttributes rttr, Criteria cri) throws Exception{
		
		service.update(pVO);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "MODSUCCESS");
		
		return "redirect:/prodtype/list";
	}
	//삭제 후 리스트 페이지로 이동
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("prodtypeNo") int prodtypeNo, Criteria cri, RedirectAttributes rttr) throws Exception{
		
		service.delete(prodtypeNo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "DELSUCCESS");
		
		
		return "redirect:/prodtype/list";
	}
}

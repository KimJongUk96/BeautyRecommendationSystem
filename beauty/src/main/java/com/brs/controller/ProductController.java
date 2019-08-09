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
import com.brs.domain.util.PageMaker;
import com.brs.domain.util.SearchCriteria;
import com.brs.service.product.ProdTypeService;
import com.brs.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService service;
	
	@Inject
	private ProdTypeService typeService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info(cri.toString());
		
		System.out.println("====" + cri.toString());
		model.addAttribute("prodTypeList", typeService.getAllType());
		model.addAttribute("list", service.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131);
		
		// button�쓣 紐뉕컻 留뚮뱾�뼱�빞 �븯�뒗吏�瑜� �떞�떦�븯�뒗 遺�遺�
		pageMaker.setTotalCount(service.listSearchCount(cri)); //fixed
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("prodNo") int prodNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute("prodTypeList", typeService.getAllType());
		model.addAttribute(service.read(prodNo));
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(Model model) throws Exception {
		logger.info("regist get .........");
		model.addAttribute("prodTypeList", typeService.getAllType());
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(ProductVO product, RedirectAttributes rttr) throws Exception {
		logger.info("regist post .........");
		logger.info(product.toString());
		
		service.create(product);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/product/list";
		
	}
	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("prodNo") int prodNo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.delete(prodNo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "DELETE");
		
		return "redirect:/product/list";
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("prodNo") int prodNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute("prodTypeList", typeService.getAllType());
		model.addAttribute(service.read(prodNo));
	}
	
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(ProductVO product, RedirectAttributes rttr, SearchCriteria cri) throws Exception {
		
		
		System.out.println(product.toString());
		service.update(product);
		
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "MODIFY");
		
		return "redirect:/product/list";
	}

}

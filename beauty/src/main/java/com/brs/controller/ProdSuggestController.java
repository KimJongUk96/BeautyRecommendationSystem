package com.brs.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.brs.domain.product.ProdSuggestVO;
import com.brs.domain.product.ProductVO;
import com.brs.domain.util.PageMaker;
import com.brs.domain.util.SearchCriteria;
import com.brs.service.product.ProdTypeService;
import com.brs.service.product.ProductService;
import com.brs.service.product.UserProductService;
import com.brs.service.review.ReviewService;

@Controller
@RequestMapping("/productSuggest/*")
public class ProdSuggestController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProdSuggestController.class);
	
	@Inject
	private ProductService service;
	
	@Inject
	private ProdTypeService typeService;
	
	@Inject
	private ReviewService reviewService;
	
	public String remakeJSON(String result) {
		String remake = "";
		for(int i=0; i<result.length(); i++) {
        	if(result.charAt(i) == '"' || result.charAt(i) == '{' || result.charAt(i) == '}'  ) {
        		continue;
        	}
        	remake = remake + result.charAt(i);
        }
		System.out.println("json remaked = " + remake);
		return remake;
	}
	
	public int[] findProdNums(String jsonRemaked, int[] prodNums) {
		String[] jsonSplit = jsonRemaked.split(",");
        String[] jsonSplit2 = jsonSplit[2].split(":");
        jsonSplit[2] = jsonSplit2[1]+":"+jsonSplit2[2];
        
        for(int i=0; i<jsonSplit.length; i++) {
        	System.out.println(i + " == " + jsonSplit[i]);
        }

        for(int i=2; i<jsonSplit.length; i++) {
        	int index = jsonSplit[i].indexOf(":");
        	prodNums[i-2] = Integer.parseInt(jsonSplit[i].substring(0, index));
        }
        return prodNums;
	}
	
	public double[] findProdSugs(String jsonRemaked, double[] prodSugs) {
		String[] jsonSplit = jsonRemaked.split(",");
        String[] jsonSplit2 = jsonSplit[2].split(":");
        jsonSplit[2] = jsonSplit2[1]+":"+jsonSplit2[2];

        for(int i=2; i<jsonSplit.length; i++) {
        	int index = jsonSplit[i].indexOf(":");
        	if(Double.valueOf(jsonSplit[i].substring(index+1, index+6)) > 5.0) {
        		prodSugs[i-2] = 5.0;
        	}else {
        		prodSugs[i-2] = Double.valueOf(jsonSplit[i].substring(index+1, index+6));
        	}
        	
        }
        return prodSugs;
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage() throws Exception {
		
        logger.info("suggest list....");
        
        
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public void listPagePOST(ProdSuggestVO prodSuggest, Model model) throws Exception {
		logger.info("infoInput post .........");
		logger.info(prodSuggest.toString());
		
		
		int num = 10;
        String inputInfo = "";
        int[] prodNums = new int[num]; //제품 번호 저장된 배열 (추천순위 높은 순으로)
        double[] prodSugs = new double[num]; // 제품 추천 적합 점수 저장된 배열 (추천순위 높은 순으로)
        inputInfo = prodSuggest.getGender() + prodSuggest.getAge() + prodSuggest.getSkinType();
        
        String Url = "http://beautyrec.run.goorm.io/topNRec?num="+num+"&user="+inputInfo;
        
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(Url, String.class);
        String remaked = remakeJSON(result);
        String[] remakedArr = remaked.split(",");
        
        if(remakedArr[0].substring(remakedArr[0].indexOf(":")+1, remakedArr[0].length()).equals("100")){
	        prodNums = findProdNums(remakeJSON(result), prodNums);
	        prodSugs = findProdSugs(remakeJSON(result), prodSugs);
	        
	        model.addAttribute("prodSuggestVO", prodSuggest);
			model.addAttribute("list", service.foundProd(prodNums));
			model.addAttribute("sugs", prodSugs);
			model.addAttribute("prodTypeList", typeService.getAllType());
        }
        
        if(remakedArr[0].substring(remakedArr[0].indexOf(":")+1, remakedArr[0].length()).equals("102")) {
        	model.addAttribute("msg", "ERROR");
        	model.addAttribute("prodSuggestVO", prodSuggest);
        }
		
	}
	
		
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		model.addAttribute("prodTypeList", typeService.getAllType());
	
		model.addAttribute("list", reviewService.readProdReview(prodNo));
		
		model.addAttribute(service.read(prodNo));
	}
	

	

	

	

}

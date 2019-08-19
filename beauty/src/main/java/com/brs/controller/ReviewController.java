package com.brs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.brs.domain.review.ReviewVO;
import com.brs.service.review.ReviewService;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
 
import au.com.bytecode.opencsv.CSVWriter;

@Controller
@RequestMapping("/product/*")
public class ReviewController {
		
private static final Logger logger = LoggerFactory.getLogger(ProdSuggestController.class);
	
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
	
	 public File writeCsv(List<ReviewVO> reviews, String fileName) {
		   File file = new File(fileName);
		   FileWriter fileWriter = null;
		   CSVWriter writer = null;

		  try {
		    file.createNewFile();
		    fileWriter = new FileWriter(file);
		    writer = new CSVWriter(fileWriter);
		    String[] data= new String[3]; //1줄에 들어갈 데이터 사이즈 선언
		  
		  // 1줄에 들어갈 데이터로 다음과 같은 형태로 입력 됨. ex)"U120NE","1000", "4.523"
		    for(ReviewVO review: reviews){ 
		      data[0] = review.getUserGender() + review.getUserAge() + review.getUserSkinType();
		      data[1] = Integer.toString(review.getProdNo());
		      data[2] = Double.toString(review.getRating());
		      //System.out.println(data[0] + data[1] + data[2]);
		      writer.writeNext(data);
		    }   
		    writer.flush();
		  } catch (IOException e) {
		    e.printStackTrace();
		  } finally {
		   try {
		     if(writer!=null) writer.close();
		     if(fileWriter!=null) fileWriter.close();
		   } catch (IOException e) {}
		  }
		  
		  return file;
	    }
	 
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String reviewUpload(RedirectAttributes rttr) throws Exception {
		logger.info("reviewUpload ....");
		
		String url = "http://beautyrec.run.goorm.io/directUploadReviewSet";
		String url2 = "http://beautyrec.run.goorm.io/train";
		List<ReviewVO> latestReviews = reviewService.getAllReview();
		
		File change2Csv = writeCsv(latestReviews, "beautyReview.csv");
		
        FileSystemResource resource = new FileSystemResource(change2Csv);
        MultiValueMap<String, Object> param = new LinkedMultiValueMap<>();
        param.add("file", resource);
        
		RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.postForObject(url, param, String.class);
        
        String remaked = remakeJSON(result);
        String[] remakedArr = remaked.split(",");
        //System.out.println("업로드 후 결과 코드 ==> " + remakedArr[0].substring(remakedArr[0].indexOf(":")+1, remakedArr[0].length()));
        
        if(remakedArr[0].substring(remakedArr[0].indexOf(":")+1, remakedArr[0].length()).equals("100")) {
        	String result2 = restTemplate.getForObject(url2, String.class);
        	String remaked2 = remakeJSON(result2);
            String[] remakedArr2 = remaked2.split(",");
            //System.out.println("훈련 후 결과 코드 ==> " + remakedArr2[0].substring(remakedArr2[0].indexOf(":")+1, remakedArr2[0].length()));
            if(remakedArr2[0].substring(remakedArr2[0].indexOf(":")+1, remakedArr2[0].length()).equals("100")) {
            	rttr.addFlashAttribute("msgAlert", "COMPLETE");
            }
        }else {
        	rttr.addFlashAttribute("msgAlert", "ERROR1");
        }
        
		return "redirect:/product/list";
	}

}

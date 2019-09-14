package com.brs.domain.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

   private int totalCount;
   private int startPage;
   private int endPage;
   private boolean prev; 
   private boolean next;

   private int displayPageNum = 10;

   private Criteria cri; 

   public void setCri(Criteria cri) {
      this.cri = cri;
   }

   public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;

      calcData();
   }

   private void calcData() {

      endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum); //displayPageNum ?占쏙옙?占쏙옙?占쏙옙?占쏙옙占�? 蹂댁뿬占�? ?占쏙옙?占쏙옙占�? 踰꾪듉?占쏙옙 ?占쏙옙

      startPage = (endPage - displayPageNum) + 1;

      int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

      if (endPage > tempEndPage) {
         endPage = tempEndPage;
      }

      prev = startPage == 1 ? false : true;

      next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

   }

   public int getTotalCount() {
      return totalCount;
   }

   public int getStartPage() {
      return startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public boolean isPrev() {
      return prev;
   }

   public boolean isNext() {
      return next;
   }

   public int getDisplayPageNum() {
      return displayPageNum;
   }

   public Criteria getCri() {
      return cri;
   }

   public String makeQuery(int page) { //?占쏙옙?占쏙옙占�? 踰꾪듉?占쏙옙 ?占쏙옙?占쏙옙

      UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page) 
            .queryParam("perPageNum", cri.getPerPageNum()).build();

      return uriComponents.toUriString();
   }

   public String makeSearch(int page) {

      UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
            .queryParam("perPageNum", cri.getPerPageNum())
            .queryParam("searchType", ((SearchCriteria) cri).getSearchType())
            .queryParam("keyword", ((SearchCriteria) cri).getKeyword()).build();

      return uriComponents.toUriString();
   }
   
   public String methodSuggest(int page) {
	   UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
			   .queryParam("perPageNum", cri.getPerPageNum())
			   .queryParam("skinType", ((MethodSuggestCriteria) cri).getSkinType())
			   .queryParam("makeUpDegree", ((MethodSuggestCriteria) cri).getMakeUpDegree())
			   .queryParam("weather", ((MethodSuggestCriteria) cri).getWeather())
			   .queryParam("dust", ((MethodSuggestCriteria) cri).getDust()).build();
	   
	   return uriComponents.toUriString();
   }

}
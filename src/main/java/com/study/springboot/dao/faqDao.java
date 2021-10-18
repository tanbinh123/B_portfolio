package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.faqDto;

public interface faqDao {

	
	public faqDto view (int faq_idx) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<faqDto> listPageSearch(
			@Param("displayPost")int displayPost,@Param("postNum") int postNum,@Param("searchType") String searchType,@Param("keyword") String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(@Param("searchType") String searchType,@Param("keyword") String keyword) throws Exception;	
		
}

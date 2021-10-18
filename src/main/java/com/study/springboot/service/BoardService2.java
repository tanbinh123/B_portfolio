package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.BoardVO2;


public interface BoardService2 {

	
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO2> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
}

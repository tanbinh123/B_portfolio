package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.cancelDto;

public interface CancelService {

	
	public void cancel_submit(cancelDto dto) throws Exception;
	
	
	
	// 게시물 목록 + 페이징 + 검색
	public List<cancelDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
	
	
	public cancelDto cancel_view (int cancel_idx) throws Exception;
	
	
}

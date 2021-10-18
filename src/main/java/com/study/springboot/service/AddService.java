package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.BoardVO2;
import com.study.springboot.dto.addDto;


public interface AddService {

	
	// 게시물 목록 + 페이징 + 검색
	public List<addDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;

	public int add_items_write( String add_title, int add_price, String add_content, int add_count,
			String add_img);
	

	public addDto admin_items_add_view(int add_idx) throws Exception;
	public int admin_items_add_modify(addDto dto) throws Exception;
	
	// 게시물 삭제
	public void admin_items_add_delete(int add_idx) throws Exception;
	
	public addDto review_add(String add_title) throws Exception;
}

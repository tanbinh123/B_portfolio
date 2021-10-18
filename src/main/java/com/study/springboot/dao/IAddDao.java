package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardVO2;
import com.study.springboot.dto.addDto;

public interface IAddDao {

	
	// 게시물 목록 + 페이징 + 검색
	public List<addDto> listPageSearch(
			@Param("displayPost")int displayPost,@Param("postNum") int postNum,@Param("searchType") String searchType,@Param("keyword") String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(@Param("searchType") String searchType,@Param("keyword") String keyword) throws Exception;

	public int add_items_write(addDto dto);	
	
	public addDto admin_items_add_view(int add_idx) throws Exception;


	public int admin_items_add_modify(addDto dto) throws Exception;

	// 게시뮬 삭제
	public void admin_items_add_delete(int add_idx) throws Exception;

	public addDto review_add(String add_title) throws Exception;
	
		
}

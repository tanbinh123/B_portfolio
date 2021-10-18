package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardVO;

public interface BoardDAO {
	
	// 게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 게시물 작성
	public void write(BoardVO vo) throws Exception;

	// 게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	// 게시뮬 삭제
	public void delete(int bno) throws Exception;

	
	
	// 게시물 총 갯수
	public int count() throws Exception;	

	
	
	// 게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSearch(
			@Param("displayPost")int displayPost,@Param("postNum") int postNum,@Param("searchType") String searchType,@Param("keyword") String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(@Param("searchType") String searchType,@Param("keyword") String keyword) throws Exception;	
		
		
}

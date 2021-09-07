package com.study.springboot.service;

import java.util.List;

<<<<<<< HEAD

import com.study.springboot.dto.BoardVO;
=======
import com.study.springboot.domain.BoardVO;
>>>>>>> 56b575679a692641989521ce93b3245ab280a074


public interface BoardService {

	// 게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 게시물 작성
	public void write(BoardVO vo) throws Exception;

	// 게시물 조회
<<<<<<< HEAD
	public BoardVO view(int bno) throws Exception;
=======
	public BoardVO view(int notice_idx) throws Exception;
>>>>>>> 56b575679a692641989521ce93b3245ab280a074

	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	// 게시물 삭제
<<<<<<< HEAD
	public void delete(int bno) throws Exception;
=======
	public void delete(int notice_idx) throws Exception;
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
	
	
	
	// 게시물 총 갯수
	public int count() throws Exception;

	
	
	// 게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
}

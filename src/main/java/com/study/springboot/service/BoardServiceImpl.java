package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.BoardDAO;
<<<<<<< HEAD
import com.study.springboot.dto.BoardVO;
=======
import com.study.springboot.domain.BoardVO;

>>>>>>> 56b575679a692641989521ce93b3245ab280a074

@Service
public class BoardServiceImpl implements BoardService {

<<<<<<< HEAD

	@Autowired(required=false)
=======
	@Autowired
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
	private BoardDAO dao;
	
	// 게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {

		return dao.list();
	}

	// 게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		
		dao.write(vo);
	}

	// 게시물 조회
	@Override
<<<<<<< HEAD
	public BoardVO view(int bno) throws Exception {

		return dao.view(bno);
=======
	public BoardVO view(int notice_idx) throws Exception {

		return dao.view(notice_idx);
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
	}

	// 게시물 수정
	@Override
	public void modify(BoardVO vo) throws Exception {
		
		dao.modify(vo);
	}

	// 게시물 삭제
	@Override
<<<<<<< HEAD
	public void delete(int bno) throws Exception {
		dao.delete(bno);
=======
	public void delete(int notice_idx) throws Exception {
		dao.delete(notice_idx);
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
	}

	
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	
	
	// 게시물 목록 + 페이징
	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<BoardVO> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
<<<<<<< HEAD
		
=======
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
		return dao.searchCount(searchType, keyword);
	}
}

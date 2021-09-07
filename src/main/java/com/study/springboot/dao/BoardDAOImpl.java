package com.study.springboot.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import com.study.springboot.dto.BoardVO;
=======
import com.study.springboot.domain.BoardVO;


>>>>>>> 56b575679a692641989521ce93b3245ab280a074

@Repository
public class BoardDAOImpl implements BoardDAO {

<<<<<<< HEAD
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.study.springboot.dao.BoardDAO";
=======
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.board";
>>>>>>> 56b575679a692641989521ce93b3245ab280a074

	// 게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {	
		
		return sql.selectList(namespace + ".list");
	}

	// 게시물작성
	@Override
	public void write(BoardVO vo) throws Exception {
			
		sql.insert(namespace + ".write", vo);
	}

	// 게시물 조회
	@Override
<<<<<<< HEAD
	public BoardVO view(int bno) throws Exception {
	
		return sql.selectOne(namespace + ".view", bno);
=======
	public BoardVO view(int notice_idx) throws Exception {
	
		return sql.selectOne(namespace + ".view", notice_idx);
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
	}

	// 게시물 수정
	@Override
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	// 게시물 삭제
	@Override
<<<<<<< HEAD
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
=======
	public void delete(int notice_idx) throws Exception {
		sql.delete(namespace + ".delete", notice_idx);
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
	}

	
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");	
	}

	
	
	// 게시물 목록 + 페이징
	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {

		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}

	
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<BoardVO> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPageSearch", data);
	}
	
	// 게시물 총 갯수 + 검색 적용
	@Override
<<<<<<< HEAD
	public int searchCount(String searchType, String keyword) {
=======
	public int searchCount(String searchType, String keyword) throws Exception {
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);	
	}

		

}

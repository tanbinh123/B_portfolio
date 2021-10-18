package com.study.springboot.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.cancelDto;

@Repository
public class CancelDaoImpl implements CancelDao{

	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.study.springboot.dao.CancelDao";

	
	@Override
	public void cancel_submit(cancelDto dto) throws Exception {
		
		sql.insert(namespace +".cancel_submit", dto);
	}
	

	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<cancelDto> listPageSearch(
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
	public int searchCount(String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);	
	}
	
	@Override
	public cancelDto cancel_view(int cancel_idx) throws Exception {
		
		
		return sql.selectOne(namespace+".cancel_view", cancel_idx);
	}

}

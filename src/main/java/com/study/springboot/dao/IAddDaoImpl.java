package com.study.springboot.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.addDto;



@Repository
public class IAddDaoImpl implements IAddDao {

	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.study.springboot.dao.IAddDao";


	@Override
	public int add_items_write(addDto dto) {
		
		return sql.insert(namespace +".add_items_write", dto);
	}
	
	
	
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<addDto> listPageSearch(
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
	public addDto admin_items_add_view(int add_idx) throws Exception {
	
		return sql.selectOne(namespace + ".admin_items_add_view", add_idx);
	}

	// 게시물 수정
	@Override
	public int admin_items_add_modify(addDto dto) throws Exception {
		
		return sql.update(namespace + ".admin_items_add_modify", dto);
	}
	
	// 게시물 삭제
	@Override
	public void admin_items_add_delete(int add_idx) throws Exception {
		sql.delete(namespace + ".admin_items_add_delete", add_idx);
	}
	
	@Override
	public addDto review_add(String add_title) throws Exception {
	
		return sql.selectOne(namespace + ".review_add", add_title);
	}

}

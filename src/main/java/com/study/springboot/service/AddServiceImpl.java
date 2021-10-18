package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IAddDao;
import com.study.springboot.dto.addDto;


@Service
public class AddServiceImpl implements AddService {

	@Autowired
	private IAddDao dao;
	
	
	@Override
	public int add_items_write (String add_title, int add_price, String add_content, int add_count, String add_img ) {
		int result = 0;
		addDto dto = new addDto();
		dto.setAdd_count(add_count);
		dto.setAdd_img(add_img);
		dto.setAdd_price(add_price);
		dto.setAdd_title(add_title);
		dto.setAdd_content(add_content);
		
		result = dao.add_items_write(dto);
		return result;
	}
	
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<addDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		return dao.searchCount(searchType, keyword);
	}
	
	@Override
	public addDto admin_items_add_view(int add_idx) throws Exception {
		
		return dao.admin_items_add_view(add_idx);
	}
	
	@Override
	public int admin_items_add_modify (addDto dto) throws Exception {
		
		return dao.admin_items_add_modify(dto);
	}
	// 게시물 삭제
	@Override
	public void admin_items_add_delete(int add_idx) throws Exception {
		dao.admin_items_add_delete(add_idx);
	}

	@Override
	public addDto review_add(String add_title) throws Exception {
		
		return dao.review_add(add_title);
	}
}

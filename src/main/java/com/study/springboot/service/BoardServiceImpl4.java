package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.BoardDAO4;
import com.study.springboot.dto.shoppingDto;


@Service
public class BoardServiceImpl4 implements BoardService4 {

	@Autowired
	private BoardDAO4 dao;
	

	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<shoppingDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		return dao.searchCount(searchType, keyword);
	}
}

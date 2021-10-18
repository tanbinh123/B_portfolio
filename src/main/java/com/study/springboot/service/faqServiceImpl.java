package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.faqDao;
import com.study.springboot.dto.faqDto;


@Service
public class faqServiceImpl implements faqService {

	
	@Autowired
	private faqDao dao;
	
	
	@Override
	public faqDto view (int faq_idx) throws Exception {
		
		return dao.view(faq_idx);
	}
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<faqDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		return dao.searchCount(searchType, keyword);
	}
}

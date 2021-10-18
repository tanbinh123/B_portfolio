package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.CancelDao;
import com.study.springboot.dto.cancelDto;

@Service
public class CancelServiceImpl implements CancelService {

	
	@Autowired
	public CancelDao dao;
	
	
	@Override
	public void cancel_submit(cancelDto dto) throws Exception {
		
		dao.cancel_submit(dto);
	}
	
	
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<cancelDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		return dao.searchCount(searchType, keyword);
	}
	
	
	@Override
	public cancelDto cancel_view (int cancel_idx) throws Exception {
		
		return dao.cancel_view(cancel_idx);
	}
}

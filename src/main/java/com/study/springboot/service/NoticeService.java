package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dto.PagingVO;
import com.study.springboot.dto.noticeDto;

@Service
public class NoticeService {

	@Autowired
	public INoticeDao noticeDao;
	
	public List<noticeDto> notice_list() {
		List<noticeDto> notice_list = noticeDao.admin_notice_list();
		return notice_list;
	}
	
	public int notice_write (String notice_title, String notice_content) {
		int result = 0;
		noticeDto dto = new noticeDto();
		
		dto.setNotice_title(notice_title);
		dto.setNotice_content(notice_content);
		
		result = noticeDao.admin_notice_write(dto);
		return result;
	}
	
	public noticeDto notice_view(String notice_idx) {
		noticeDto dto = noticeDao.admin_notice_view(notice_idx);
		return dto;
	}
	
	public int notice_modify (String notice_idx, String notice_title, String notice_content) {
		
		int result = 0;
		result = noticeDao.admin_notice_modify(notice_idx, notice_title, notice_content);
		
		return result;
	}
	
	public int countBoard() {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String keyword = request.getParameter("keyword");
		String searchType = request.getParameter("searchType");
		
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		

		 
		return noticeDao.countBoard();
	}

	public List<noticeDto> selectBoard(PagingVO vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String keyword = request.getParameter("keyword");
		String searchType = request.getParameter("searchType");
		
		
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		return noticeDao.selectBoard(vo);
	}
	
	
}

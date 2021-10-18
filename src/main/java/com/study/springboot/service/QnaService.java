package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IQnaDao;
import com.study.springboot.dto.QnaDto;

@Component
public class QnaService {
	
	@Autowired
	private IQnaDao qnaDao;
	
	public List<QnaDto> qna_list() {
		List<QnaDto> qna_list = qnaDao.admin_qna_list();
		return qna_list;
	}
	
	//qna_view
	public QnaDto admin_qna_view(String qna_idx) {
		QnaDto dto = qnaDao.admin_qna_view(qna_idx);
		return dto;
	}
	
	public QnaDto qna_view(String qna_idx) {
		QnaDto dto = qnaDao.qna_view(qna_idx);
		return dto;
	}
	
	//qna 글쓰기 
	public int qna_write(String qna_title, String qna_name, String qna_pw, String qna_content) {
		int result = 0;
		QnaDto dto = new QnaDto();
		
		dto.setQna_title(qna_title);
		dto.setQna_name(qna_name);
		dto.setQna_pw(qna_pw);
		dto.setQna_content(qna_content);
		

		result = qnaDao.qna_write(dto);
		return result;
	}


	//qna글수정
	public int qna_modify(String qna_idx, String qna_title, String qna_content) {
		int result = 0;
		
		result = qnaDao.qna_modify(qna_idx, qna_title, qna_content);
		return result;
	}

	

	
}


package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IQnaReplyDao;
import com.study.springboot.dto.QnaReplyDto;

@Component
public class QnaReplyService {
	@Autowired
	private static IQnaReplyDao qnareplyDao;
	
	public static List<QnaReplyDto> qna_reply_list(String reply_qna_idx) {
		List<QnaReplyDto> qna_reply_list = qnareplyDao.qna_reply_list(reply_qna_idx);
		return qna_reply_list;
	}

}


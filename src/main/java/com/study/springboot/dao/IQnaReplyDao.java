package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.QnaReplyDto;


@Mapper
public interface IQnaReplyDao {

	public List<QnaReplyDto> qna_reply_list(String qna_idx);
	public int qna_reply( String reply_content, String reply_qna_idx );
	public int qna_reply_delete(String reply_idx);
	
}
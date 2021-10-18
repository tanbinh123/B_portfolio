package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.QnaDto;


@Mapper
public interface IQnaDao {

	public ArrayList<QnaDto> admin_qna_list();
	public QnaDto admin_qna_view(String qna_idx);

	public ArrayList<QnaDto> qna_list();
	public QnaDto qna_view(String qna_idx);
	
	public int qna_write(QnaDto dto);
	public int qna_write(String qna_title, String qna_name, String qna_pw, String qna_content);

	
	public int qna_delete(String qna_idx);

	public int qna_modify(QnaDto dto);
	public int qna_modify(String qna_idx, String qna_title, String qna_content);
}
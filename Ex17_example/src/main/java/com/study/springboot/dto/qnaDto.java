package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class qnaDto {

	public int qna_idx;
	public String qna_title;
	public String qna_name;
	public String qna_pw;
	public String qna_content;
	public Date qna_date;
	
	public qnaDto() {
		
	}
	
	public qnaDto(int qna_idx, String qna_title, String qna_name, String qna_pw, String qna_content, Date qna_date) {
		super();
		this.qna_idx = qna_idx;
		this.qna_title = qna_title;
		this.qna_name = qna_name;
		this.qna_pw = qna_pw;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
	}
	
	
}

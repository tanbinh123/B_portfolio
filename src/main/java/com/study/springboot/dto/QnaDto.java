package com.study.springboot.dto;

import java.util.Date;

public class QnaDto 
{
	private int qna_idx;
	private String qna_title;
	private String qna_name;
	private String qna_pw;
	private String qna_content;
	private Date qna_date;
	
	public QnaDto() {
	}

	public QnaDto(int qna_idx, String qna_title, String qna_name, String qna_pw, String qna_content, Date qna_date) {
		this.qna_idx = qna_idx;
		this.qna_title = qna_title;
		this.qna_name = qna_name;
		this.qna_pw = qna_pw;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getQna_name() {
		return qna_name;
	}

	public void setQna_name(String qna_name) {
		this.qna_name = qna_name;
	}

	public String getQna_pw() {
		return qna_pw;
	}

	public void setQna_pw(String qna_pw) {
		this.qna_pw = qna_pw;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	
}

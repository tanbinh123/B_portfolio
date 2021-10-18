package com.study.springboot.dto;

import java.util.Date;

public class QnaReplyDto 
{
	private int reply_idx;
	private String reply_name;
	private String reply_content;
	private Date reply_date;
	private int reply_qna_idx;
	
	public QnaReplyDto() {
		
	}

	public QnaReplyDto(int reply_idx, String reply_name, String reply_content, Date reply_date, int reply_qna_idx) {
		super();
		this.reply_idx = reply_idx;
		this.reply_name = reply_name;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.reply_qna_idx = reply_qna_idx;
	}

	public int getReply_idx() {
		return reply_idx;
	}

	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}

	public String getReply_name() {
		return reply_name;
	}

	public void setReply_name(String reply_name) {
		this.reply_name = reply_name;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public int getReply_qna_idx() {
		return reply_qna_idx;
	}

	public void setReply_qna_idx(int reply_qna_idx) {
		this.reply_qna_idx = reply_qna_idx;
	}
	
	
	
}

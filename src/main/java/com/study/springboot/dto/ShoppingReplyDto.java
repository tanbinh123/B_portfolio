package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ShoppingReplyDto {
	private int s_reply_idx;
	private String s_reply_content;
	private Date s_reply_date;
	private int s_reply_board_idx;
	
	public ShoppingReplyDto(int s_reply_idx, String s_reply_content, Date s_reply_date,
			int s_reply_board_idx) {
		super();
		this.s_reply_idx = s_reply_idx;
		this.s_reply_content = s_reply_content;
		this.s_reply_date = s_reply_date;
		this.s_reply_board_idx = s_reply_board_idx;
	}

	public ShoppingReplyDto() {
		
	}
	

		
	//Getter/Setter는 자동생성
}

package com.study.springboot.dto;

import lombok.Data;

@Data
public class cancelDto {

	
	public int cancel_idx;
	public String cancel_id;
	public String cancel_title;
	public String cancel_content;
	public String cancel_status;
	public cancelDto(int cancel_idx, String cancel_id, String cancel_title, String cancel_content,
			String cancel_status) {
		super();
		this.cancel_idx = cancel_idx;
		this.cancel_id = cancel_id;
		this.cancel_title = cancel_title;
		this.cancel_content = cancel_content;
		this.cancel_status = cancel_status;
	}
	
	public cancelDto() {
		
	}
}

package com.study.springboot.dto;

import lombok.Data;

@Data
public class adminDto {

	private int admin_idx;
	private String admin_id;
	private String admin_pw;
	
	public adminDto() {
		
	}

	public adminDto(int admin_idx, String admin_id, String admin_pw) {
		super();
		this.admin_idx = admin_idx;
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}
	
}

package com.study.springboot.dto;

import lombok.Data;

@Data
public class memberDto {

	
	public int member_idx;
	public String member_id;
	public String member_pw;
	public String member_name;
	public String member_email;
	public String member_email_receive;
	
	
	
	public memberDto() {
		
	}


	public memberDto(int member_idx, String member_id, String member_pw, String member_name, String member_email, String member_email_receive) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_email_receive = member_email_receive;
	}


}

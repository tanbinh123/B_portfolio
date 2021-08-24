package com.study.springboot.dto;

import lombok.Data;

@Data
public class addDto {
	public int add_idx;
	public String add_title;
	public String add_price;
	public String add_content;
	public String add_keyword;
	public int add_count;
	
	public addDto() {
		
	}
	
	public addDto(int add_idx, String add_title, String add_price, String add_content, String add_keyword, int add_count) {
		super();
		this.add_idx = add_idx;
		this.add_title = add_title;
		this.add_price = add_price;
		this.add_content = add_content;
		this.add_keyword = add_keyword;
		this.add_count = add_count;
	}
}

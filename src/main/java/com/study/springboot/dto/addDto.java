package com.study.springboot.dto;

import lombok.Data;

@Data
public class addDto {
	
	public int add_idx;
	public String add_title;
	public int add_price;
	public String add_content;
	public int add_count;
	public String add_img;

	
	public addDto() {
		
	}


	public addDto(int add_idx, String add_title, int add_price, String add_content, int add_count, String add_img) {
		super();
		this.add_idx = add_idx;
		this.add_title = add_title;
		this.add_price = add_price;
		this.add_content = add_content;
		this.add_count = add_count;
		this.add_img = add_img;
	}
}

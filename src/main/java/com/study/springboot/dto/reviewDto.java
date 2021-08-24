package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;


@Data
public class reviewDto {

	public int review_idx;
	public String review_star;
	public String review_content;
	public String review_items_idx;
	public Date review_date;
	
	public reviewDto() {
		
	}
	public reviewDto(int review_idx, String review_star, String review_content, String review_items_idx,
			Date review_date) {
		super();
		this.review_idx = review_idx;
		this.review_star = review_star;
		this.review_content = review_content;
		this.review_items_idx = review_items_idx;
		this.review_date = review_date;
	}
	
	
}

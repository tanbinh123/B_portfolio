package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;
@Data
public class shoppingDto {

	private int review_idx;
	private String review_title;
	private String review_content;
	private String review_name;
	private int items_idx;
	public Date review_date;
	
	
	
	public shoppingDto(int review_idx, String review_title, String review_content, int items_idx, String review_name,Date review_date) {
		super();
		this.review_idx = review_idx;
		this.review_title = review_title;
		this.review_content = review_content;
		this.items_idx = items_idx;
		this.review_name = review_name;
		this.review_date = review_date;
	}



	public shoppingDto() {
		
	}


	


	
}



/*
 * drop table shopping_review; create table shopping_review( review_idx
 * number(4) primary key, review_star number(4), review_content varchar2(100),
 * review_items_idx number(4), review_date date default sysdate );
 */
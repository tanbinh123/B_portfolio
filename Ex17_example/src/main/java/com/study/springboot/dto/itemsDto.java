package com.study.springboot.dto;

import lombok.Data;

@Data
public class itemsDto {

	public int items_idx;
	public String items_title;
	public String items_price;
	public String items_status;
	public String items_member_idx;
	
	public itemsDto() {
		
	}
	
	public itemsDto(int items_idx, String items_title, String items_price, String items_status,
			String items_member_idx) {
		super();
		this.items_idx = items_idx;
		this.items_title = items_title;
		this.items_price = items_price;
		this.items_status = items_status;
		this.items_member_idx = items_member_idx;
	}
	
	
	
}

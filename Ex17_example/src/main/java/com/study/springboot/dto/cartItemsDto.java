package com.study.springboot.dto;

import lombok.Data;

@Data
public class cartItemsDto {

	public int citems_idx;
	public String citems_title;
	public String citems_price;
	public int citems_member_idx;
	
	public cartItemsDto() {
		
	}
	public cartItemsDto(int citems_idx, String citems_title, String citems_price, int citems_member_idx) {
		super();
		this.citems_idx = citems_idx;
		this.citems_title = citems_title;
		this.citems_price = citems_price;
		this.citems_member_idx = citems_member_idx;
	}
	
	
}

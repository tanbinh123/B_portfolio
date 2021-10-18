package com.study.springboot.dto;

import lombok.Data;

@Data
public class orderDto {

	public int order_idx;
	public String order_img;
	public String order_title;
	public int order_price;
	public int order_numb;
	public int order_shopping_idx;
	public int order_totalPrice;
	public orderDto () {
		
	}
	public orderDto(int order_idx, String order_img, String order_title, int order_price, int order_numb, int order_totalPrice,
			int order_shopping_idx) {
		super();
		this.order_idx = order_idx;
		this.order_img = order_img;
		this.order_title = order_title;
		this.order_price = order_price;
		this.order_numb = order_numb;
		this.order_shopping_idx = order_shopping_idx;
		this.order_totalPrice = order_totalPrice;
	}
	
	
}

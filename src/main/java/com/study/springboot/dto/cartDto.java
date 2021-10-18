package com.study.springboot.dto;

import lombok.Data;

@Data
public class cartDto {




	public int cart_idx;
	public String cart_img;
	public int cart_item_idx;
	public String cart_title;
	public int cart_price;
	public int cart_numb;
	public int cart_member_idx;
	public int cart_totalPrice;
	public String cart_member_id;
	public int cart_order_idx;
	public cartDto(int cart_idx, String cart_img, int cart_item_idx, String cart_title, int cart_price, int cart_numb,
			int cart_member_idx, int cart_totalPrice,String cart_member_id) {
		super();
		this.cart_idx = cart_idx;
		this.cart_img = cart_img;
		this.cart_item_idx = cart_item_idx;
		this.cart_title = cart_title;
		this.cart_price = cart_price;
		this.cart_numb = cart_numb;
		this.cart_member_idx = cart_member_idx;
		this.cart_totalPrice = cart_totalPrice;
		this.cart_member_id = cart_member_id;
	}
	
	
	public cartDto() {
		
	}
}

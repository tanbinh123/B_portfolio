package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.cartDto;

public interface CartService {

	
	public void addCart(cartDto dto) throws Exception;
	
	public List<cartDto> cart_view(int cart_member_idx) throws Exception;
	
	public int cart_delete(int cart_idx) throws Exception;
	
	public int order_cart(String cart_member_id) throws Exception;
	
}

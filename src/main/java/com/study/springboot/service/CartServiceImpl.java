package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ICartDao;
import com.study.springboot.dto.cartDto;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	public ICartDao dao;
	
	
	@Override
	public void addCart( cartDto dto ) throws Exception {
		
		dao.addCart(dto);
	}
	
	@Override
	public List<cartDto> cart_view(int cart_member_idx) throws Exception {
		
		return dao.cart_view(cart_member_idx);
	}
	
	@Override
	public int cart_delete(int cart_idx) throws Exception {
		int result = 0;
		
		result = dao.cart_delete(cart_idx);
	
		
		return result;
	}
	@Override
	public int order_cart(String cart_member_id) throws Exception {
		int result = 0;
		
		result = dao.order_cart(cart_member_id);
	
		
		return result;
	}
}

package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IShoppingItemsDao;
import com.study.springboot.dto.shoppingItemsDto;


@Service
public class ShoppingItemsService {
	
	@Autowired
	public IShoppingItemsDao dao;
	
	public shoppingItemsDto order_view(int items_idx) {
		shoppingItemsDto dto = dao.admin_order_view(items_idx);
		return dto;
	}	
	public List<shoppingItemsDto> user_order_list(int items_member_idx) {
		List<shoppingItemsDto> user_order_list = dao.user_order_list(items_member_idx);
		return user_order_list;
	}	

	
	public List<shoppingItemsDto> admin_order_list() {
		List<shoppingItemsDto> admin_order_list = dao.admin_order_list();
		return admin_order_list;
	}
	
	public int order_insert2 ( String items_title, int items_price, int items_member_idx, int items_status, String items_status2 ) {
		int result = 0;
		shoppingItemsDto dto = new shoppingItemsDto();
	
		dto.setItems_member_idx(items_member_idx);
		dto.setItems_price(items_price);
		dto.setItems_title(items_title);
		dto.setItems_status(items_status);
		dto.setItems_status2(items_status2);
		result = dao.order_insert2(dto);
		return result;
	}
	
	public int admin_order_delete (int items_idx) {
		
		int result = dao.admin_order_delete(items_idx);
		
		return result;
	}
	public int order_status (int items_idx, int items_status, String items_status2) {
		int result = dao.order_status(items_idx, items_status, items_status2);
		return result;
	}
}

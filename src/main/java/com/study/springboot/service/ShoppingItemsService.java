package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IShoppingItemsDao;
import com.study.springboot.dto.noticeDto;
import com.study.springboot.dto.shoppingItemsDto;


@Service
public class ShoppingItemsService {
	
	@Autowired
	public IShoppingItemsDao dao;
	
	
	public int shopping_items_write (String items_img, String items_title, int items_price, int items_numb, int items_status, String items_name, String items_email, int items_member_idx ) {
		int result = 0;
		shoppingItemsDto dto = new shoppingItemsDto();
	
		dto.setItems_email(items_email);
		dto.setItems_img(items_img);
		dto.setItems_member_idx(items_member_idx);
		dto.setItems_name(items_name);
		dto.setItems_numb(items_numb);
		dto.setItems_price(items_price);
		dto.setItems_status(items_status);
		dto.setItems_title(items_title);
		
		result = dao.shopping_items_write(dto);
		return result;
	}
	
	public List<shoppingItemsDto> admin_order_list() {
		List<shoppingItemsDto> admin_order_list = dao.admin_order_list();
		return admin_order_list;
	}
	
}

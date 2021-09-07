package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IShoppingDao;
import com.study.springboot.dto.shoppingDto;

@Service
public class ShoppingService {

	@Autowired
	public IShoppingDao shoppingDao;
	
	public List<shoppingDto> shopping_review_list() {
		List<shoppingDto> shopping_review_list = shoppingDao.admin_shopping_review_list();
		return shopping_review_list;
	}
	
	public int shopping_review_write (String review_title, String review_content) {
		int result = 0;
		shoppingDto dto = new shoppingDto();
		
		dto.setReview_title(review_title);
		dto.setReview_content(review_content);
		
		result = shoppingDao.admin_shopping_review_write(dto);
		return result;

	}
	
	public shoppingDto shopping_review_view(String review_idx) {
		shoppingDto dto = shoppingDao.admin_shopping_review_view(review_idx);
		return dto;
	}
	
	public int shopping_review_modify (String review_idx, String review_title, String review_content) {
		
		int result = 0;
		result = shoppingDao.admin_shopping_review_modify(review_idx, review_title, review_content);
		
		return result;
	}
}

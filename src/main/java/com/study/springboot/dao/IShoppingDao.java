package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.shoppingDto;


@Mapper
public interface IShoppingDao {

	public ArrayList<shoppingDto> admin_shopping_review_list();
	public shoppingDto admin_shopping_review_view(String review_idx);
	public int admin_shopping_review_write(shoppingDto reviewdto);
	public void admin_shopping_review_delete(String review_idx);
	public int admin_shopping_review_modify(String review_idx, String review_title, String review_content, String review_items, String review_img);
}

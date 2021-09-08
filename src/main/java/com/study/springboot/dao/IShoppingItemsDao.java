package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.shoppingItemsDto;

@Mapper
public interface IShoppingItemsDao {

	public int shopping_items_write(shoppingItemsDto dto);
	public List<shoppingItemsDto> admin_order_list();
}

package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.shoppingItemsDto;

@Mapper
public interface IShoppingItemsDao {

	public int shopping_items_write(shoppingItemsDto dto);
}

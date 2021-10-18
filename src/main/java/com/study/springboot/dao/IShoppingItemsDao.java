package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.shoppingItemsDto;

@Mapper
public interface IShoppingItemsDao {

	public List<shoppingItemsDto> admin_order_list();
	public int admin_order_delete(int items_idx);
	public shoppingItemsDto admin_order_view(int items_idx);
	public int order_status(int items_idx, int items_status, String items_status2);
	public int order_insert2(shoppingItemsDto dto);
	
	public List<shoppingItemsDto> user_order_list(int items_member_idx);
}

package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import com.study.springboot.dto.orderDto;

public interface OrderService {

	
	public void order_insert(Map<String, Object> map);
	
	public List<orderDto> order_view(int order_member_idx, int order_idx) throws Exception;

	public List<orderDto> order_review(String order_member_id) throws Exception;
	public void order_delete(int order_idx) throws Exception;
	
}

package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrderDao;
import com.study.springboot.dto.orderDto;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	public IOrderDao dao;
	
	
	@Override
	public void order_insert(Map<String, Object> map) {
		
		dao.order_insert(map);
	}
	@Override
	public List<orderDto> order_view(int order_member_idx, int order_idx) throws Exception{
		
		return dao.order_view(order_member_idx, order_idx);
	}
	@Override
	public List<orderDto> order_review(String order_member_id) throws Exception{
		
		return dao.order_review(order_member_id);
	}
	@Override
	public void order_delete(int order_idx) throws Exception {
		
		dao.order_delete(order_idx);
	}
}

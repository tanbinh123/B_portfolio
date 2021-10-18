package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.OrderInfoDao;
import com.study.springboot.dto.orderInfoDto;


@Service
public class OrderInfoServiceImpl implements OrderInfoService {

	@Autowired
	private OrderInfoDao dao;
	
	
	@Override
	public int orderInfo_insert(orderInfoDto dto) throws Exception {
		
		int result = dao.orderInfo_insert(dto);
		
		return result;
	}
	
	@Override
	public orderInfoDto orderInfo_view(int orderInfo_idx) throws Exception {
		
		return dao.orderInfo_view(orderInfo_idx);
	}
	
	@Override
	public int orderInfo_delete(int orderInfo_idx) throws Exception {
		int result = dao.orderInfo_delete(orderInfo_idx);
		
		return result;
		
	}
}

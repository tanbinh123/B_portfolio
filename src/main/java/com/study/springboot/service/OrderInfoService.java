package com.study.springboot.service;

import com.study.springboot.dto.orderInfoDto;

public interface OrderInfoService {

	
	
	public int orderInfo_insert(orderInfoDto dto) throws Exception;
	
	public orderInfoDto orderInfo_view (int orderInfo_idx) throws Exception;
	public int orderInfo_delete(int orderInfo_idx) throws Exception;
}

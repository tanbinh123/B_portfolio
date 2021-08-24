package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.ICartItemsDao;

@Component
public class CartItemsService {

	@Autowired
	private ICartItemsDao cartItemsDao;
	
}

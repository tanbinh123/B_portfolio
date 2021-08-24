package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IAddDao;

@Component
public class AddService {

	@Autowired
	private IAddDao addDao;
}

package com.study.springboot.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IAdminDao;
import com.study.springboot.dto.adminDto;

@Service
public class AdminService {

	@Autowired
	private IAdminDao adminDao;

	public int admin_login(String admin_id, String admin_pw) {

			int result;
		List<adminDto> list = adminDao.admin_login(admin_id, admin_pw);
		String check_id = list.get(0).getAdmin_id();
		String check_pw = list.get(0).getAdmin_pw();
		
		if(check_id.equals(admin_id) && check_pw.equals(admin_pw)) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
	}
}

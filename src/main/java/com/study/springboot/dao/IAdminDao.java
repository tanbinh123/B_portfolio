package com.study.springboot.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.adminDto;




@Mapper
@Repository
public interface IAdminDao {

//	public int admin_login(String admin_id, String admin_pw);
	public List<adminDto> admin_login(String admin_id, String admin_pw);
}

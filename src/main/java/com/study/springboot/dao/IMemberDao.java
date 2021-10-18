package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.memberDto;

@Mapper
public interface IMemberDao {

	public int login(String member_id, String member_pw);
	public int idCheck(String member_id);
	public int member_join(memberDto dto) throws Exception;
	
	public memberDto member_check (String member_id) throws Exception;
	
	public int member_id_modify(memberDto dto) throws Exception;
	
	public int user_delete_submit(String member_id, String member_pw) throws Exception;
	
	public int pwModify(memberDto dto) throws Exception;
	
	public memberDto idFind(String member_name, String member_email) throws Exception;
	public memberDto passwordFind(String member_name, String member_email, String member_id) throws Exception;
}

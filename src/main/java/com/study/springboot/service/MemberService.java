package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.memberDto;


@Service
public class MemberService {

	@Autowired
	public IMemberDao dao;

	public int login(String member_id, String member_pw) {
		int result = 0;
		
		int count = dao.login( member_id, member_pw );
		if( count > 0 ) {
			result = 1;
		}
		
		return result;
	}
	public int idCheckAjax(String member_id) {
		int result = 0;
		try 
		{
			result = dao.idCheck(member_id);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	public int member_id_modify(String member_id, String member_pw, String member_name, String member_email, String member_email_receive) throws Exception {
		
		memberDto dto = new memberDto();
		
		dto.setMember_id(member_id);
		dto.setMember_pw(member_pw);
		dto.setMember_name(member_name);
		dto.setMember_email(member_email);
		dto.setMember_email_receive(member_email_receive);
		int result =0;
		result = dao.member_id_modify(dto);
		
		return result;
		
	}
	
	public int pwModify (String member_pw, String member_id) throws Exception {
		
		memberDto dto = new memberDto();
		dto.setMember_pw(member_pw);
		dto.setMember_id(member_id);
		
		int result = 0;
		
		result = dao.pwModify(dto);
		
		return result;
	}
	public int member_join(String member_id, String member_pw, String member_name, String member_email, String member_email_receive) throws Exception {
		
		memberDto dto = new memberDto();
		
		dto.setMember_id(member_id);
		dto.setMember_pw(member_pw);
		dto.setMember_name(member_name);
		dto.setMember_email(member_email);
		dto.setMember_email_receive(member_email_receive);
		int result =0;
		result = dao.member_join(dto);
		
		return result;
		
	}
	
	public memberDto member_check(String member_id) throws Exception {
		memberDto dto = dao.member_check(member_id);
		
		
		System.out.println(member_id);
		
		return dto; 
	}
	public int user_delete_submit(String member_id, String member_pw) throws Exception{
		int result = dao.user_delete_submit(member_id, member_pw);
		
		
		return result;
	}
	
	public memberDto idFind(String member_name, String member_email) throws Exception {
		
		memberDto dto = dao.idFind(member_name, member_email);
		
		return dto;
	}
	
	public memberDto passwordFind(String member_name, String member_email, String member_id) throws Exception {
		
		memberDto dto = dao.passwordFind(member_name, member_email, member_id);
		
		return dto;
	}
}

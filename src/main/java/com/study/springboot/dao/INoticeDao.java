package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.noticeDto;


@Mapper
public interface INoticeDao {

	public ArrayList<noticeDto> admin_notice_list();
	public noticeDto admin_notice_view(String notice_idx);
	public int admin_notice_write(noticeDto dto);
	public void admin_notice_delete(String notice_idx);
	public int admin_notice_modify(String notice_idx, String notice_title, String notice_content);
}

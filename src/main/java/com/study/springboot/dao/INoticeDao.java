package com.study.springboot.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.PagingVO;
import com.study.springboot.dto.noticeDto;


@Mapper
public interface INoticeDao {

	public ArrayList<noticeDto> admin_notice_list();
	public noticeDto admin_notice_view(String notice_idx);
	public int admin_notice_write(noticeDto dto);
	public void admin_notice_delete(String notice_idx);
	public int admin_notice_modify(String notice_idx, String notice_title, String notice_content);
	
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<noticeDto> selectBoard(PagingVO vo);
}

package com.study.springboot.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.orderInfoDto;

@Repository
public class OrderInfoDaoImpl implements OrderInfoDao {

	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.study.springboot.dao.OrderInfoDao";
	
	@Override
    public int orderInfo_insert(orderInfoDto dto) {
        
		
		return sql.insert(namespace + ".orderInfo_insert", dto);
    }
	
	// 게시물 조회
	public orderInfoDto orderInfo_view(int orderInfo_idx) throws Exception {
	
		return sql.selectOne(namespace + ".orderInfo_view", orderInfo_idx);
	}
	

	@Override
	public int orderInfo_delete(int orderInfo_idx) throws Exception {
		
		return sql.delete(namespace + ".orderInfo_delete", orderInfo_idx);
	}
}

package com.study.springboot.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.orderDto;

@Repository
public class IOrderDaoImpl implements IOrderDao {

	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.study.springboot.dao.IOrderDao";
	
	@Override
    public void order_insert(Map<String, Object> map) {
        sql.insert(namespace + ".order_insert", map);
    }
	
	@Override
	public List<orderDto> order_view(int order_member_idx , int order_idx) throws Exception {
	
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("order_member_idx", order_member_idx);
		data.put("order_idx", order_idx);
		
		return sql.selectList(namespace + ".order_view", data);
	}
	@Override
	public List<orderDto> order_review(String order_member_id) throws Exception {
	
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("order_member_id", order_member_id);
		
		return sql.selectList(namespace + ".order_review", data);
	}

	@Override
	public void order_delete(int order_idx) throws Exception {
		
		sql.delete(namespace + ".order_delete", order_idx);
	}
}

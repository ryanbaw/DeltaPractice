package com.delta.practice.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.delta.practice.dao.IOrderDetailDao;
import com.delta.practice.entity.OrderDetail;
import com.delta.practice.utils.JdbcUtils;

/**
 * IOrderDetailDao接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-6 下午9:43:55
 */
public class OrderDetailDao implements IOrderDetailDao {

	QueryRunner qr = JdbcUtils.getQueryRunner();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.delta.practice.dao.IOrderDetailDao#add(com.delta.practice.entity
	 * .OrderDetail)
	 */
	@Override
	public void add(OrderDetail od) {

		String sql = " INSERT orderDetail(orderId,food_id,foodCount) VALUES(?,?,?)";
		try {
			qr.update(sql, od.getOrderId(), od.getFood_id(), od.getFoodCount());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.dao.IOrderDetailDao#query()
	 */
	@Override
	public List<OrderDetail> query() {

		String sql = "SELECT * FROM orderDetail";
		try {
			return qr.query(sql, new BeanListHandler<OrderDetail>(
					OrderDetail.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.dao.IOrderDetailDao#findByOrderid(int)
	 */
	@Override
	public List<OrderDetail> findByOrderid(int id) {

		String sql = "SELECT * FROM orderDetail where orderId=?";
		try {
			return qr.query(sql, new BeanListHandler<OrderDetail>(
					OrderDetail.class), id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}

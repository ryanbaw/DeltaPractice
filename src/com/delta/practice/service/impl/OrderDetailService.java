package com.delta.practice.service.impl;

import java.util.List;

import com.delta.practice.dao.IOrderDetailDao;
import com.delta.practice.entity.OrderDetail;
import com.delta.practice.factory.BeanFactory;
import com.delta.practice.service.IOrderDetailService;

/**
 * IOrderDetailService接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-7 下午6:01:24
 */
public class OrderDetailService implements IOrderDetailService{

	IOrderDetailDao orderDetailDao = BeanFactory.getInstance("orderDetailDao", IOrderDetailDao.class);
	/* (non-Javadoc)
	 * @see com.delta.practice.service.IOrderDetailService#add(com.delta.practice.entity.OrderDetail)
	 */
	@Override
	public void add(OrderDetail od) {

		orderDetailDao.add(od);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IOrderDetailService#query()
	 */
	@Override
	public List<OrderDetail> query() {
		return orderDetailDao.query();
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IOrderDetailService#findByOrderId(int)
	 */
	@Override
	public List<OrderDetail> findByOrderId(int id) {
		return orderDetailDao.findByOrderid(id);
	}

}

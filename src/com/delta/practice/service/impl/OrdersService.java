package com.delta.practice.service.impl;

import java.util.List;

import com.delta.practice.dao.IOrdersDao;
import com.delta.practice.entity.Orders;
import com.delta.practice.factory.BeanFactory;
import com.delta.practice.service.IOrdersService;
import com.delta.practice.utils.PageBean;

/**
 * IOrdersService接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-7 下午6:01:01
 */
public class OrdersService implements IOrdersService {

	IOrdersDao ordersDao = BeanFactory.getInstance("ordersDao",
			IOrdersDao.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.delta.practice.service.IOrdersService#update(com.delta.practice
	 * .entity.Orders)
	 */
	@Override
	public void update(Orders orders) {

		ordersDao.update(orders);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.service.IOrdersService#query()
	 */
	@Override
	public List<Orders> query() {
		return ordersDao.query();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.delta.practice.service.IOrdersService#add(com.delta.practice.
	 * entity.Orders)
	 */
	@Override
	public void add(Orders orders) {

		ordersDao.add(orders);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.service.IOrdersService#getCount()
	 */
	@Override
	public int getCount() {
		return ordersDao.getCount();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.delta.practice.service.IOrdersService#getAll(com.delta.practice
	 * .utils.PageBean)
	 */
	@Override
	public void getAll(PageBean<Orders> pb) {

		ordersDao.getAll(pb);
	}

}

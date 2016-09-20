package com.delta.practice.service.impl;

import java.util.List;

import com.delta.practice.dao.IFoodDao;
import com.delta.practice.entity.Food;
import com.delta.practice.factory.BeanFactory;
import com.delta.practice.service.IFoodService;
import com.delta.practice.utils.PageBean;

/**
 * IFoodService接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-7 下午5:59:20
 */
public class FoodService implements IFoodService {

	IFoodDao foodDao = BeanFactory.getInstance("foodDao", IFoodDao.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.delta.practice.service.IFoodService#add(com.delta.practice.entity
	 * .Food)
	 */
	@Override
	public void add(Food food) {

		foodDao.add(food);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.service.IFoodService#delete(int)
	 */
	@Override
	public void delete(int id) {

		foodDao.delete(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.delta.practice.service.IFoodService#updata(com.delta.practice
	 * .entity.Food)
	 */
	@Override
	public void updata(Food food) {

		foodDao.updata(food);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.service.IFoodService#query()
	 */
	@Override
	public List<Food> query() {

		return foodDao.query();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.service.IFoodService#findById(int)
	 */
	@Override
	public Food findById(int id) {
		return foodDao.findById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.service.IFoodService#query(java.lang.String)
	 */
	@Override
	public List<Food> query(String keyword) {
		return foodDao.query(keyword);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.delta.practice.service.IFoodService#getAll(com.delta.practice
	 * .utils.PageBean)
	 */
	@Override
	public void getAll(PageBean<Food> pb) {

		foodDao.getAll(pb);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.delta.practice.service.IFoodService#findByType(int)
	 */
	@Override
	public List<Food> findByType(int type) {
		return foodDao.findByType(type);
	}

}

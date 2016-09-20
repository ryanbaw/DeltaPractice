package com.delta.practice.service.impl;

import java.util.List;

import com.delta.practice.dao.IFoodTypeDao;
import com.delta.practice.entity.FoodType;
import com.delta.practice.factory.BeanFactory;
import com.delta.practice.service.IFoodTypeService;

/**
 * IFoodTypeService接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-7 下午5:59:46
 */
public class FoodTypeService implements IFoodTypeService{

	IFoodTypeDao foodTypeDao = BeanFactory.getInstance("foodTypeDao", IFoodTypeDao.class);
	/* (non-Javadoc)
	 * @see com.delta.practice.service.IFoodTypeService#add(com.delta.practice.entity.FoodType)
	 */
	@Override
	public void add(FoodType foodtype) {

		foodTypeDao.add(foodtype);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IFoodTypeService#delete(int)
	 */
	@Override
	public void delete(int id) {

		foodTypeDao.delete(id);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IFoodTypeService#updata(com.delta.practice.entity.FoodType)
	 */
	@Override
	public void updata(FoodType foodtype) {

		foodTypeDao.updata(foodtype);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IFoodTypeService#query()
	 */
	@Override
	public List<FoodType> query() {
		return foodTypeDao.query();
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IFoodTypeService#findById(int)
	 */
	@Override
	public FoodType findById(int id) {
		return foodTypeDao.findById(id);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IFoodTypeService#query(java.lang.String)
	 */
	@Override
	public List<FoodType> query(String keyword) {
		return foodTypeDao.query(keyword);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IFoodTypeService#getFirstType()
	 */
	@Override
	public Integer getFirstType() {
		return foodTypeDao.getFirstType();
	}

}

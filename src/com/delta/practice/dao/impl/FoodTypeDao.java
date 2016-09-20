package com.delta.practice.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.delta.practice.dao.IFoodTypeDao;
import com.delta.practice.entity.FoodType;
import com.delta.practice.utils.JdbcUtils;

/**
 * IFoodTypeDao接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-2 下午7:25:19
 */
public class FoodTypeDao implements IFoodTypeDao{

	QueryRunner qr = JdbcUtils.getQueryRunner();
	/* (non-Javadoc)
	 * @see com.delta.practice.dao.IFoodTypeDao#add(com.delta.practice.entity.FoodType)
	 */
	@Override
	public void add(FoodType foodtype) {

		String sql ="INSERT INTO foodType(typeName) VALUES(?);";
		try {
			qr.update(sql, foodtype.getTypeName());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.dao.IFoodTypeDao#delete(int)
	 */
	@Override
	public void delete(int id) {

		String sql ="DELETE FROM foodType WHERE id=?";
		try {
			qr.update(sql,id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.dao.IFoodTypeDao#updata(com.delta.practice.entity.FoodType)
	 */
	@Override
	public void updata(FoodType foodtype) {
	
		String sql ="UPDATE foodType SET typeName=? WHERE id =?";
		try {
			qr.update(sql,foodtype.getTypeName(),foodtype.getId());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.dao.IFoodTypeDao#query()
	 */
	@Override
	public List<FoodType> query() {

		String sql ="SELECT * FROM foodType";
		try {
			return  qr.query(sql,new BeanListHandler<FoodType>(FoodType.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.dao.IFoodTypeDao#findById(int)
	 */
	@Override
	public FoodType findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.dao.IFoodTypeDao#query(java.lang.String)
	 */
	@Override
	public List<FoodType> query(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.dao.IFoodTypeDao#getFirstType()
	 */
	@Override
	public Integer getFirstType() {
		try {
			String sql = "select * from foodType";
			return qr.query(sql, new ScalarHandler<Integer>());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}

package com.delta.practice.service.impl;

import java.util.Date;
import java.util.List;

import com.delta.practice.dao.IDinnerTableDao;
import com.delta.practice.entity.DinnerTable;
import com.delta.practice.factory.BeanFactory;
import com.delta.practice.service.IDinnerTableService;

/**
 * IDinnerTableService接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-7 下午5:59:08
 */
public class DinnerTableService implements IDinnerTableService{

	IDinnerTableDao dinnerTableDao = BeanFactory.getInstance("dinnerTableDao", IDinnerTableDao.class);
	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#add(com.delta.practice.entity.DinnerTable)
	 */
	@Override
	public void add(DinnerTable dt) {
		
		dinnerTableDao.add(dt);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#delete(int)
	 */
	@Override
	public void delete(int id) {
		dinnerTableDao.delete(id);
		
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#updata(com.delta.practice.entity.DinnerTable)
	 */
	@Override
	public void updata(DinnerTable dt) {

		dinnerTableDao.updata(dt);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#query()
	 */
	@Override
	public List<DinnerTable> query() {
		
		return dinnerTableDao.query();
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#findById(int)
	 */
	@Override
	public DinnerTable findById(int id) {
		
		return dinnerTableDao.findById(id);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#query(java.lang.String)
	 */
	@Override
	public List<DinnerTable> query(String keyword) {
		return dinnerTableDao.query(keyword);
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#quitTable(int)
	 */
	@Override
	public void quitTable(int id) {
		dinnerTableDao.quitTable(id);
		
	}

	/* (non-Javadoc)
	 * @see com.delta.practice.service.IDinnerTableService#changesState(int)
	 */
	@Override
	public DinnerTable changeState(int id) {
    DinnerTable table = dinnerTableDao.findById(id);
		
		int status = table.getTableStatus();
		if(status==0){
			status=1;
			Date date = new Date();
			table.setOrderDate(date);
		}else if(status==1){
			status=0;
			table.setOrderDate(null);
		}
		table.setTableStatus(status);
		dinnerTableDao.updata(table);
		return table;
	}

}

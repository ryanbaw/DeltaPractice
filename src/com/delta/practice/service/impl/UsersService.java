package com.delta.practice.service.impl;

import java.util.List;

import com.delta.practice.dao.IUsersDao;
import com.delta.practice.entity.Users;
import com.delta.practice.factory.BeanFactory;
import com.delta.practice.service.IUsersService;
import com.delta.practice.utils.PageBean;

/**
 * IOrdersService接口实现类
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-7 下午6:01:01
 */
public class UsersService implements IUsersService {

	IUsersDao usersDao = BeanFactory.getInstance("usersDao", IUsersDao.class);


	public void delete(Users user) {
		usersDao.delete(user);
	}

	public void delete(String username) {
		usersDao.delete(username);
	}

	public void insert(Users user) {
		usersDao.insert(user);
	}

	public void insert(String username, String password, String phone, String regtime) {
		usersDao.insert(username, password, phone, regtime);
	}

	public void insert(String username, String password, String phone, String email, String address, String sex, int age, double money, String regtime) {
		usersDao.insert(username, password, phone, email, address, sex, age, money, regtime);
	}

	public List<Users> selectAll() {
		return usersDao.selectAll();
	}

	public Users selectByName(String username) {
		return usersDao.selectByName(username);
	}

	public boolean selectByNamePassword(String username, String password) {
		return usersDao.selectByNamePassword(username, password);
	}

	public List<Users> selectByLike(String cond) {
		return usersDao.selectByLike(cond);
	}

	public void update(Users user) {
		usersDao.update(user);
	}

	public void update(String username, String password, String phone, String email, String address, String sex, int age, String regtime) {
		usersDao.update(username, password, phone, email, address, sex, age, regtime);
	}

	public void updatePassword(String username, String password) {
		usersDao.updatePassword(username, password);
	}

	public void updatePhone(String username, String phone) {
		usersDao.updatePhone(username, phone);
	}

	public void updateEmail(String username, String email) {
		usersDao.updateEmail(username, email);
	}

	public void updateAddress(String username, String address) {
		usersDao.updateAddress(username, address);
	}

	public void updateMoney(String username, String money) {
		usersDao.updateMoney(username, money);
	}

}

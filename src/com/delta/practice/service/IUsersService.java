package com.delta.practice.service;

import java.util.List;

import com.delta.practice.entity.Users;
import com.delta.practice.utils.PageBean;

/**
 * 订单Service接口
 * 
 * @author Li Benhe Email: libenhe919@gmail.com
 * @version 2016-3-7 下午5:32:12
 */
public interface IUsersService {

	void delete(Users user);

	void delete(String username);

	void insert(Users user);

	void insert(String username, String password, String phone, String regtime);

	void insert(String username, String password, String phone, String email, String address, String sex, int age, double money, String regtime);

	List<Users> selectAll();

	Users selectByName(String username);

	boolean selectByNamePassword(String username, String password);

	List<Users> selectByLike(String cond);

	void update(Users user);

	void update(String username, String password, String phone, String email, String address, String sex, int age, String regtime);

	void updatePassword(String username, String password);

	void updatePhone(String username, String phone);

	void updateEmail(String username, String email);

	void updateAddress(String username, String address);

	void updateMoney(String username, String money);
	
}

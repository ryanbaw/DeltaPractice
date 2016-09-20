package com.delta.practice.test;

import java.util.List;

import com.delta.practice.factory.BeanFactory;
import com.delta.practice.entity.Users;
import com.delta.practice.service.IUsersService;

public class UserDAOImplTest {
	IUsersService usersService = BeanFactory.getInstance("usersService", IUsersService.class);

	public static void main(String[] args) {
		try {
			UserDAOImplTest xin = new UserDAOImplTest();
			xin.run();
			// System.out.println(userList.size());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	public void run() {
		boolean a = usersService.selectByNamePassword("ryan", "justdoit1");
		if (a) {
			System.out.println("password check!");
		} else {
			System.out.println("password check fail!");
		}
		List <Users>userList = usersService.selectAll();
		System.out.println(userList.size());
	}
}

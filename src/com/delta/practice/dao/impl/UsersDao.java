package com.delta.practice.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.delta.practice.dao.IUsersDao;
import com.delta.practice.entity.Users;
import com.delta.practice.utils.JdbcUtils;

public class UsersDao implements IUsersDao {

	private QueryRunner qr = JdbcUtils.getQueryRunner();

	public void delete(Users user) {
		String sql = "DELETE FROM user WHERE username=?";

		try {
			qr.update(sql, user.getUsername());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void delete(String username) {
		String sql = "DELETE FROM user WHERE username=?";

		try {
			qr.update(sql, username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void insert(Users user) {
		String sql="INSERT INTO user (username,password,phone,email,address,sex,age,money,regtime) VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			qr.update(sql, user.getUsername(), user.getPassword(), user.getPhone(), 
				user.getEmail(), user.getAddress(), user.getSex(), user.getAge(), 
				user.getMoney(), user.getRegtime());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void insert(String username, String password, String phone, String regtime) {
		String sql="INSERT INTO user (username,password,phone) VALUES (?,?,?) ";
	
		try {
			qr.update(sql, username, password, phone);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void insert(String username, String password, String phone,
			String email, String address, String sex, int age, double money, String regtime) {
		String sql="INSERT INTO user (username,password,phone,email,address,sex,age,money,regtime) VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			qr.update(sql, username, password, phone, email, address, sex, age, money, regtime);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<Users> selectAll() {
		String sql = "SELECT * FROM user";

		try {
			return qr.query(sql, new BeanListHandler<Users>(Users.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public Users selectByName(String username) {
		String sql = "SELECT * FROM user WHERE username=?";

		try {
			return qr.query(sql, new BeanHandler<Users>(Users.class), username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public boolean selectByNamePassword(String username, String password) {
		String sql = "SELECT * FROM user WHERE username=?";

		try {
			Users user = qr.query(sql, new BeanHandler<Users>(Users.class), username);
			if (password.equals(user.getPassword())) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<Users> selectByLike(String cond) {
		String sql = "SELECT * FROM user WHERE username LIKE ? or address LIKE ?";

		try {
			return qr.query(sql, new BeanListHandler<Users>(Users.class), 
				"%" + cond + "%", "%" + cond + "%");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void update(Users user) {
		String sql = "UPDATE user SET password=?,phone=?,email=?,address=?,sex=?,age=?,regtime=? WHERE username=?";

		try {
			qr.update(sql, user.getPassword(), user.getPhone(), user.getEmail(),
				user.getAddress(), user.getSex(), user.getAge(), user.getRegtime(),
				user.getUsername());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void update(String username, String password, String phone,
			String email, String address, String sex, int age, String regtime) {
		String sql = "UPDATE user SET password=?,phone=?,email=?,address=?,sex=?,age=?,regtime=? WHERE username=?";

		try {
			qr.update(sql, password, phone, email, address, sex, age, regtime, username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void updatePassword(String username, String password) {
		String sql = "UPDATE user SET password=? WHERE username=?";

		try {
			qr.update(sql, password, username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void updatePhone(String username, String phone) {
		String sql = "UPDATE user SET phone=? WHERE username=?";

		try {
			qr.update(sql, phone, username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void updateEmail(String username, String email) {
		String sql = "UPDATE user SET email=? WHERE username=?";

		try {
			qr.update(sql, email, username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void updateAddress(String username, String address) {
		String sql = "UPDATE user SET address=? WHERE username=?";

		try {
			qr.update(sql, address, username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void updateMoney(String username, String money) {
		String sql = "UPDATE user SET money=? WHERE username=?";

		try {
			qr.update(sql, money, username);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}

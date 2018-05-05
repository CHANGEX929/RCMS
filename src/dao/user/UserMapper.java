package dao.user;

import java.util.List;

import pojo.User;

public interface UserMapper {
	/**
	 * 查询所有user对象
	 * @return
	 */
	public List<User> getUser();
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User login(User user);
/*	*//**
	 * userIsExist
	 *//*
	public int userIsExist(User user);*/

	/**
	 * addUser
	 */
	public int addUser(User user);
}

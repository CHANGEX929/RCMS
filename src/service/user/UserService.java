package service.user;

import java.util.List;

import pojo.User;

public interface UserService {
	public List<User> getUser();
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

package service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user.UserMapper;

import pojo.User;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	@Override
	public List<User> getUser() {
		return userMapper.getUser();
	}
	@Override
	public User login(User user) {
		return userMapper.login(user);
	}

	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}

	/*	@Override
	public int userIsExist(User user) {
		return userMapper.userIsExist(user);
	}*/
}

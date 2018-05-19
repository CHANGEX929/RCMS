package service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user.UserMapper;

import pojo.Pager;
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

	@Override
	public int userIsExist(User user) {
		return userMapper.userIsExist(user);
	}

	@Override
	public List<User> showUserList(Pager pager) {
		return userMapper.showUserList(pager);
	}

	@Override
	public int getTotalCount(Pager pager) {
		return userMapper.getTotalCount(pager);
	}

	@Override
	public int delUserById(User user) {
		return userMapper.delUserById(user);
	}

	@Override
	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}
}

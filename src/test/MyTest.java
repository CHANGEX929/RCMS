package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pojo.User;
import redis.clients.jedis.Jedis;
import tools.BillCodeUtil;

import dao.user.UserMapper;

public class MyTest {

	public void method1(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		UserMapper userMapper=(UserMapper) context.getBean("userMapper");
		List<User> user=userMapper.getUser();
	}
	
/*	@Test*/
	public void method2(){
		System.out.println(BillCodeUtil.getBillCode());
	}
}

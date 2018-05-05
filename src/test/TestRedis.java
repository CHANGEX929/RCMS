package test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;

public class TestRedis {
	/*@Test*/
	public void method(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		RedisTemplate jedis=(RedisTemplate) context.getBean("redisTemplate");	
		jedis.opsForValue().set("changex","小鹏");
		System.out.println(jedis.opsForValue().get("changex"));
	}
}

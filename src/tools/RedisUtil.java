package tools;

import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import pojo.Desk;
import pojo.DeskInfo_detail;

import com.alibaba.fastjson.JSON;
import pojo.Dish;

@Component("redisUtil")
public class RedisUtil {
	@Resource(name = "redisTemplate")
	private RedisTemplate redisTemplate;
	private Logger logger = Logger.getLogger(String.valueOf(RedisUtil.class));

	public void add(String key, String value) {
		if (redisTemplate == null) {
			logger.warning("redisTemplate 实例化失败");
			return;
		} else {
			redisTemplate.opsForValue().set(key, value);
			logger.info("添加成功------><"+key+","+value+">");
		}
	}

	public void addObj(String key, Object obj) {
		if (redisTemplate == null) {
			logger.warning("redisTemplate 实例化失败");
			return;
		} else {
			String objJson = JSON.toJSONString(obj);
			logger.info("objJson----->"+objJson);
			redisTemplate.opsForValue().set(key, objJson);
			logger.info("添加成功------><"+key+","+objJson+">");
		}
	}
	
	public void addList(String key,List list){
		if (redisTemplate == null) {
			logger.warning("redisTemplate 实例化失败");
			return;
		} else {
			String listJson = JSON.toJSONString(list);
			logger.info("objJson----->"+listJson);
			redisTemplate.opsForValue().set(key, listJson);
			logger.info("添加成功------><"+key+","+listJson+">");
		}		
	}
		
    public String get(String key) {
        String value = (String) redisTemplate.opsForValue().get(key);
        return value;
    }
    public Object getObj(String key) {
        Desk value =JSON.parseObject((String)redisTemplate.opsForValue().get(key), Desk.class);
        return value;
    }
    
    public List getList(String key) {
		List value=null;
        if("allDishes".equals(key)){
			value=JSON.parseArray((String)redisTemplate.opsForValue().get(key), Dish.class);
		}else{
			 value =JSON.parseArray((String)redisTemplate.opsForValue().get(key), DeskInfo_detail.class);
		}
        return value;
    }
    
    public void del(String key){
    	 redisTemplate.delete(key);
    	logger.info("删除-----"+key+"------成功");
    }
	
	
}

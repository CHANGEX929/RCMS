package controller;

import com.alibaba.fastjson.JSON;
import dao.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Provider;
import pojo.User;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserMapper userMapper;


    @ResponseBody
    @RequestMapping("/addUser.do")
    public Object addUser(User user){
        return JSON.toJSONString(userMapper.addUser(user));
    }









/*    @ResponseBody
    @RequestMapping("/userIsExist.do")
    public Object userIsExist(User user){
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println(user.getIdentity()+user.getUserCode()+user.getPhone());
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~");
        int phoneFlag=-1;
        int identityFlag=-1;
        int userCodeFlag=-1;
        if(user.getUserCode()!=null && !user.getUserCode().equals("")){
            userCodeFlag=userMapper.userIsExist(user);
        }
        if(user.getIdentity()!=null && "".equals(user.getIdentity())){
            identityFlag=userMapper.userIsExist(user);
        }
        if(user.getPhone()!=null && "".equals(user.getPhone())){
            phoneFlag=userMapper.userIsExist(user);
        }
        return "{\"userCodeFlag\":\""+userCodeFlag+"\",\"phoneFlag\":\""+phoneFlag+"\",\"identityFlag\":\""+identityFlag+"\"}";
    }*/
}

package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pojo.User;
import service.user.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	//登录页面入口
	@RequestMapping(value="login.html",method=RequestMethod.GET)
	public String showLogin(){
		return "login";
	}

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String showIndex(){
		return "login";
	}

	//处理登录
	@RequestMapping(value="login.html",method=RequestMethod.POST)
	public String doLogin(User user,HttpSession session,Model model){
		User logUser=userService.login(user);
		if(logUser!=null){
			session.setAttribute("user", logUser);
			return "redirect:desklist.html?show=desk";
		}else{
			model.addAttribute("error", "账号和密码不匹配");
			return "login";
		}	
	}
	
	//处理注销
	@RequestMapping(value="/logout.html")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:login.html";
	}
}

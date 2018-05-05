package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class DailyController {
	@RequestMapping("/daily.html")
	public String showDaily(HttpSession session ){
		if(session.getAttribute("user")==null){//权限控制
			return "redirect:login.html";
		}
		return"daily/daily";
	}
}

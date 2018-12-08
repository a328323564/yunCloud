package cn.symphony.portal.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping(value="/login")
	public String login(@RequestParam Map<String, Object> map) {
		System.out.println("进来了");
		String username = (String) map.get("uname");
		String password = (String) map.get("pwd");
		System.out.println(username);
		System.out.println(password);
		
		return null;
	}
	
	
	
}

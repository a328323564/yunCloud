package cn.symphony.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;

import cn.symphony.dubbo.api.pojo.User;
import cn.symphony.dubbo.api.service.UserService;

@Controller
@RequestMapping(value="/user",produces="text/html;charset=UTF-8")
public class UserController {

	//通过dubbo注入订阅服务
 	@Reference
 	private UserService userService;
 	
	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring-dubbo-consumer.xml");
		UserService bean = context.getBean("userServiceApi", UserService.class);
		User user = new User();
		user.setUsername("joe");
		user.setPassword("123");
		User login = bean.login(user);
		System.out.println("来自供应商的信息：" + login.toString());
		return "这是dubbo中文.";
	}
	
	
	@RequestMapping("/test2")
	@ResponseBody
	public String test3() {
		
		
		
		return "这是dubbo中文.";
	}
	
	
	
	@RequestMapping("/hello")
	@ResponseBody
	public String test2() {
		return "这是中文.";
	}
	

}

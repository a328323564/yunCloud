package cn.symphony.rest.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import cn.symphony.dubbo.api.pojo.User;
import cn.symphony.dubbo.api.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Override
	public User login(User user) {
		System.out.println("来到rest供应商");
		System.out.println("消费者传过来的User是：" + user.toString());
		User user1 = new User();
		user1.setUsername("xiaoming消费者");
		user1.setPassword("123");
		return user1;
	}
	
}

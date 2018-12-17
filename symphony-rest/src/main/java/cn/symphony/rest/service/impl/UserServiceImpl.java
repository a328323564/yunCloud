package cn.symphony.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import cn.symphony.dubbo.api.pojo.User;
import cn.symphony.dubbo.api.service.UserService;
import cn.symphony.manager.mapper.SymUserMapper;
import cn.symphony.manager.pojo.SymUser;
import cn.symphony.manager.pojo.SymUserExample;
import cn.symphony.manager.pojo.SymUserExample.Criteria;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SymUserMapper mapper;
	
	@Override
	public User login(User user) {
		System.out.println("来到这里了");
		System.out.println("来到rest供应商");
		System.out.println("消费者传过来的User是：" + user.toString());
		User user1 = new User();
		user1.setUsername("xiaoming消费者");
		user1.setPassword("123");
		
		
		SymUser res = mapper.selectByPrimaryKey(1);
		System.out.println(res.toString());
		
		return user1;
		
	}
	
}

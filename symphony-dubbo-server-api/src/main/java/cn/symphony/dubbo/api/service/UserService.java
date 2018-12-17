package cn.symphony.dubbo.api.service;

import cn.symphony.dubbo.api.pojo.User;

public interface UserService {
	
	//用户登录
	public User login(User user);
	
}

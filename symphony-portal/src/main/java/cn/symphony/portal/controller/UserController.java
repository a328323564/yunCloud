package cn.symphony.portal.controller;

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
	
	
	/*@RequestMapping(value = "/login")
	public void login(@RequestParam Map<String, Object> map, HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// 设置响应MIME和编码
		resp.setContentType("application/json;charset=utf-8");
		// 获取输出流
		PrintWriter out = resp.getWriter();

		// 创建返回结果对象
		SymphonyResult symResult = null;
		// 获取session中的验证码
		String rand = (String) req.getSession().getAttribute("rand");

		System.out.println("进来了");
		String username = (String) map.get("uname");
		String password = (String) map.get("pwd");
		String verifyCode = (String) map.get("verifyCode");

		System.out.println(username);
		System.out.println(password);
		System.out.println(verifyCode);

		// 先校验验证码，通过后才开始校验密码和账号
		if (!verifyCode.toLowerCase().equals(rand.toLowerCase())) {
			System.out.println("验证码错误");
			symResult = new SymphonyResult(0, "验证码错误", null);
		} else {
			//使用dubbo开发。创建rest项目
			
		}

		String symJSON = JsonUtils.objectToJson(symResult);
		// 将json对象响应到浏览器
		out.print(symJSON);
		out.flush();// 强制刷新
		out.close();
	}
	
	*/
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
	@RequestMapping("/hello")
	@ResponseBody
	public String test2() {
		return "这是中文.";
	}
	

}

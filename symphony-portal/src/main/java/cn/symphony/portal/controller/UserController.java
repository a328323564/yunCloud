package cn.symphony.portal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.symphony.common.pojo.SymphonyResult;
import cn.symphony.common.utils.JsonUtils;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value = "/login")
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

}

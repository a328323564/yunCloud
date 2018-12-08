<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'RegExp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    正则表达式讲解
    
  <script type="text/javascript">
	//正则语法  /规则主题/修饰符[可选]
	//var  pattern = //
	//需求:配置一个手机号码  : 总共11位 1开头,第二位 : 3或5或6或7或8或9 , 后面9位数组
	//^ 从头开始撇配
	//$ 匹配到结尾
	//执行 test(需要配置的字符串)方法,返回一个true/false true:匹配成功,false:匹配失败
	var phoneNumber = "13552431631";
	//创建正则表达式对象  
	//var  pattern = /^1[3|5|6|7|8|9][0-9]{9}$/;
	var  pattern = /^1[3|5|6|7|8|9]\d{9}$/;
	
	var flag = pattern.test(phoneNumber);
	console.log(flag);
	
	//需求: 匹配一个账号,第一个必须是字母,最少五位数,最多 10位数,不能有特殊字符
	var account = "1admin";
	
	var pattern1 = /^[a-zA-Z]\w{4,9}$/;
	console.log(pattern1.test(account));
    	
    	
    	
    	
    	
    
    </script>
    
  </body>
</html>

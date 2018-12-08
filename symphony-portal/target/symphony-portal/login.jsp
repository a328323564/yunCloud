<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--方式一，暂不采用  -->
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!--方式二：采用  -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>




<!DOCTYPE html>
<html lang="en">

<head>
<!-- 访问的基本路径,此页面的所有的跳转都是基于此地址作为基本地址 -->
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<title>交响乐社区 登录页面</title>
<!--方式一的Demo  -->
<%-- <link href="/css/login.css" rel="stylesheet"> --%>


<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/login.css" rel="stylesheet">

<!-- 引入jquery -->
<script type="text/javascript" src="resources/js/jquery.min.js"></script>

<!-- 引入 jquery.form.js -->
<script type="text/javascript" src="resources/js/jquery.form.js"></script>

<!--[if lt IE 9]>
<meta http-equiv="refresh" content="0;ie.html" />
<![endif]-->
<script>
	/* 防止一个页面中多个框架之间进行嵌套 */
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
	/*
		设置错误信息
		element : 错误文门槛的值
		errorElement : 在哪个元素上设置错误信息
		errorMsg : 具体的错误信息
	 */
	function setErrorMsg(element, errorElement, errorMsg) {
		if (element.length == 0) {
			$("#" + errorElement).css("color", "red");
			$("#" + errorElement).text(errorMsg);
		} else {
			$("#" + errorElement).text("");
		}
	}
	$(function() {

		//让验证码5分钟刷新一次
		setInterval(function() {
			$("#verifyCodeImg").attr("src",
					"resources/validate/image.jsp?time=" + new Date().getTime());
		}, 1000 * 60 * 5);

		//为验证码图片绑定一个点击换一张的单击功能
		$("#verifyCodeImg").click(
				function() {
					$(this).attr(
							"src",
							"resources/validate/image.jsp?time="
									+ new Date().getTime());
				});
		//为验证码图片绑定一个点击换一张的单击功能
		$("#verId2").click(
				function() {
					$(this).attr(
							"src",
							"resources/validate/image.jsp?time="
									+ new Date().getTime());
				});
		

		$("#loginForm").ajaxForm({
			beforeSubmit : function(arr, $form, options) {

				//arr : 封装了表单的所有表单元素对应的值
				//分贝获取json对象中的账号密码验证码对应的值
				var uname = arr[0].value;
				var pwd = arr[1].value;
				var verifyCode = arr[2].value;

				setErrorMsg(uname, "unameMsg", "账号不能为空");
				setErrorMsg(pwd, "pwdMsg", "密码不能为空");
				setErrorMsg(verifyCode, "verifyMsg", "验证码不能为空");
				//
				if (uname && pwd && verifyCode) {
					return true;
				}
				return false;
			},
			success : function(data) {
				if (data.status == 0) {
					$("#loginErrorMsg").text(data.msg);
				} else {
					window.location.href = "/home.jsp";
				}
			}
		});

		//账号文本框框失去焦点判断
		$("#uname").blur(function() {
			setErrorMsg(this.value, "unameMsg", "账号不能为空");
		});
		//密码框失去焦点判断
		$("#pwd").blur(function() {
			setErrorMsg(this.value, "pwdMsg", "密码不能为空");
		});
		//密码框失去焦点判断
		$("#verifyCode").blur(function() {
			setErrorMsg(this.value, "verifyMsg", "验证码不能为空");
		});
	});
</script>

</head>

<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-7">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>WelCome come to Symphonys</h1>
					</div>	
					<div class="m-b"></div>
					<h4>
						今天是 <strong>2018年12月8日</strong>
					</h4>
					<ul class="m-b">
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>IP地址：127.0.0.1</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>地理位置：广东佛山</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 今天的天气</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 相对湿度85%，风力3级</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 外出指数</li>
					</ul>
					<strong>还没有账号？ <a href="#" style="color:pink;">立即注册&raquo;</a></strong>
					<br>
					<strong>忘记密码了？ <a href="#" style="color:black;">找回密码&raquo;</a></strong>
					
				</div>
			</div>
			<div class="col-sm-5">
				<form id="loginForm" method="post" action="/user/login.html">
					<div class="form-group has-error">
						<label class="control-label" for="inputError1" id="inputErrorid" style="color: #000000;font-size: 20px">欢迎登录本社区！</label>
					</div>
					<input type="text" id="uname" name="uname"
						class="form-control uname" placeholder="用户名" /> <span
						id="unameMsg"></span> <input name="pwd" type="password" id="pwd"
						class="form-control pword m-b" placeholder="密码" /> <span
						id="pwdMsg"></span> <input style="color: black;" id="verifyCode"
						type="text" name="verifyCode" maxlength="4"
						class="form-control  code" placeholder="验证码" /> <span
						id="verifyMsg"></span> <img style="cursor: pointer;"
						id="verifyCodeImg" alt="" title="看不清,换一张"
						src="resources/validate/image.jsp"> 
						<a href="javascript:void(0)">看不清？点击图片更换</a>
						

					<div id="loginErrorMsg" style="color: red"></div>
					<button id="submit_btn" type="submit" class="btn btn-success btn-block">登录</button>
				</form>
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">&copy; 2018 All Rights Reserved. (call me by email:328323564@qq.com)</div>
		</div>
	</div>
</body>

</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 基本表单</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${ctx}/css/animate.css" rel="stylesheet">
<link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">
<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="${ctx}/js/content.js?v=1.0.0"></script>

<!-- iCheck -->
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>

<!-- 引入日历插件js文件 -->
<script src="${ctx}/js/plugins/layer/laydate/laydate.js"></script>

<!-- 引入 Jquery.validate.js 表单验证框架 -->
<script src="${ctx}/js/jquery.validate.min.js"></script>
<script src="${ctx}/js/messages_zh.min.js"></script>

<!-- 引入弹框插件 layer  -->
<script src="${ctx}/js/plugins/layer/layer.min.js"></script>

<style type="text/css">
.msgErrorStyle {
	background: red;
	font-size: 20px;
}
</style>

<script type="text/javascript">
	$(function() {
		//layer示例
		//墨绿深蓝风
		/* layer.alert('墨绿风格，点击确认看深蓝', {
		  skin: 'layui-layer-molv' //样式类名
		  ,closeBtn: 0
		}, function(index){
			//index : 当前弹出框对应的层级
			//layer.close(层);
			//layer.close(index);
		}); */
		

		//外部js调用,日期控件获取光标时候触发事件调用出日历
		laydate({
			elem : '#hello', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
			event : 'focus' //响应事件。如果没有传入event，则按照默认的click
		});

		//自定义jquery.validate 的规则方法
		/*
		 *$.jquery.validator.addMethod(name, method, message)
		 name: 自定义方法名称
		 method: 回调函数
		 message: 错误信息
		 */
		$.validator.addMethod("checkUname", function(value, element, param) {
			//value: 当前文本框用户输入的值
			//正则判断 :账号必须是5到10位之间的数组或者字母组成,第一个必须是字母!!
			var pattern = /^[a-zA-Z]\w{4,9}$/;
			console.log(pattern.test(value));

			return pattern.test(value);
			//return true/false; true 满足规则:放行,false:不满足规则:显示校验失败信息,不放行
		}, "账号必须是5到10位之间的数组或者字母组成,第一个必须是字母!!");

		//使用自定规则设置注册用户的昵称
		$.validator.addMethod("checkNicname", function(value, element, param) {
			//value: 当前文本框用户输入的值
			//正则判断 :账号必须是5到10位之间的数组或者字母组成,第一个必须是字母!!
			var pattern = /^[\u4e00-\u9fa5]{2,4}$/;
			return pattern.test(value);
			//return true/false; true 满足规则:放行,false:不满足规则:显示校验失败信息,不放行
		}, "昵称必须是2到4位的汉字");

		//使用jquery.validate 进行表单校验
		$("#regForm").validate(
				{
					/* 校验规则 */
					rules : {
						uname : {
							required : true,
							/* 使用自定义规则的方法   规则方法名称:true*/
							checkUname : true,
							remote : {
								url : "${ctx}/sysUser.gzsxt?cmd=checkUname", //后台处理程序
								type : "get", //数据发送方式
								dataType : "json", //接受数据格式   
								data : {
									uname : function() {
										return $("#uname").val();
									}
								}
							}
						},
						pwd : {
							required : true,
							rangelength : [ 5, 10 ]
						},
						okPwd : {
							required : true,
							equalTo : "#pwd"
						},
						nickname : {
							required : true,
							checkNicname : true
						},
						qq : "required",
						email : "required",
						phone : "required",
						regtime : "required"
					},
					/* 校验规则触发以后对应的提示信息:必须和上面规则对应 */
					messages : {
						uname : {
							required : "亲,账号不能为空",
							checkUname : "账号必须是5到10位之间的数组或者字母组成,第一个必须是字母!!",
							remote : "用户名已经存在"
						},
						pwd : {
							required : "亲,密码不能为空",
							rangelength : "密码最小5位最大10位"
						},
						okPwd : {
							required : "亲,确认密码不能为空",
							equalTo : "亲,确认密码必须和密码相同"
						},
						nickname : {
							required : "昵称不能为空",
							checkNicname : "昵称只能2到4位的汉字"
						},
						qq : "qq不能为空",
						email : "邮箱不能为空",
						phone : "电话不能为空",
						regtime : "注册日期不能为空"
					},
					/* 校验完毕触发的事件 */
					submitHandler : function() {
						//1.序列化表单获取页面的所有表单元素的数据
						var formData = $("#regForm").serialize();
						console.log(formData);
						//2.使用ajaxpost提交,向后台提交数据
						$.post("${ctx}/sysUser.gzsxt?cmd=addUser", formData,
								function(data) {
									if (data.code == 1) {
										//使用layer插件进行弹框提示
										//墨绿深蓝风
										layer.alert(data.msg, {
										  skin: 'layui-layer-molv' //样式类名
										  ,closeBtn: 0
										}, function(index){
											layer.close(index);
											$("#regForm")[0].reset();
										});

									} else {
										layer.alert(data.msg, {
											  skin: 'layui-layer-molv' //样式类名
										});
									}
								});
					}
				/* 自定义错误样式 */
				/* errorClass:"msgErrorStyle", */
				/* 自定义错误信息显示的元素 */
				/* errorElement:"div" */
				});

		return;
		//为用户名失去光标绑定事件
		//用户自定义
		/* $("#uname").blur(function() {
			if($(this).val().length== 0){
				$("#unameForm").addClass("has-error");
				$("#unameForm").removeClass("has-success");
				$("#unameMsg").text("亲,注册账户不能为空!!!");
				return false;
			}
			
			
			//发送ajax异步请求去后台查询用户是否存在
			$.get("${ctx}/sysUser.gzsxt?cmd=checkUname", {
				uname : $(this).val()
			}, function(data) {
				console.log(data);
				if (data.code == 1) {//用户名不存在可以注册
					$("#unameForm").addClass("has-success");
					$("#unameForm").removeClass("has-error");
					$("#unameMsg").text(data.msg);
				} else {//用户名存在,不可以注册
					$("#unameForm").addClass("has-error");
					$("#unameForm").removeClass("has-success");
					$("#unameMsg").text(data.msg);
				}
			});
		}); */
	});
</script>


</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-8">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>添加用户</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="form_basic.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal" action="" method="post" id="regForm">
							<div class="form-group" id="unameForm">
								<label class="col-sm-3 control-label">uname：</label>

								<div class="col-sm-7">
									<input id="uname" type="text" name="uname" placeholder="用户名"
										class="form-control" placeholder="请输入用户" required="required">
									<span class="help-block m-b-none" id="unameMsg"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">pwd：</label>
								<div class="col-sm-7">
									<input type="password" id="pwd" name="pwd" placeholder="密码"
										class="form-control" placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">okpwd：</label>

								<div class="col-sm-7">
									<input type="password" name="okPwd" placeholder="密码"
										placeholder="确认密码" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">nickname：</label>

								<div class="col-sm-7">
									<input type="text" name="nickname" placeholder="请输入昵称"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">qq：</label>
								<div class="col-sm-7">
									<input type="text" name="qq" class="form-control"
										placeholder="请输qq">

								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">email：</label>
								<div class="col-sm-7">
									<input type="email" name="email" class="form-control"
										placeholder="请输邮箱">

								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">phone：</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="phone"
										placeholder="请输入电话">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">regtime：</label>
								<div class="col-sm-7">
									<input id="hello" name="regtime"
										class="laydate-icon form-control layer-date">
								</div>
							</div>


							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-8">
									<button class="btn btn-sm btn-primary" type="submit">添加用户</button>
									<button class="btn btn-sm " type="reset">重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


	</div>


</body>

</html>

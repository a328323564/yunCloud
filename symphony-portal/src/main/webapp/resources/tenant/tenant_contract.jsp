<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'tenant_contact.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>



<script src="js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- Data Tables -->
<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
<!-- layer javascript  引用layer插件 -->
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<style type="text/css">
.check-error {
	color: red
}
</style>
</head>

<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInRight">

		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">

					<div class="ibox-content">
						<form id="constractaddform" method="post"
							action="contractServlet.gzsxt?cmd=addcontract"
							class="form-horizontal" name="constractaddform">
							<div class="form-group">

								<label class="col-sm-2 control-label">选择租户：</label>
								<div class="col-sm-10">
									<select class="form-control" name="tenant_id">
										<option value="1">张一-身份证号</option>
										<option value="2">张二-身份证号</option>
										<option value="3">张三-身份证号</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">物业费类型：</label>
								<div class="col-sm-10">
									<select class="form-control" name="pcharge_id">
										<option value="1">办公A类</option>
										<option value="2">商铺B类</option>
										<option value="3">仓库C类</option>
										<option value="4">其它</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">用途：</label>
								<div class="col-sm-10">
									<select class="form-control" name="purpose_id">
										<option value="1">商铺</option>
										<option value="2">办公</option>
										<option value="3">仓库</option>
										<option value="4">其它</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">签约日期：</label>
								<div class="col-sm-10">
									<input id="signtime" name="signtime"
										class="form-control layer-date" placeholder="YYYY-MM-DD"
										onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
									<label class="laydate-icon"></label>
								</div>
							</div>
							<div class="form-group">
									<label class="col-sm-2 control-label">起租日期：</label>
									<div class="col-sm-4">
										<input name="starttime" placeholder="开始日期"
										class="form-control layer-date laydate-icon" id="start">
								</div>
								<label class="col-sm-2 control-label">停租日期：</label>
								<div class="col-sm-4">
									<input name="endtime" placeholder="结束日期"
										class="form-control layer-date laydate-icon" id="end">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">月租金：</label>
								<div class="col-sm-10">
									<input name="monthfee" placeholder="月租金" class="form-control"
										name="pwd">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">押金：</label>
								<div class="col-sm-10">
									<input type="text" name="deposit" placeholder="押金"
										class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备注说明：</label>
								<div class="col-sm-10">
									<textarea name="remarks" class="form-control" rows="3"></textarea>
								</div>
							</div>
							<!-- 房间id 隐藏域  -->
							<input type="hidden" name="room_id" value="${param.roomId }"
								class="form-control">

							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button id="subid" class="btn btn-primary" type="submit">保存内容</button>
									<button class="btn btn-white" type="reset">取消</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="js/jquery.min.js?v=2.1.4"></script>
	<!--引入jquery.form的js库-->
	<script type="text/javascript" src="js/jquery.form.js"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/content.min.js?v=1.0.0"></script>
	<script src="js/plugins/iCheck/icheck.min.js"></script>
	<script src="js/plugins/layer/layer.js"></script>
	<script src="js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		var start = {
			elem : '#start',
			format : 'YYYY-MM-DD',
			min : laydate.now(), //设定最小日期为当前日期
			max : '2099-06-16 23:59:59', //最大日期
			istime : true,
			istoday : false,
			choose : function(datas) {
				end.min = datas; //开始日选好后，重置结束日的最小日期
				end.start = datas //将结束日的初始值设定为开始日
			}
		};
		var end = {
			elem : '#end',
			format : 'YYYY-MM-DD ',
			min : laydate.now(),
			max : '2099-06-16 23:59:59',
			istime : true,
			istoday : false,
			choose : function(datas) {
				start.max = datas; //结束日选好后，重置开始日的最大日期
			}
		};
		laydate(start);
		laydate(end);
	</script>

	<script type="text/javascript">
		$(function() {

			$("#constractaddform")
					.ajaxForm(
							{
								beforeSubmit : function() {
									return true;
								},
								clearForm : true,//提交成功后  清空表单
								success : function(rsData) {
									console.log(rsData + "------"
											+ rsData.status);
									if (rsData.status == 1) {
										//alert("添加成功");
										layer.msg("添加成功");

										//当你在iframe页面关闭自身时
										//自定页
										parent.layer
												.open({
													type : 1,
													skin : 'layui-layer-molv', //样式类名
													closeBtn : false, //不显示关闭按钮
													shift : 4,//动画效果
													shadeClose : true, //开启遮罩关闭
													content : '合同签约成功',
													time : 3000,////3秒关闭（如果不配置，默认是3秒）
													end : function() {
														//在关闭窗口之前  调用父页面方法修改节点状态  自定义方法
														//传参  tid 房间的 tid 
														parent
																.removeRoomNode("${param.room_tid}");

														//删除 ztree的节点    在  ztree页面   removeRoomNode
														/**
														removeRoomNode
														//  treeObj.removeNode(nodes[i]);
														
														var treeObj = $.fn.zTree.getZTreeObj("tree");
														var node = treeObj.getNodeByTId("tree_10");
														 */
														//parent.removeRoomNode();

														var index = parent.layer
																.getFrameIndex(window.name); //先得到当前iframe层的索引
														parent.layer
																.close(index); //再执行关闭   
													}
												});

									} else {
										layer.msg("添加失败");
									}
								}

							})
		})
	</script>
</body>
</html>


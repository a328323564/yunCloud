<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
  <head>


	<link rel="stylesheet" href="${ctx}/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="${ctx}/js/ztree/css/demo.css" type="text/css">
	<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/ztree/js/jquery.ztree.core.js"></script>
		<!-- 引入layer.js插件 -->
	<script src="${ctx}/js/plugins/layer2.4/layer.js"></script>
	
	<script type="text/javascript">
		var setting = {
			async: {
				enable: true,
				url:getAsyncUrl,
				autoParam:["id"],
				dataFilter: filter //数据预处理操作
			},
			view: {//设置视图相关
				nameIsHTML: true,//是否支持解析html格式的值
			},
			callback: {
				onClick: zTreeOnClick
			}
		};
		
		//监听节点单击回调函数
		function zTreeOnClick(event, treeId, treeNode) {
		    console.log( treeNode);
		    //只有点击房间才有意义,需要处理,房间的登记 level = 2;
		    if(treeNode.level == 2){
		    	//只有状态等于0说明为出租,可以使用
		    	if(treeNode.statustenant==0){
		    		//未出租:弹出出租合同界面
		    		//使用layer弹框插件弹出签订合同页面
		    		layer.open({
		    		      type: 2,
		    		      title: 'iframe父子操作',
		    		      maxmin: true,
		    		      shadeClose: true, //点击遮罩关闭层
		    		      area : ['800px' , '500px'],
		    		      //显示的内容,可以直接加载页面
		    		      content: '${ctx}/tenant/tenant_contract.jsp'
		    		    });
		    		
		    	}else{
		    		//已出租 : 显示合同
		    		$("#constract_img").attr("src","${ctx}/img/constract.jpg");
		    	}
		    }
		};
		
		//根据不同情况组装不同的url的参数
		function getAsyncUrl(treeId, treeNode) {
			var url  = "${ctx}/handlerConstract.gzsxt";
			if(undefined != treeNode){
				if(treeNode.level == 0){
					url +="?cmd=getFloor";
				}else if(treeNode.level == 1){
					url +="?cmd=getRoom";
				}
			} 
			return url;
		}
		
		/*预处理函数
		 *treeId : 当前节点id
		 *parentNode : 父节点
		 *childNodes : 子节点
		 */
		function filter(treeId, parentNode, childNodes) {
			console.log(parentNode,childNodes);
			if (!childNodes) return null;
			//如果是楼栋parentNode就是undefined,那么让楼栋可以展开,所有添加一个 isParent 属性为true
			if(undefined == parentNode || parentNode.level == 0){
				for (var i=0, l=childNodes.length; i<l; i++) {
					//js的设置语法
					childNodes[i].isParent = true;
				} 
			}
			if(undefined != parentNode && parentNode.level == 1 ){
				for (var i=0, l=childNodes.length; i<l; i++) {
					var room = childNodes[i];
					if(room.statustenant == 0){
						room.name = "<span style='color:green;'>"+room.name+"(未出租)</span>";
						//room.name += "(未出租)";
					}else if(room.statustenant == 1){
						room.name += "(已出租)";
					}
				} 
			}
			return childNodes;
		}
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
		});
		//-->
	</script>
		
</head>

<body>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div id="constract_info" class="right">
		<ul id="constract_info" class="info">
		</ul>
		 <img alt="" id="constract_img" src="">
	</div>
</div>

</body>
</HTML>
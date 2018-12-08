<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>绿地中央广场综合物业办公系统 - 基本表单</title>
    <meta name="keywords" content="绿地中央广场综合物业办公系统">
    <meta name="description" content="绿地中央广场综合物业办公系统">
    <link rel="shortcut icon" href="favicon.ico">
     <link href="${ctx}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx}/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    
    <!-- 引入文件上传组件 webuploader 的样式 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/js/plugins/webuploader/webuploader.css">
    
    
        <script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/js/jquery.form.js"></script>
    <script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx}/js/plugins/layer2.4/layer.js"></script>
    
    <!-- 引入 文件上传组件 webuploader 的js -->
    <script src="${ctx}/js/plugins/webuploader/webuploader.js"></script>
    
    <!-- 引入 Jquery.validate.js 表单验证框架 -->
	<script src="${ctx}/js/jquery.validate.min.js"></script>
	<script src="${ctx}/js/messages_zh.min.js"></script>
    
	<style type="text/css">
	.check-error{
		color:red
	}
	</style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
         
        <div class="row">
            <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>租户添加</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="tenantForm" method="post" action="${ctx}/handerTenant.gzsxt" class="form-horizontal" name="tenantaddform">
                        	<!-- strut2  spring mvc -->
                           	<input name="formbean" value="cn.gzsxt.po.T_Tenant" type="hidden">
                           	
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司名称</label>
                                <div class="col-sm-10">
                                    <input id="companyname" type="text"  placeholder="公司名称" name="companyname" class="form-control"> 
                                    <span class="m-b-none" id="msgnicknameid"></span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">法人姓名</label>
                                <div class="col-sm-10">
                                    <input   placeholder="法人姓名"  class="form-control" id="managername"  name="managername">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">手机号</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="手机号" name="phone" id="phone" maxlength="11" class="form-control">
                                </div>
                            </div>
                          <div class="hr-line-dashed"></div>
                          <div class="form-group">
                                <label class="col-sm-2 control-label">身份证号</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="身份证号" name="identity"  id="identity"  class="form-control">
                                </div>
                            </div>
                      
                      <div class="hr-line-dashed"></div>
                          	<div class="form-group">
                          		<!-- div id; inp ty -------->
	      					  <label class="col-sm-2 control-label">身份证正面</label>
	      					  <div class="col-sm-10">
									<div id="uploader" class="wu-example">
									    <!--用来存放文件信息-->
									    <div id="thelist1" class="uploader-list"></div>
									    <div class="btns" id="idcard_id1">
									        <div id="picker1">选择文件</div>
									        <!-- button如果不指定   type 为button 默认是submit -->
									        
									        <button id="ctlBtn1" type="button" class="btn btn-default">开始上传</button>
									    </div>
									</div>
									<!-- 身份证正面隐藏域表单,value是图片上传成功以后的 地址 -->
									<input type="hidden" id="identitypositive"  name="identitypositive" />
								</div>
   							 </div>
   							 <div class="hr-line-dashed"></div>  
                          	<div class="form-group">
                          	<!-- div id; inp ty id na -------->
	      					  <label class="col-sm-2 control-label">身份证反面</label>
						        <div class="col-sm-10">
							        <div id="uploader" class="wu-example">
									    <!--用来存放文件信息-->
									    <div id="thelist2" class="uploader-list"></div>
									    <div class="btns"  id="idcard_id2">
									        <div id="picker2">选择文件</div>
									         <div>
										     <!--   
										     	button如果不指定   type 为button 默认是submit
										      <button id="ctlBtn" class="btn btn-default">开始上传</button> -->
									         	<button id="ctlBtn2" type="button" class="btn btn-default">开始上传</button>
									         </div>
									         <!-- 身份证反面隐藏域表单,value是图片上传成功以后的 地址 -->
									   		<input type="hidden" id="identitynegative"  name="identitynegative" />
									    </div>
									</div>
								</div>
   							 </div>
   							 <div class="hr-line-dashed"></div>
                          	<div class="form-group">
	      					  <label class="col-sm-2 control-label">营业执照照片</label>
						        <div class="col-sm-10">
						          <!-- div id; inp ty id na -------->
						        </div>
   							 </div>
                            
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submit">保存内容</button>
                                    <button class="btn btn-white" type="submit">取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    	//jquery.form表单->只把普通表单作为 ajax行为提交
    	//jquery.validate ->表单校验,用户自己发ajax提交
    	//租户添加表单提交
    	$(function(){
    		//jquery.validate
    		$("#tenantForm").validate({
    			/* 校验规则 */
				rules : {
					companyname : "required",
					managername : "required",
					phone : "required",
					identity : "required",
					identitypositive : "required",
					identitynegative : "required"
				},
				/* 校验规则触发以后对应的提示信息:必须和上面规则对应 */
				messages : {
					companyname : "公司名称不能为空",
					managername : "公司法人不能为空",
					phone : "电话不能为空",
					identity : "身份证不能为空",
					identitypositive : "请上传身份证正面",
					identitynegative : "请上传身份证反面"
				},
				/* 校验完毕触发的事件 */
				submitHandler : function() {
					//1.序列化表单获取页面的所有表单元素的数据
					var formData = $("#tenantForm").serialize();
					console.log(formData);
					//2.使用ajaxpost提交,向后台提交数据
					$.post("${ctx}/handlerTenant.gzsxt?cmd=addTenant",formData,function(data){
						if(data.code ==1){
							if (data.code == 1) {
								//使用layer插件进行弹框提示
								//墨绿深蓝风
								layer.alert(data.msg, {
								  skin: 'layui-layer-molv' //样式类名
								}, function(index){
									layer.close(index);
									window.location.href="${ctx}/tenant/add_tenant.jsp";
								});
							} else {
								layer.alert(data.msg, {
									  skin: 'layui-layer-molv' //样式类名
								});
							}
							
						}
						
					});
				}
    		});
    	})
    
    </script>
    
    
    <script type="text/javascript">
 // 身份证正面
	jQuery(function() {
	    var $ = jQuery,
	        $list = $('#thelist1'), // thelist节点中添加文本  身份证正面  div添加  
	        $btn = $('#ctlBtn1'), // 文件上传按钮   身份证正面 文件上传按钮
	        state = 'pending',
	        uploader;

	    //初始化
	    uploader = WebUploader.create({
	        // 不压缩image
	        resize: false,

	        // 文件接收服务端。
	        server: "${ctx}/fileUpload.gzsxt",

	        // 选择文件的按钮。可选。
	        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	        	//开始上传 按钮的id 
	        pick: '#picker1' ,
	        
	     // 只允许选择图片文件。
	        accept: {
	            title: 'Images',
	            extensions: 'jpg,jpeg,bmp,png',
	            mimeTypes: 'image/*'
	        },
	        //允许上传的文件个数
	        fileNumLimit:1,
	        //单个文件最大的上传限制 1M
	        fileSingleSizeLimit : 1024 * 1024 // 1M
	    });

	    // 当有文件添加进来的时候
	    uploader.on( 'fileQueued', function( file ) {
	        $list.append( '<div id="' + file.id + '" class="item">' +
	            '<h4 class="info">' + file.name + '</h4>' +
	            '<p class="state">等待上传...</p>' +
	        '</div>' );
	    });

	    // 文件上传过程中创建进度条实时显示。
	    uploader.on( 'uploadProgress', function( file, percentage ) {
	        var $li = $( '#'+file.id ),
	            $percent = $li.find('.progress .progress-bar');

	        // 避免重复创建
	        if ( !$percent.length ) {
	            $percent = $('<div class="progress progress-striped active">' +
	              '<div class="progress-bar" role="progressbar" style="width: 0%">' +
	              '</div>' +
	            '</div>').appendTo( $li ).find('.progress-bar');
	        }

	        $li.find('p.state').text('上传中');

	        $percent.css( 'width', percentage * 100 + '%' );
	    });

	    //文件上传成功后  触发的事件  触发一个回调函数
	    uploader.on( 'uploadSuccess', function( file,response) {
	    	console.log("---"+response.code+"-------reData:"+response.msg+ "---" );
	      
	    	// 上传的图片保存的相对位置
	    	var idcard_url = response.msg;
	    	 $("#idcard_id1").append("<br><img  src='${ctx}"+idcard_url+"' style='width: 150px;height: 150px' />");
	    	 
	    	 //将url 添加到  form表单的隐藏域中
	    	 $("#identitypositive").val(idcard_url);
	    	 
	    	$( '#'+file.id ).find('p.state').text('已上传');
	    });

	    uploader.on( 'uploadError', function( file ) {
	    	//TODO
	        $( '#'+file.id ).find('p.state').text('上传出错');
	    });

	    uploader.on( 'uploadComplete', function( file ) {
	        $( '#'+file.id ).find('.progress').fadeOut();
	    });

	    uploader.on( 'all', function( type ) {
	        if ( type === 'startUpload' ) {
	            state = 'uploading';
	        } else if ( type === 'stopUpload' ) {
	            state = 'paused';
	        } else if ( type === 'uploadFinished' ) {
	            state = 'done';
	        }

	        if ( state === 'uploading' ) {
	            $btn.text('暂停上传');
	        } else {
	            $btn.text('开始上传');
	        }
	    });
	    
	    //出错以后回调的函数
	    uploader.on("error",function(type){
	    	alert(type);
	    	if(type == "F_EXCEED_SIZE"){
	    		layer.alert('最大只能上传1M文件', {
	    			  skin: 'layui-layer-molv' //样式类名
	    		});
	    	}
	    });

	    $btn.on( 'click', function() {
	        if ( state === 'uploading' ) {
	            uploader.stop();
	        } else {
	            uploader.upload();
	        }
	    });
	    
	    
	});
    </script>
    
        <script type="text/javascript">
 //身份证反面
	jQuery(function() {
	    var $ = jQuery,
	        $list = $('#thelist2'), // thelist节点中添加文本  身份证正面  div添加  
	        $btn = $('#ctlBtn2'), // 文件上传按钮   身份证正面 文件上传按钮
	        state = 'pending',
	        uploader;

	    //初始化
	    uploader = WebUploader.create({
	        // 不压缩image
	        resize: false,

	        // 文件接收服务端。
	        server: "${ctx}/fileUpload.gzsxt",

	        // 选择文件的按钮。可选。
	        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	        	//开始上传 按钮的id 
	        pick: '#picker2',  
	        
	        	 // 只允许选择图片文件。
	        accept: {
	            title: 'Images',
	            extensions: 'jpg,jpeg,bmp,png',
	            mimeTypes: 'image/*'
	        },
	        //允许上传的文件个数
	        fileNumLimit:1,
	        //单个文件最大的上传限制 1M
	        fileSingleSizeLimit : 1024 * 1024 // 1M
	    });

	    // 当有文件添加进来的时候
	    uploader.on( 'fileQueued', function( file ) {
	        $list.append( '<div id="' + file.id + '" class="item">' +
	            '<h4 class="info">' + file.name + '</h4>' +
	            '<p class="state">等待上传...</p>' +
	        '</div>' );
	    });

	    // 文件上传过程中创建进度条实时显示。
	    uploader.on( 'uploadProgress', function( file, percentage ) {
	        var $li = $( '#'+file.id ),
	            $percent = $li.find('.progress .progress-bar');

	        // 避免重复创建
	        if ( !$percent.length ) {
	            $percent = $('<div class="progress progress-striped active">' +
	              '<div class="progress-bar" role="progressbar" style="width: 0%">' +
	              '</div>' +
	            '</div>').appendTo( $li ).find('.progress-bar');
	        }

	        $li.find('p.state').text('上传中');

	        $percent.css( 'width', percentage * 100 + '%' );
	    });

	    //文件上传成功后  触发的事件  触发一个回调函数
	    uploader.on( 'uploadSuccess', function( file,response) {
	    	// 上传的图片保存的相对位置
	    	var idcard_url = response.msg;
	    	 $("#idcard_id2").append("<img  src='${ctx}"+idcard_url+"' style='width: 150px;height: 150px' />");
	    	 
	    	 //将url 添加到  form表单的隐藏域中
	    	 $("#identitynegative").val(idcard_url);
	    	$( '#'+file.id ).find('p.state').text('已上传');
	    });

	    uploader.on( 'uploadError', function( file ) {
	        $( '#'+file.id ).find('p.state').text('上传出错');
	    });

	    uploader.on( 'uploadComplete', function( file ) {
	        $( '#'+file.id ).find('.progress').fadeOut();
	    });

	    uploader.on( 'all', function( type ) {
	        if ( type === 'startUpload' ) {
	            state = 'uploading';
	        } else if ( type === 'stopUpload' ) {
	            state = 'paused';
	        } else if ( type === 'uploadFinished' ) {
	            state = 'done';
	        }

	        if ( state === 'uploading' ) {
	            $btn.text('暂停上传');
	        } else {
	            $btn.text('开始上传');
	        }
	    });
	    
	  //出错以后回调的函数
	    uploader.on("error",function(type){
	    	if(type == "F_EXCEED_SIZE"){
	    		layer.alert('最大只能上传1M文件', {
	    			  skin: 'layui-layer-molv' //样式类名
	    		});
	    	}
	    });

	    $btn.on( 'click', function() {
	        if ( state === 'uploading' ) {
	            uploader.stop();
	        } else {
	            uploader.upload();
	        }
	    });
	});
    </script>
    
</body>
</html>

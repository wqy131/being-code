<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>being-Personal home page</title>
    <!-- CSS -->
    
    <link href="${request.contextPath}/static/user/css/bootstrap.css" rel="stylesheet">
    <link href="${request.contextPath}/static/user/css/blog.css" rel="stylesheet">
    
    <!-- core CSS -->
    <link href="${request.contextPath}/static/site/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.contextPath}/static/site/css/font-awesome.min.css" rel="stylesheet">
    <link href="${request.contextPath}/static/site/css/animate.min.css" rel="stylesheet"> 
    <link href="${request.contextPath}/static/site/css/prettyPhoto.css" rel="stylesheet">
    <link href="${request.contextPath}/static/site/css/styles.css" rel="stylesheet"> 
    
    <link href="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.css" rel="stylesheet"> 
    <!--[if lt IE 9]>
    <script src="${request.contextPath}/static/site/js/html5shiv.js"></script>
    <script src="${request.contextPath}/static/site/js/respond.min.js"></script>
    <![endif]--> 
    <link rel="shortcut icon" href="${request.contextPath}/static/site/images/ico/favicon.ico"> 
    <style>
    	.filename{
    		padding: 10px;
    	}
    	input[type='file']{
    		width:50px;
    		font-size: 12px;
    	}
    </style>
  </head>
  <body>
  <#assign type = "en">
    <header id="header">
        <nav id="main-nav" class="navbar navbar-default navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/${type}/index"><img src="${request.contextPath}/static/site/images/logo.png" alt="logo"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                	<ul class="nav navbar-nav">
                        <li class="scroll"><a href="/${type}/index#home">HOME</a></li> 
						<li class="scroll"><a href="/${type}/index#features">Characteristics</a></li>
                        <li class="scroll"><a href="/${type}/index#business-stats">Services</a></li>
                        <!--
                        <li class="scroll"><a href="#about">我们</a></li> 
                        -->
                        <li class="scroll"><a href="/${type}/index#feature">Distribution</a></li>
                        <li class="scroll"><a href="/${type}/index#our-team">Team</a></li>
                        <li class="scroll"><a href="/${type}/index#contact-us">Cooperation</a></li>  
                        <li class="active"><#if loginUser?exists><#if loginUser.name??><a href="/${type}/user/index" id="userName">${loginUser.name!}</a></#if><#else><a href="/${type}/login">Sign in</a></#if></li>   
                        <#if loginUser?exists><li class="scroll"><a href="/${type}/logout">logout</a></li></#if>     
                        <li class="dropdown">
                    		<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="language">language
				            <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					            <li><a href="/zh/index">Chinese</a></li>
					            <li><a href="/en/index">English</a></li>
					            <li><a href="/ko/index">Korean</a></li>
					            <li class="divider"></li>
					        </ul>
                        </li>                       
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->
	<div class="intr" style="height:auto;padding: 150px 0px;">
    	<!-- <span class="avtar"></span> --->
    	
        <p class="peointr"><#if loginUser.name??>User name：${loginUser.name!}</#if><#if loginUser.email??></p><p class="peointr">Email：${loginUser.email!}</#if>。</p>
        <p class="peointr">Mobile number：${loginUser.cellphone!}<#if loginUser.createTime??></p><p class="peointr">Time for KYC：${loginUser.createTime?string["YYYY-MM-dd HH:mm:ss"]}</#if>。</p>
      
        <p class="peointr">
			<input type="hidden" id="file1"/>
			<input type="hidden" id="file2"/>
			<#if (!loginUser.fileList?exists || loginUser.fileList?size==0)>
				<p class="peointr">
				<span class="filename" style="display: inline-flex;">Front page of ID：<input type="file" id="fileName1" name="file" onchange ="uploadFile(this,1)"/></span>
				<img id="imgshow1" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;    margin-right: 20px;"/>
				</p>
				<p class="peointr">
				<span class="filename" style="display: inline-flex;">Back page of ID：<input type="file" id="fileName2" name="file" onchange ="uploadFile(this,2)"/></span>
				<img id="imgshow2" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;"/>
				</p>
				<p class="peointr">
				<button class="btn btn-large btn-success" onclick="submitImg()">Upload ID photo</button>
				</p>
			</#if>
		</p>
		
		
		<#if loginUser.fileList??>
			<#list loginUser.fileList as p>
				<p class="peointr">
				ID photo：
				 <img id="imgshow1" src="${request.contextPath}/ajax/show?fileName=${p.fileName!}" style="width: 200px; height: 150px;border: 1px solid #ccc;    margin-right: 20px;"/>
			 	</p>
			</#list>
		</#if>
		 
    </div>
    
    <div class="blog-footer">
      <p>Copyright &copy; 2018.being All rights reserved.<a href="www.being.codes" target="_blank" title="being.codes">being.codes</a> - All Rights Reserved</p>
    </div>
    <!--<a href="" class="btt">顶部</a>-->
    <!-- Js-->
    
  </body>
  <script src="${request.contextPath}/static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/static/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="${request.contextPath}/static/js/jquery.easing.min.js" type="text/javascript"></script>
		
		
		<script src="${request.contextPath}/static/js/ajaxfileupload.js"></script>
		
		<link href="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.css" rel="stylesheet">
		<script src="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.js"></script>
		<script src="${request.contextPath}/static/js/common.js"></script>
		
  <script>
  	//文件上传
	function uploadFile(obj, type) {
		var id = "fileName"+type;
		if($('#'+id).val()){
			$.ajaxFileUpload({
				url : "${request.contextPath}/ajax/fileUpload",
				secureuri : false,// 一般设置为false
				fileElementId : id,// 文件上传表单的id <input type="file" id="fileUpload" name="file" />
				dataType : 'json',// 返回值类型 一般设置为json
				success : function(data){ // 服务器成功响应处理函数
					console.log("${request.contextPath}");
					if(data.code == '0000'){
						var result = data.data['fileName'];
						$("#file"+type).val(result);
						var pathImgUrl = "${request.contextPath}/ajax/show?fileName="+result;
						console.log(pathImgUrl)
						$("#imgshow"+type).attr("src", pathImgUrl);
					}
		        },error : function(data, status, e){// 服务器响应失败处理函数
					console.log(data,status,e);
				}
			});
		}
		return false;
	}
	function submitImg(){
		var file1 = $("#file1").val();
		var file2 = $("#file2").val();
		
		if(!file1 || !file2){
			commonDialog("Please fill in the information for ID photo.");
			return;
		}
		$.ajax({
		    url:'${request.contextPath}/${type}/user/saveIDPhoto',
		    type:'POST', //GET
		    async:true,    //或false,是否异步
		    data:{
		        fileName:file1+","+file2
		    },
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    
		    success:function(data,textStatus,jqXHR){
		    	if(data.code == '0000'){
		    		alert("Successful operation");
		    		document.location.reload();//当前页面 
		    		return ;
		    	}
		    },
		    error:function(xhr,textStatus){
		        console.log('错误')
		        console.log(xhr)
		        console.log(textStatus)
		    }
		})
		
	}
  </script>
</html>

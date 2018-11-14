<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="${request.contextPath}/static/site/images/ico/favicon.ico"> 
        <title>登录</title>

        <!-- CSS -->
        <link rel="stylesheet" href="${request.contextPath}/static/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${request.contextPath}/static/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${request.contextPath}/static/css/form-elements.css">
        <link rel="stylesheet" href="${request.contextPath}/static/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>

    <body>
		<#assign type = "zh">
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1>欢迎进入登录页</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                            		<p>输入您的用户名和密码：</p>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="/${type}/submit" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-name">name</label>
			                        	<input type="text" name="name" placeholder="用户名" class="form-name form-control" id="name">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="密码" class="form-password form-control" id="password">
			                        </div>
			                        <button type="submit" class="btn">登录</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-1 btn-link-1-facebook" href="index">
	                        		<i class="glyphicon glyphicon-minus-sign"></i> 暂不登录
	                        	</a>
	                        	<!---
	                        	<a class="btn btn-link-1 btn-link-1-twitter" id="retrieve" href="javascript:void(0);">
	                        		<i class="glyphicon glyphicon-question-sign"></i> 忘记密码
	                        	</a>
	                        	--->
	                        	<a class="btn btn-link-1 btn-link-1-google-plus" onclick="toRegister()" href="javascript:void(0);">
	                        		<i class="glyphicon glyphicon-plus-sign"></i> 实名认证
	                        	</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="${request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
        <script src="${request.contextPath}/static/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="${request.contextPath}/static/js/jquery.backstretch.min.js"></script>
        <script src="${request.contextPath}/static/js/scripts.js"></script>
        
        <link href="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.css" rel="stylesheet">
		<script src="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.js"></script>
		
        
        <!--[if lt IE 10]>
            <script src="${request.contextPath}/static/js/placeholder.js"></script>
        <![endif]-->
        
        <script src="${request.contextPath}/static/js/common.js"></script>
		<script>
			function toRegister(){
				window.location.href="/${type}/register";
				return ;
			}
			$(function(){
				var msg = '${msg!}';
				if(msg){
					console.log(msg);
					commonDialog(msg);
				};
				$("#retrieve").click(function(){
					commonDialog("请联系管理员。");
				});
			})
		</script>
    </body>

</html>
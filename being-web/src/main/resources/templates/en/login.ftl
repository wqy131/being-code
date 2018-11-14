<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="${request.contextPath}/static/site/images/ico/favicon.ico"> 
        <title>being-login</title>

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
	<#assign type = "en">
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1>WELCOME TO THE LOGIN PAGE</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                            		<p>ENTER YOUR USERNAME AND PASSWORD：</p>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="/${type}/submit" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-name">NAME</label>
			                        	<input type="text" name="name" placeholder="USER NAME" class="form-name form-control" id="name">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">PASSWORD</label>
			                        	<input type="password" name="password" placeholder="PASSWORD" class="form-password form-control" id="password">
			                        </div>
			                        <button type="submit" class="btn">LOGIN</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-1 btn-link-1-facebook" href="index">
	                        		<i class="glyphicon glyphicon-minus-sign"></i> NO LOGIN FOR THE TIME BEING
	                        	</a>
	                        	<!---
	                        	<a class="btn btn-link-1 btn-link-1-twitter" id="retrieve" href="javascript:void(0);">
	                        		<i class="glyphicon glyphicon-question-sign"></i> FORGET THE PASSWORD
	                        	</a>
	                        	--->
	                        	<a class="btn btn-link-1 btn-link-1-google-plus" onclick="toRegister()" href="javascript:void(0);">
	                        		<i class="glyphicon glyphicon-plus-sign"></i> KYC
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
					commonDialog("Please contact the administrator.");
				});
			})
		</script>
    </body>

</html>
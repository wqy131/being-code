<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="${request.contextPath}/static/site/images/ico/favicon.ico"> 
		<title>实名认证</title>
		<link rel="stylesheet" media="screen" href="${request.contextPath}/static/css/css.css" />
		<script type="text/javascript">
		    function login(){
	        	window.location.href="login";
	        	return ;
	        }
		</script>
		<style>
			#msform .filename input{
				padding: 0px 10px;
			    border: 0px solid #fff;
			    width: 80%;
			    margin-bottom: 0px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
            </div>
            <div class="row">
            	<form id="msform" action="register/submit" method="post">
					<!-- progressbar -->
					<ul id="progressbar">
						<li class="active"><h1>账户设置</h1></li>
						<li><h1>联系方式</h1></li>
						<li><h1>个人资料</h1></li>
					</ul>
					<!-- fieldsets -->
					<fieldset>
						<h2 class="fs-title">账户设置</h2>
						<h3 class="fs-subtitle">登录信息设置</h3>
						<#if msg?exists><#if msg??><h3 class="fs-subtitle">${msg}</h3></#if>  </#if>  
						<input type="text" id="name" name="name" maxlength=20 placeholder="用户名" />
						<div style="width: 100%;position: relative;text-align-last: left;">
							<input type="text" id="verCode" name="verCode" placeholder="验证码" style="width: 70%;"/>
							<img id="getVerCode" src="${request.contextPath}/ajax/show?fileName=${imgPath}" style=" width: 156px;height: 50px; cursor:pointer; display: inline-block;position: absolute;right: 0;"/>
					    </div>
						<input type="password" id="password" name="password" maxlength=20 placeholder="密码" />
						<input type="password" id="password1" name="password1" placeholder="确认密码" />
						<h3 class="fs-subtitle">公告：不支持国家不允许ICO的公民参与</h3>
						<input type="button" class="action-button" style="background: #ccc;" onclick="login()" value="登录" />
						<input type="button" name="next" id="step1" class="next action-button" value="下一步" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">联系方式</h2>
						<h3 class="fs-subtitle">通过此方式可以联系您本人</h3>
						<input type="text" id="cellphone" name="cellphone" placeholder="手机号码" />
						<input type="text" id="email" name="email" placeholder="邮箱" />
						<input type="button" name="previous" class="previous action-button" style="background: #ccc;" value="上一步" />
						<input type="button" name="next" id="step2" class="next action-button" value="下一步" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">个人资料</h2>
						<h3 class="fs-subtitle">我们确保您的信息是安全的</h3>
					
						<select class="selectpicker" name="idType" title="证件类型">
							<option value="1">护照/身份证号</option>
							<option value="10">其他证件</option>
						</select>
						<input type="text" id="idNum" name="idNum" placeholder="证件号码" />
							<!-----
						<input type="hidden" id="fileName" name="fileName" />
						<input type="hidden" id="file1"/>
						<input type="hidden" id="file2"/>
						
						<span class="filename" style="display: inline-flex;">证件正面照：<input type="file" id="fileName1" name="file" onchange ="uploadFile(this,1)"/></span>
						<span class="filename" style="display: inline-flex;">证件反面照：<input type="file" id="fileName2" name="file" onchange ="uploadFile(this,2)"/></span>
						<div class="fileinput-new" data-provides="fileinput" style="display: flex;margin-bottom: 10px;">
						  <img id="imgshow1" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;    margin-right: 20px;"/>
						  <img id="imgshow2" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;"/>
						</div>
						----->
						<select class="selectpicker" name="gender" title="性别">
							<option value="0">男</option>
							<option value="1">女</option>
						</select>
						
						<input type="button" name="previous" class="previous action-button" style="background: #ccc;" value="上一步" />
						<input type="submit" name="submit" class="submit action-button" value="实名认证" />
					</fieldset>
				</form>
            </div>
		</div>
		
		<script src="${request.contextPath}/static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/static/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="${request.contextPath}/static/js/jquery.easing.min.js" type="text/javascript"></script>
		
		
		<script src="${request.contextPath}/static/js/ajaxfileupload.js"></script>
		
		<link href="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.css" rel="stylesheet">
		<script src="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.js"></script>
		<script src="${request.contextPath}/static/js/common.js"></script>
		<script src="${request.contextPath}/static/js/jQuery.time.js" type="text/javascript"></script>
		
		
		<script>
			$(function(){
				$("#name").blur(function(){
					var userName = $("#name").val();
					if(userName){
						//验证：当光标离开用户名输入框后--调用  ajax/checkUser  判断用户名是否已被占用
						$.ajax({
						    type: 'POST',
						    url: '${request.contextPath}/ajax/checkUser',
						    dataType:'json',
						    data: {name:userName},
						    success: function(data) {
						    	if(data.code!='0000'){
							        alert("用户名已经存在");
							        return true;
						    	}
						    }
						});
					}
				});
				
				$("#getVerCode").click(function(){
					$.ajax({
					    type: 'get',
					    url: '${request.contextPath}/ajax/getVerCode',
					    success: function(data) {
					    	var result = JSON.parse(data);
					    	if(result.code=='0000'){
						        $("#getVerCode").attr("src", "${request.contextPath}/ajax/show?fileName="+result.data);
						        return true;
					    	}
					    }
					});
				});
								
			});
			
		</script>
	</body>
</html>
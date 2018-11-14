<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="${request.contextPath}/static/site/images/ico/favicon.ico"> 
		<title>being-Registration</title>
		<link rel="stylesheet" media="screen" href="${request.contextPath}/static/css/css.css" />
		
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
	<#assign type = "en">
	<input type="hidden" id="langType" value="en">
		<div class="container">
			<div class="row">
            </div>
            <div class="row">
            	<form id="msform" action="/${type}/register/submit" method="post">
					<!-- progressbar -->
					<ul id="progressbar">
						<li class="active"><h1>ACCOUNT SETTING</h1></li>
						<li><h1>CONTACT INFORMATION</h1></li>
						<li><h1>PERSONAL INFORMATION</h1></li>
					</ul>
					<!-- fieldsets -->
					<fieldset>
						<h2 class="fs-title">ACCOUNT SETTING</h2>
						<h3 class="fs-subtitle">LOGIN INFORMATION SETTING</h3>
						<#if msg?exists><#if msg??><h3 class="fs-subtitle">${msg}</h3></#if>  </#if>  
						<input type="text" id="name" name="name" maxlength=20 placeholder="USER NAME" />
						<div style="width: 100%;position: relative;text-align-last: left;">
							<input type="text" id="verCode" name="verCode" placeholder="VERIFICATION CODE" style="width: 70%;"/>
							<img id="getVerCode" src="${request.contextPath}/ajax/show?fileName=${imgPath}" style=" width: 156px;height: 50px; cursor:pointer; display: inline-block;position: absolute;right: 0;"/>
					    </div>
						<input type="password" id="password" name="password" maxlength=20 placeholder="PASSWORD" />
						<input type="password" id="password1" name="password1" placeholder="CONFIRM THE PASSWORD" />
						<h3 class="fs-subtitle">Announcement: no support is provided for the ICO citizens whom are not permitted by the state to participate.</h3>
						<input type="button" class="action-button" style="background: #ccc;" onclick="login()" value="SIGN IN" />
						<input type="button" name="next" id="step1" class="next action-button" value="NEXT STEP" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">CONTACT INFORMATION</h2>
						<h3 class="fs-subtitle">You can be contacted in this way.</h3>
						<input type="text" id="cellphone" name="cellphone" placeholder="MOBILE NUMBER" />
						<input type="text" id="email" name="email" placeholder="EMAIL" />
						<input type="button" name="previous" class="previous action-button" style="background: #ccc;" value="PREVIOUS STEP" />
						<input type="button" name="next" id="step2" class="next action-button" value="NEXT STEP" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">PERSONAL INFORMATION</h2>
						<h3 class="fs-subtitle">We ensure your information to be safe.</h3>
					
						<select class="selectpicker" name="idType" title="ID TYPE">
							<option value="1">Password/ID card No</option>
							<option value="10">Other documents</option>
						</select>
						<input type="text" id="idNum" name="idNum" placeholder="IDENTIFICATION NUMBER" />
							<!-----
						<input type="hidden" id="fileName" name="fileName" />
						<input type="hidden" id="file1"/>
						<input type="hidden" id="file2"/>
						
						<span class="filename" style="display: inline-flex;">Front page of ID：<input type="file" id="fileName1" name="file" onchange ="uploadFile(this,1)"/></span>
						<span class="filename" style="display: inline-flex;">Back page of ID：<input type="file" id="fileName2" name="file" onchange ="uploadFile(this,2)"/></span>
						<div class="fileinput-new" data-provides="fileinput" style="display: flex;margin-bottom: 10px;">
						  <img id="imgshow1" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;    margin-right: 20px;"/>
						  <img id="imgshow2" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;"/>
						</div>
						----->
						<select class="selectpicker" name="gender" title="GENDER">
							<option value="0">MALE</option>
							<option value="1">FEMALE</option>
						</select>
						
						<input type="button" name="previous" class="previous action-button" style="background: #ccc;" value="PREVIOUS STEP" />
						<input type="submit" name="submit" class="submit action-button" value="KYC" />
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
						    url: '${request.contextPath}/${type}/user/checkUser',
						    dataType:'json',
						    data: {name:userName},
						    success: function(data) {
						    	if(data.code!='0000'){
							        alert("User name already exists.");
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
			<script type="text/javascript">
		    function login(){
	        	window.location.href="/${type}/login";
	        	return ;
	        }
		</script>
		</script>
	</body>
</html>
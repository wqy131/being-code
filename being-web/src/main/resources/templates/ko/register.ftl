<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="${request.contextPath}/static/site/images/ico/favicon.ico"> 
		<title>실명인증</title>
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
	<#assign type = "ko">
	<input type="hidden" id="langType" value="ko">
		<div class="container">
			<div class="row">
            </div>
            <div class="row">
            	<form id="msform" action="/${type}/register/submit" method="post">
					<!-- progressbar -->
					<ul id="progressbar">
						<li class="active"><h1>계정설정</h1></li>
						<li><h1>연결방식</h1></li>
						<li><h1>개인자료</h1></li>
					</ul>
					<!-- fieldsets -->
					<fieldset>
						<h2 class="fs-title">계정설정</h2>
						<h3 class="fs-subtitle">등록정보설정</h3>
						<#if msg?exists><#if msg??><h3 class="fs-subtitle">${msg}</h3></#if>  </#if>  
						<input type="text" id="name" name="name" maxlength=20 placeholder="아이디" />
						<div style="width: 100%;position: relative;text-align-last: left;">
							<input type="text" id="verCode" name="verCode" placeholder="인증번호" style="width: 70%;"/>
							<img id="getVerCode" src="${request.contextPath}/ajax/show?fileName=${imgPath}" style=" width: 156px;height: 50px; cursor:pointer; display: inline-block;position: absolute;right: 0;"/>
					    </div>
						<input type="password" id="password" name="password" maxlength=20 placeholder="비밀번호" />
						<input type="password" id="password1" name="password1" placeholder="비밀번호 확인" />
						<h3 class="fs-subtitle">공고:지지하지 않는 국가는  ICO의 공민참여를 허가하지 않는다.</h3>
						<input type="button" class="action-button" style="background: #ccc;" onclick="login()" value="등록" />
						<input type="button" name="next" id="step1" class="next action-button" value="다음" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">연결방식</h2>
						<h3 class="fs-subtitle">해당 방식으로 본인을 연락할 수 있습니다</h3>
						<input type="text" id="cellphone" name="cellphone" placeholder="전화번호" />
						<input type="text" id="email" name="email" placeholder="이메일" />
						<input type="button" name="previous" class="previous action-button" style="background: #ccc;" value="이전" />
						<input type="button" name="next" id="step2" class="next action-button" value="다음" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">개인자료</h2>
						<h3 class="fs-subtitle">저희는 귀하의 정보가 안전하다는 것을 확보합니다.</h3>
					
						<select class="selectpicker" name="idType" title="서류유형">
							<option value="1">여권/신분증호</option>
							<option value="10">기타서류</option>
						</select>
						<input type="text" id="idNum" name="idNum" placeholder="서류번호" />
							<!-----
						<input type="hidden" id="fileName" name="fileName" />
						<input type="hidden" id="file1"/>
						<input type="hidden" id="file2"/>
						
						<span class="filename" style="display: inline-flex;">서류정면사진：<input type="file" id="fileName1" name="file" onchange ="uploadFile(this,1)"/></span>
						<span class="filename" style="display: inline-flex;">서류뒷면사진：<input type="file" id="fileName2" name="file" onchange ="uploadFile(this,2)"/></span>
						<div class="fileinput-new" data-provides="fileinput" style="display: flex;margin-bottom: 10px;">
						  <img id="imgshow1" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;    margin-right: 20px;"/>
						  <img id="imgshow2" src="${request.contextPath}/ajax/show" style="width: 200px; height: 150px;border: 1px solid #ccc;"/>
						</div>
						----->
						<select class="selectpicker" name="gender" title="성별">
							<option value="0">남</option>
							<option value="1">여</option>
						</select>
						
						<input type="button" name="previous" class="previous action-button" style="background: #ccc;" value="이전" />
						<input type="submit" name="submit" class="submit action-button" value="실명인증" />
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
							        alert("아이디가 이미 존재합니다.");
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
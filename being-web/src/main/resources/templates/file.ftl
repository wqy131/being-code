<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <title>图片上传</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="${request.contextPath}/static/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</head>
<body>
<h1>单张图片上传</h1>
<form action="fileUpload" method="post" enctype="multipart/form-data">
    <p>选择文件: <input type="file" name="fileName"/></p>
    <p><input type="submit" value="提交"/></p>
</form>
<#--判断是否上传文件-->
<#if msg??>
    <span>${msg}</span><br>
<#else >
    <span>${msg!("文件未上传")}</span><br>
</#if>
<#--显示图片，一定要在img中的src发请求给controller，否则直接跳转是乱码-->
<#if fileName??>
<img src="ajax/show?fileName=${obj}" style="width: 300px;height:200px"/>
<#else>
<img src="ajax/show" style="width: 300px;height:200px"/>
</#if>

<h1>多张图片上传(请上传总大小不要操作5MB)</h1>
<form action="batch/upload" method="post" enctype="multipart/form-data">
    <p>选择文件: <input type="file" name="file"/></p>
    <p>选择文件: <input type="file" name="file"/></p>
    
    <p><input type="submit" value="提交"/></p>
</form>
${erroMsg!}
<#--显示图片，一定要在img中的src发请求给controller，否则直接跳转是乱码-->
<#if mapResult??>
	
	<#--判断是否上传文件-->
	<#if mapResult.msg??>
	    <span>${mapResult.erroMsg}</span><br>
	<#else >
	    <span>${mapResult.erroMsg!("文件未上传")}</span><br>
	</#if>
	
	<#list mapResult.list as result>
		<img src="ajax/show?fileName=${result.fileName}" style="width: 300px;height:200px"/>
	</#list>
<#else>
<img src="ajax/show" style="width: 300px;height:200px"/>
</#if>

<hr>
<span style="display: inline-flex;">身份证正面照：<input type="file" id="fileName1" name="fileName"  onchange ="uploadFile(this,1)"/></span>
<br>
<span style="display: inline-flex;">身份证反面照：<input type="file" id="fileName2" name="fileName"  onchange ="uploadFile(this,2)"/></span>
<br>
<div id="imgDiv"></div>

<script src="${request.contextPath}/static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${request.contextPath}/static/js/ajaxfileupload.js"></script>

<script>
	$(function(){
		//验证：当光标离开用户名输入框后--调用  user/checkUserName  判断用户名是否已被占用
		
		
						
	})
	//文件上传
	function uploadFile(obj, type) {
		$.ajaxFileUpload({
			url : "${request.contextPath}/ajax/fileUpload",
			secureuri : false,// 一般设置为false
			fileElementId : "fileName"+type,// 文件上传表单的id <input type="file" id="fileUpload" name="file" />
			dataType : 'json',// 返回值类型 一般设置为json
			success : function(data){ // 服务器成功响应处理函数
				console.log(data);
				if(data.code == '0000'){
					var html = '<img src="ajax/show?fileName='+data.data['fileName']+'" style="width: 300px;height:200px"/>';
					$("#imgDiv").append(html);
				}
				
	        },error : function(data){// 服务器响应失败处理函数
				console.log("服务器异常");
			}
		});
		return false;
	}
</script>

</body>
</html>

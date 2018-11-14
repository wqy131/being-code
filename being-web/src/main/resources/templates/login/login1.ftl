<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${request.contextPath}/static/bootstrap/img/favicon.ico">
    <title>Signin Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link href="${request.contextPath}/static/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${request.contextPath}/static/bootstrap/css/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">
		${msg!}
      <form class="form-signin" id="loginForm" action="submit" method="post" onsubmit = "return checkSave();" >
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputusername" class="sr-only">用户名</label>
        <input type="name" id="name" name="name" class="form-control" placeholder="请输入用户名\手机号\邮箱" required autofocus>
        <br>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="password" class="form-control" placeholder="请输入密码" required><span>${message!}</span>
        <input  type="hidden" id="PWD" name="password"> 
        <div class="checkbox">
          <label>
            <input type="checkbox" id="checkbox"> Remember me
            <input type="hidden" id="SAVE_PWD" name="SAVE_PWD">
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" id="submit" type="submit">登录</button>
      </form>
    </div> <!-- /container -->

	
    <script src="${request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
    <script src="${request.contextPath}/static/js/angular-1.5.6.js"></script>
	
	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="${request.contextPath}/static/bootstrap/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${request.contextPath}/static/bootstrap/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries 此处最终要改成本地js-->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${request.contextPath}/static/bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="${request.contextPath}/static/js/md5.js"></script>
   

    <script>
	    
		    var checkSave = function(){  
		        //检验是否继续保存cookie  
		        if($("#checkbox")[0].checked) {  
		            $("#SAVE_PWD").val("_YES");  
		        }  
		        else {  
		            $("#SAVE_PWD").val("_NO");  
		        }  
		        //加密  
		        md5PWD();  
		        return true;  
		    };
		    //获取cookie  
		    function checkCookie() {  
		        var name = "userNbr=";  
		        var pwd = "userPwd=";  
		        var ca = document.cookie.split(';');  
		        for(var i=0; i<ca.length; i++) {  
		            var c = ca[i];  
		            if (c.indexOf(name) != -1){  
		                $("#username").val(c.substring(name.length, c.length));  
		                $("#checkbox")[0].checked = "checked";  
		            }else if(c.indexOf(pwd) != -1) {  
		                $("#PWD").val(c.substring(pwd.length+1, c.length));  
		                $("#password").val("默认密码");  
		            }  
		        }  
		    }  
		    checkCookie();   
		    //对密码进行md5加密,赋给hidden  
		    function md5PWD(){  
		        if($("#password").val()=="默认密码"){  
		            return;  
		        }  
		        var md5PWD = $("#password").val();  
		        //$("#PWD").val(hex_md5(md5PWD)) ;//不同的md5.js调用的方法可能不同  
		        $("#PWD").val(md5PWD) ;//不同的md5.js调用的方法可能不同  
		    }  
	</script>
    
  </body>
</html>

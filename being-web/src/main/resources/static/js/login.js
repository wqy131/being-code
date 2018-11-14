;$(function(){  
    $("#submit").bind("onclick",function(){  
        //检验是否继续保存cookie  
        if($("#checkbox")[0].checked) {  
            $("#SAVE_PWD").val("_YES");  
        }  
        else {  
            $("#SAVE_PWD").val("_NO");  
        }  
        //加密  
        md5PWD();  
        console.log($("#loginForm"));
        return false;
        //提交  
        $("#loginForm").submit();  
    });  
      
    //获取cookie  
    function checkCookie() {  
        var name = "userNbr=";  
        var pwd = "userPwd=";  
        var ca = document.cookie.split(';');  
        for(var i=0; i<ca.length; i++) {  
            var c = ca[i];  
            if (c.indexOf(name) != -1){  
                $("#email").val(c.substring(name.length, c.length));  
                $("#checkbox")[0].checked = "checked";  
            }   
            else if(c.indexOf(pwd) != -1) {  
                  
                  
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
        $("#PWD").val(hex_md5(md5PWD)) ;//不同的md5.js调用的方法可能不同  
    }  
      
      
});
//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
	var userNameErr = "用户名不能为空!";
	var verCodeErr = "验证码不能为空!";
	var passwordErr = "密码填写不一致!";
	var phoneErr = "手机号码不能为空!";
	var phonePatternErr = "手机号码格式不正确!";
	var emailPatternErr = "邮箱格式不正确";
	var langType = $("#langType").val();
	if(langType){
		switch(langType){
			case "en":
				userNameErr = "User name cannot be empty!";
				verCodeErr = "The verification code cannot be empty!";
				passwordErr = "The password is not consistent!";
				phoneErr = "The phone code cannot be empty!";
				phonePatternErr = "The mobile number format is incorrect!";
				emailPatternErr = "Incorrect email format!";
			    break;
			case "ko":
				userNameErr = "아이디를 써넣으십시오";
				verCodeErr = "검증 사이즈는 비어 있을 수 없습니다!";
				passwordErr = "비밀번호가 일치하지 않습니다!";
				phoneErr = "핸드폰 번호를 비어서는 안 된다!";
				phonePatternErr = "핸드폰 번호 격식이 틀립니다!";
				emailPatternErr = "이메일이 정확하지 않습니다!";
			    break;
			default:
			  
		}
	}
	
	var step = $(this).attr("id");
	if("step1" == step){
		//前端校验
    	if(!$("#name").val()){
    		alert(userNameErr);
    		return false;
    	}
    	if(!$("#verCode").val()){
    		alert(verCodeErr);
    		return false;
    	}
    	if($("#password").val() != $("#password1").val()){
    		alert(passwordErr);
    		return false;
    	}
	}
	if("step2" == step){
		//前端校验
    	if(!$("#cellphone").val()){
    		alert(phoneErr);
    		return false;
    	}
    	var pattern = /^1[34578]\d{9}$/;
    	var phone = $("#cellphone").val();
    	if((phone.length != 11) || !pattern.test(phone)){
    		alert(phonePatternErr);
    		return false;
    	}
    	var mail=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    	if($("#email").val().match(mail)==null){
    		alert(emailPatternErr);
    		return false;
    	} 
	}
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
//	var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
//    if(!$("#idNum").val()){
//    	alert("证件号码不能为空");
//    	return false;
//    }
//    if(!pattern.test($("#idNum").val())){
//    	alert("证件号码填写有误");
//    	return false;
//    }
//    if(!$("#file1").val() || !$("#file2").val()){
//    	alert("证件照片不能为空");
//    	return false;
//    }
//    $("#fileName").val($("#file1").val()+","+$("#file2").val())
    return true;
	
})
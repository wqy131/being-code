function commonDialog(str){
	BootstrapDialog.show({
        title: "温馨提示",
        //closable: false,//是否允许关闭弹框
        message: str,
        buttons: [{
     	    label: '确定',
     	    cssClass: 'btn btn-danger',
     	    action: function(dialogRef){
     	    	dialogRef.close();
     	    }
     	  }]
    });
}

function toRegister(){
	window.location.href="register";
	return ;
}

$(function(){
	$(".scroll a").click(function(){
		$('.navbar-collapse').removeClass('in');
	})
	
});
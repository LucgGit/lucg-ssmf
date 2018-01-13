$(function() {
	var errflag = 0;
	var index = parent.layer.getFrameIndex(window.name);

	(function() {
	})();
	
	$("#userCode").blur(function (){
		validateUserCode(errflag)
	});

	$("#userName").blur(function (){
		validateUserName(errflag)
	});

	$("#userPwd").blur(function (){
		validateUserPwd()
	});

	$("#repassword").blur(function (){
		validateRepassword()
	});
	
	$('#cancel-a').click(function(){
		parent.layer.close(index);
	});

});

function validateUserCode(errflag) {
	var userCode = $.trim($("#userCode").val());
	$("#userCode").parents('.input-div').find('.err-msg').hide();
	if (userCode.length === 0) {
		$("#userCode").parents('.input-div').find('.err-msg').html("Please input account!").show();
		$("#userCode").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	}
	if (!regUser.test($("#userCode").val())) {
		$("#userCode").parents('.input-div').find('.err-msg').html("Account should be 4~16 long(letter,number,underline,minus signs)!").show();
		$("#userCode").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	}
	var param = {
		userCode : $("#userCode").val()
	};
	$.ajax({
		url:baseDir + '/queryUserCode.do',
		type:'GET',
		data:param,
		dataType:'json',
		async:false,
		success:function(result){
			if (result > 0) {
				$("#userCode").parents('.input-div').find('.err-msg').html("This account has already existed!").show();
				$("#userCode").parents('.input-div').find('.err-msg').removeClass('hide');
				errflag = 1;
				return errflag;
			}
		}
	});
	return errflag;
}

function validateUserName(errflag) {
	var userName = $.trim($("#userName").val());
	$("#userName").parents('.input-div').find('.err-msg').hide();
	if (userName.length === 0) {
		$("#userName").parents('.input-div').find('.err-msg').html("Please input user name!").show();
		$("#userName").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	}
	return errflag;
}

function validateUserPwd(errflag) {
	var userPwd = $.trim($("#userPwd").val());
	$("#userPwd").parents('.input-div').find('.err-msg').hide();
	if (userPwd.length === 0) {
		$("#userPwd").parents('.input-div').find('.err-msg').html("Please input password!").show();
		$("#userPwd").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	}
	return errflag;
}

function validateRepassword(errflag) {
	var repassword = $.trim($("#repassword").val());
	var userPwd = $.trim($("#userPwd").val());
	$("#repassword").parents('.input-div').find('.err-msg').hide();
	if (repassword.length === 0) {
		$("#repassword").parents('.input-div').find('.err-msg').html("Please repeat the password!").show();
		$("#repassword").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	} else if (userPwd != repassword) {
		$("#repassword").parents('.input-div').find('.err-msg').html("Both password is not same!").show();
		$("#repassword").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	}
	return errflag;
}

function regist() {
	//获取窗口索引
	var index = parent.layer.getFrameIndex(window.name);
	var errflag = 0;
	errflag = validateUserCode(errflag);
	errflag = validateUserName(errflag);
	errflag = validateUserPwd(errflag);
	errflag = validateRepassword(errflag);
	if (errflag == 1) {
		$("#err_tip").text('Please put in correct regist information!');
		return;
	}
	$("#err_tip").text('');

	$.ajax({
		url: baseDir + '/regist.do',
		type:'GET',
		data:$("#registForm").serialize(),
		async : false,
		success:function(result){
			if (result) {
				parent.layer.msg('Regist success!',{icon: 1});
				parent.document.getElementById("userCode").value=$.trim($("#userCode").val()); 
				parent.layer.close(index);
			} else {
				layer.msg('Regist fail!',{icon: 2});
			}
		},
		error:function(result){
			layer.msg('Regist fail!',{icon: 2});
		}
	});
}

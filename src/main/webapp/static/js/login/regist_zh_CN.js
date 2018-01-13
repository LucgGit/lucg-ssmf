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
		$("#userCode").parents('.input-div').find('.err-msg').html("请输入登录账号！").show();
		$("#userCode").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	}
	if (!regUser.test($("#userCode").val())) {
		$("#userCode").parents('.input-div').find('.err-msg').html("账号为4到16位（字母，数字，下划线，减号）！").show();
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
				$("#userCode").parents('.input-div').find('.err-msg').html("已存在的登录账号！").show();
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
		$("#userName").parents('.input-div').find('.err-msg').html("请输入用户名！").show();
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
		$("#userPwd").parents('.input-div').find('.err-msg').html("请输入密码！").show();
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
		$("#repassword").parents('.input-div').find('.err-msg').html("请再次输入密码！").show();
		$("#repassword").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	} else if (userPwd != repassword) {
		$("#repassword").parents('.input-div').find('.err-msg').html("密码输入不一致，请重新输入！").show();
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
		$("#err_tip").text('请输入正确的注册信息！');
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
				parent.layer.msg('注册成功！',{icon: 1});
				parent.document.getElementById("userCode").value=$.trim($("#userCode").val()); 
				parent.layer.close(index);
			} else {
				layer.msg('注册失败！',{icon: 2});
			}
		},
		error:function(result){
			layer.msg('注册失败！',{icon: 2});
		}
	});
}

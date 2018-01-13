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
		$("#userCode").parents('.input-div').find('.err-msg').html("アカウント名を入力してください。").show();
		$("#userCode").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	}
	if (!regUser.test($("#userCode").val())) {
		$("#userCode").parents('.input-div').find('.err-msg').html("4～16文字を入力してください（半角英数、数字、アンダーライン、マイナス）。").show();
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
				$("#userCode").parents('.input-div').find('.err-msg').html("このアカウントは既に利用されています。").show();
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
		$("#userName").parents('.input-div').find('.err-msg').html("ユーザ名を入力してください。").show();
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
		$("#userPwd").parents('.input-div').find('.err-msg').html("パスワードを入力してください。").show();
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
		$("#repassword").parents('.input-div').find('.err-msg').html("パスワード（確認）を入力してください。").show();
		$("#repassword").parents('.input-div').find('.err-msg').removeClass('hide');
		errflag = 1;
		return errflag;
	} else if (userPwd != repassword) {
		$("#repassword").parents('.input-div').find('.err-msg').html("パスワード（確認）の入力がパスワードの入力と一致していません。").show();
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
		$("#err_tip").text('正しい登録情報を入力してください。');
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
				parent.layer.msg('登録が成功します。',{icon: 1});
				parent.document.getElementById("userCode").value=$.trim($("#userCode").val()); 
				parent.layer.close(index);
			} else {
				layer.msg('登録が失敗します。',{icon: 2});
			}
		},
		error:function(result){
			layer.msg('登録が失敗します。',{icon: 2});
		}
	});
}

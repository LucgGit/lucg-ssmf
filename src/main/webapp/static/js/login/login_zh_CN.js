var login_index = {

	login : function() {
		var userCode = $.trim($("#userCode").val());
		var userPwd = $.trim($("#userPwd").val());

		if (userCode == '' && userPwd == '') {
			$('#error').text('请输入用户名和密码！');
		} else if (userPwd == '' && userCode) {
			$('#error').text('请输入密码！');
		} else if (userCode == '' && userPwd) {
			$('#error').text('请输入用户名！');
		} else {
			$("#loginForm").submit();
		}
	}
}

var regist_index = {
	showRegist : function() {
		layer.open({
			type : 2,
			title : '注册',
			fixed : false,
			maxmin : false,
			area : [ '450px', '600px' ],
			content : baseDir + '/showRegist.do'
		});
	}
}

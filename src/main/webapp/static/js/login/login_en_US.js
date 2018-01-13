var login_index = {

	login : function() {
		var userCode = $.trim($("#userCode").val());
		var userPwd = $.trim($("#userPwd").val());

		if (userCode == '' && userPwd == '') {
			$('#error').text('Please input account and password!');
		} else if (userPwd == '' && userCode) {
			$('#error').text('Please input password!');
		} else if (userCode == '' && userPwd) {
			$('#error').text('Please input account!');
		} else {
			$("#loginForm").submit();
		}
	}
}

var regist_index = {
	showRegist : function(baseDir) {
		var layer = layui.layer;
		layer.open({
			type : 2,
			title : 'Regist',
			fixed : false,
			maxmin : false,
			area : [ '500px', '600px' ],
			content : baseDir + '/showRegist.do'
		});
	}
}

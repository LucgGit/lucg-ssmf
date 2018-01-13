var login_index = {

	login : function() {
		var userCode = $.trim($("#userCode").val());
		var userPwd = $.trim($("#userPwd").val());

		if (userCode == '' && userPwd == '') {
			$('#error').text('アカウント名とパスワードを入力してください！');
		} else if (userPwd == '' && userCode) {
			$('#error').text('パスワードを入力してください！');
		} else if (userCode == '' && userPwd) {
			$('#error').text('アカウント名を入力してください！');
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
			title : '登録',
			fixed : false,
			maxmin : false,
			area : [ '500px', '600px' ],
			content : baseDir + '/showRegist.do'
		});
	}
}

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="${baseDir}/static/css/common/common.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/css/login/login.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/common/layui/css/layui.css?v=${version}">
<script type="text/javascript" src="${baseDir}/static/js/common/jquery-1.8.3.min.js?v=${version}"></script>
</head>
<body>
    <div class="layui-anim layui-anim-up" style="position:absolute; z-index:2;margin:0 auto;left:40%;">
    <div class="control-form">
        <form id="loginForm" name="loginForm" action="${baseDir}/index.do" method="post">
            <p id="error" class="a-msg-err">${errorMsg}</p>
            <ul>
                <li>
                    <label for="userCode"><i title="用户名" class="a-icon-name"></i></label>
                    <input id="userCode" name="userCode" type="text" placeholder="用户名" maxlength="50" tabindex="1" value=""/>
                </li>
                <li>
                    <label for="userPwd"><i title="密码"  class="a-icon-pwd"></i></label>
                    <input id="userPwd" name="userPwd" type="password" placeholder="密码" maxlength="30" tabindex="2" value="" autocomplete="new-password"/>
                </li>
                <li class="a-btn">
                    <a href="javascript:login_index.login();" tabindex="3">登&nbsp;&nbsp;录</a>
                </li>
                <li class="a-links">
                    <a href="javascript:regist_index.showRegist('${baseDir}');" tabindex="4">用户注册</a>
                </li>
            </ul>
        </form>
    </div>
    </div>
    <script type="text/javascript" src="${baseDir}/static/common/layui/layui.all.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/login/login.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/effect/three.min.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/effect/bg-login.js?v=${version}"></script>
</body>
</html>
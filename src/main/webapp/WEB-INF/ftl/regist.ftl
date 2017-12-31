<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="${baseDir}/static/css/common/common.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/common/layui/css/layui.css?v=${version}">
<script type="text/javascript" src="${baseDir}/static/js/common/jquery-1.8.3.min.js?v=${version}"></script>
<script type="text/javascript">
    var baseDir = '${baseDir}';
</script>
</head>
<body>
    <div style="margin-top: 5%;">
        <form class="layui-form" id="registForm" name="registForm">

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <i class="layui-icon" style="font-size: 30px; color: #FF5722;">&#xe60c;</i>
                <span style="color: #009688;">欢迎注册！</span>
            </div>

            <hr class="layui-bg-green"><br/><br/>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="userCode"><span class="text-danger">*&nbsp;</span>登录账号：</label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="text" id="userCode" name="userCode" value="" placeholder="输入登录账号" maxlength="50" autocomplete="off"/>
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="userName"><span class="text-danger">*&nbsp;</span>用户名：</label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="text" id="userName" name="userName" value="" placeholder="输入用戶名" maxlength="50" autocomplete="off"/>
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="userPwd"><span class="text-danger">*&nbsp;</span>设置密码：</label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="password" id="userPwd" name="userPwd" placeholder="输入密码" maxlength="30" autocomplete="off" />
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="repassword"><span class="text-danger">*&nbsp;</span>确定密码：</label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="password" id="repassword" name="repassword" placeholder="再次输入密码" maxlength="30" autocomplete="off" />
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <input type="hidden" id="userType" name="userType" value="1"/>

            <br/><br/>
            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for=""></label>
                <div class="layui-input-block">
                    <a class="layui-btn" href="javascript:regist();" id="submit-a">注&nbsp;&nbsp;册</a>
                    <a class="layui-btn layui-btn-primary" id="cancel-a">取&nbsp;消</a>
                    <p id="err_tip" class="text-danger"></p>
                </div>
            </div>

        </form>
    </div>
    <script type="text/javascript" src="${baseDir}/static/common/layui/layui.all.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/common/pattern.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/login/regist.js?v=${version}"></script>
</body>
</html>
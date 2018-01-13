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
                <span style="color: #009688;"><@spring.message "regist.welcome.msg"/></span>
            </div>

            <hr class="layui-bg-green"><br/><br/>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="userCode"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.code"/></label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="text" id="userCode" name="userCode" value="" placeholder="<@spring.message "regist.place.holder.user.code"/>" maxlength="50" autocomplete="off"/>
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="userName"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.name"/></label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="text" id="userName" name="userName" value="" placeholder="<@spring.message "regist.place.holder.user.name"/>" maxlength="50" autocomplete="off"/>
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="userPwd"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.pwd"/></label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="password" id="userPwd" name="userPwd" placeholder="<@spring.message "regist.place.holder.user.pwd"/>" maxlength="30" autocomplete="off" />
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for="repassword"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.repwd"/></label>
                <div class="layui-input-block input-div">
                    <input class="layui-input" type="password" id="repassword" name="repassword" placeholder="<@spring.message "regist.place.holder.user.repwd"/>" maxlength="30" autocomplete="off" />
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <input type="hidden" id="userType" name="userType" value="1"/>

            <br/><br/>
            <div class="layui-form-item" style="margin-left:10%;margin-right:10%;">
                <label class="layui-form-label" for=""></label>
                <div class="layui-input-block">
                    <a class="layui-btn" href="javascript:regist();" id="submit-a"><@spring.message "regist.regist"/></a>
                    <a class="layui-btn layui-btn-primary" id="cancel-a"><@spring.message "regist.cancel"/></a>
                    <p id="err_tip" class="text-danger"></p>
                </div>
            </div>

        </form>
    </div>
    <script type="text/javascript" src="${baseDir}/static/common/layui/layui.all.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/common/pattern.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/login/regist_${language}.js?v=${version}"></script>
</body>
</html>
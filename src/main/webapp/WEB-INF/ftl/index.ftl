<#include "/common/languageSelector.ftl" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="${baseDir}/static/css/common/common.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/common/aos/aos.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/common/layui/css/layui.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/css/login/login.css?v=${version}">
<script type="text/javascript" src="${baseDir}/static/js/common/jquery-1.8.3.min.js?v=${version}"></script>
<script type="text/javascript">
    var baseDir = '${baseDir}';
</script>
</head>
<body>
    <div style="position:absolute; z-index:2;margin:0 auto;left:40%;">
    <div class="layui-anim layui-anim-up control-form">
        <@languageSelector/>
        <hr/>
        <form id="loginForm" name="loginForm" action="${baseDir}/index.do" method="post">
            <p id="error" class="a-msg-err">${errorMsg}</p>
            <ul>
                <li>
                    <label for="userCode"><i title="<@spring.message "index.user.name"/>" class="a-icon-name"></i></label>
                    <input id="userCode" name="userCode" type="text" placeholder="<@spring.message "index.user.name"/>" maxlength="50" tabindex="1" value=""/>
                </li>
                <li>
                    <label for="userPwd"><i title="<@spring.message "index.user.pwd"/>"  class="a-icon-pwd"></i></label>
                    <input id="userPwd" name="userPwd" type="password" placeholder="<@spring.message "index.user.pwd"/>" maxlength="30" tabindex="2" value="" autocomplete="new-password"/>
                </li>
                <li class="a-btn">
                    <a href="javascript:login_index.login();" tabindex="3"><@spring.message "index.login"/></a>
                </li>
                <li class="a-links">
                    <a href="javascript:regist_index.showRegist('${baseDir}');" tabindex="4"><@spring.message "index.regist"/></a>
                </li>
            </ul>
        </form>
    </div>
    <div class="layui-anim layui-anim-scale">
        <a href="${baseDir}/about.do"><@spring.message "index.about"/></a>
    </div>
    </div>
    <script type="text/javascript" src="${baseDir}/static/common/layui/layui.all.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/common/three.min.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/effect/bg-login.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/login/login_${language}.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/common/common.js?v=${version}"></script>
</body>
</html>
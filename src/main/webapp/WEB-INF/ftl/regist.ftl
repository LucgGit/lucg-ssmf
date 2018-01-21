<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Login</title>
<link rel="stylesheet" href="${baseDir}/static/common/bootstrap/bootstrap.min.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/common/icon/iconfont.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/css/common/common.css?v=${version}">
<script type="text/javascript" src="${baseDir}/static/js/common/jquery-1.8.3.min.js?v=${version}"></script>
<script type="text/javascript">
    var baseDir = '${baseDir}';
</script>
</head>
<body>
    <div style="margin-top: 5%;margin-left: 5%;margin-right: 5%;">
        <form class="form-horizontal" id="registForm" name="registForm">
            <div class="form-group">

            <div class="ml40">
                <i class="iconfont" style="font-size: 30px; color: #FF5722;">&#xe6af;</i>
                <span style="color: #009688;"><@spring.message "regist.welcome.msg"/></span>
            </div>

            <hr class="bg-green">

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt10">
                <label class="control-label ml40" for="userCode"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.code"/></label>
                <div class="input-div col-lg-7 col-md-7 col-sm-7 col-xs-7">
                    <input class="form-control" type="text" id="userCode" name="userCode" value="" placeholder="<@spring.message "regist.place.holder.user.code"/>" maxlength="50" autocomplete="off"/>
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt10">
                <label class="control-label ml40" for="userName"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.name"/></label>
                <div class="input-div col-lg-7 col-md-7 col-sm-7 col-xs-7">
                    <input class="form-control" type="text" id="userName" name="userName" value="" placeholder="<@spring.message "regist.place.holder.user.name"/>" maxlength="50" autocomplete="off"/>
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt10">
                <label class="control-label ml40" for="userPwd"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.pwd"/></label>
                <div class="input-div col-lg-7 col-md-7 col-sm-7 col-xs-7">
                    <input class="form-control" type="password" id="userPwd" name="userPwd" placeholder="<@spring.message "regist.place.holder.user.pwd"/>" maxlength="30" autocomplete="off" />
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt10">
                <label class="control-label ml40" for="repassword"><span class="text-danger">*&nbsp;</span><@spring.message "regist.user.repwd"/></label>
                <div class="input-div col-lg-7 col-md-7 col-sm-7 col-xs-7">
                    <input class="form-control" type="password" id="repassword" name="repassword" placeholder="<@spring.message "regist.place.holder.user.repwd"/>" maxlength="30" autocomplete="off" />
                    <span class="ok hide"></span>
                    <span class="err-msg text-danger hide"></span>
                </div>
            </div>

            <input type="hidden" id="userType" name="userType" value="1"/>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt10">
                <div class="div-ct mt10">
                    <button type="button" class="btn btn-success" onclick="javascript:regist();" id="submit-a"><@spring.message "regist.regist"/></button>
                    <button type="button" class="btn btn-default ml10" id="cancel-a"><@spring.message "regist.cancel"/></button>
                    <p id="err_tip" class="text-danger"></p>
                </div>
            </div>

            </div>
        </form>
    </div>
    <script type="text/javascript" src="${baseDir}/static/js/common/jquery.placeholder.min.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/common/common.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/common/layer/layer.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/common/pattern.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/login/regist_${language}.js?v=${version}"></script>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<#include "../common/languageSelector.ftl" />
<#import "../common/spring.ftl" as spring>
<head>
<title>${title}</title>
<meta http-equiv="X-UA-Compatible" content="IE=EDGE">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${base}/static/common/layui/css/layui.css">
<link rel="stylesheet" href="${base}/static/css/common/common.css">
<script type="text/javascript" src="${base}/static/js/common/jquery-1.8.3.min.js"></script>
${head}
<script type="text/javascript">
    var baseDir = '${base}';
</script>
</head>
<body>
    <div style="position:absolute; z-index:1; width:100%;">
        <div style="width:100%;text-align:right;margin-left:-10px;margin-right:-10px;margin-top:10px;">
            <span>
                <span style="margin-left:10px;margin-right:10px;"><@spring.messageArgs "main.welcome",[loginUser.userName?string]/></span>
                <@languageSelector/>
                <a style="margin-left:10px;" href="${base}/logout.do"><@spring.message "main.logout"/></a>
            </span>
        </div>
        <div style="width:100%;text-align:right;margin-left:-10px;margin-right:-10px;margin-top:10px;">
            <span>
                <a href="${base}/demo/main.do"><@spring.message "main.href.demo"/></a>
                <span style="margin-left:10px;margin-right:10px;">|</span>
                <a href="${base}/forum/main.do"><@spring.message "main.href.forum"/></a>
                <span style="margin-left:10px;margin-right:10px;">|</span>
                <a href="${base}/addition/detail.do" target="_blank"><@spring.message "main.href.detail"/></a>
                <span style="margin-left:10px;margin-right:10px;">|</span>
                <a href="${base}/addition/about.do" target="_blank"><@spring.message "main.href.about"/></a>
            </span>
        </div>
        <script type="text/javascript" src="${base}/static/common/layui/layui.all.js"></script>
        ${body}
    </div>
    <script type="text/javascript" src="${base}/static/js/common/TweenLite.min.js"></script>
    <script type="text/javascript" src="${base}/static/js/effect/bg-normal.js"></script>
</body>
</html>
<#include "/common/pagination.ftl" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Demo</title>
</head>
<body>
    <h1>Welcome!</h1>
    <h2>This is a demo page.</h2>
    
    <br/>
    <div style="width:90%;margin-left:5%;">
        <form id="searchForm" class="form-horizontal" method="post" action="${baseDir}/demo/main.do">
            <div class="form-group">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <label for="userCode" class="control-label">用户编码：</label>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                        <input type="text" class="form-control" name="userCode" id="userCode" value="${condition.userCode!''}">
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <label for="userName" class="control-label">用户名：</label>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                        <input type="text" class="form-control" name="userName" id="userName" value="${condition.userName!''}">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <label for="createStartTime" class="control-label w-120">用户创建日期：</label>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-7">
                        <input type="text" class="form-control" name="createStartTime" id="createStartTime" value="${condition.createStartTime!''}">
                    </div>
                    <label for="createEndTime" class="control-label w-15">~</label>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-7">
                        <input type="text" class="form-control" name="createEndTime" id="createEndTime" value="${condition.createEndTime!''}">
                    </div>
                </div>
            </div>
        <form><br/>
    <button type="button" style="margin-top:10px;margin-left:40%;width:120px" onclick="queryUserInfo()">检索</button>
    <#if (userList??) && (userList?size>0)>
    <table class="common-table table table-bordered">
        <colgroup>
            <col width="150">
            <col width="200">
            <col width="200">
        </colgroup>
        <thead>
            <tr>
                <th style="text-align: center;">编号</th>
                <th style="text-align: center;">用户名</th>
                <th style="text-align: center;">用户创建时间</th>
            </tr>
        </thead>
        <tbody style="text-align: center;">
            <#list userList as userInfo>
            <tr>
                <td><p>${userInfo.userCode}</p></td>
                <td><p>${userInfo.userName}</p></td>
                <td><p>${userInfo.createTime}</p></td>
            </tr>
            </#list>
        </tbody>
    </table>
    </#if>
    <@pager pagination=limit formId="searchForm"/>
    </div>
    <script type="text/javascript" src="${baseDir}/static/common/laydate/laydate.js?v=${version}"></script>
    <script type="text/javascript" src="${baseDir}/static/js/demo/demo.js?v=${version}"></script>
</body>
</html>
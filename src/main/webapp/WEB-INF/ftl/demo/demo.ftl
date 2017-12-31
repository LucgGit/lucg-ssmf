<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Demo</title>
</head>
<body>
    <h1>Welcome!</h1>
    <h2>This is a demo page.</h2>
    
    <br/>
    <div>
        <form id="searchForm" action="${baseDir}/demo/main.do">
            <label for="userCode">用户编码：</label>
            <input type="text" name="userCode" id="userCode" value="${condition.userCode!''}">
            <label for="userName">用户名：</label>
            <input type="text" name="userName" id="userName" value="${condition.userName!''}">
            <label for="createStartTime">创建用户开始时间：</label>
            <input type="text" name="createStartTime" id="createStartTime" value="${condition.createStartTime!''}">
            <label for="createEndTime">创建用户结束时间：</label>
            <input type="text" name="createEndTime" id="createEndTime" value="${condition.createEndTime!''}">
        <form>
    </div>
    <button type="button" onclick="queryUserInfo()">检索</button>
    <#if (userList??) && (userList?size>0)>
    <table lay-even class="layui-table" style="width:50%;">
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
                <td><p>${userInfo.userCreateTime}</p></td>
            </tr>
            </#list>
        </tbody>
    </table>
    </#if>
    <script type="text/javascript" src="${baseDir}/static/js/demo/demo.js?v=${version}"></script>
</body>
</html>
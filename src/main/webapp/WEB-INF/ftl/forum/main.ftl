<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forum</title>
<link rel="stylesheet" href="${baseDir}/static/css/forum/forum.css?v=${version}">
<script type="text/javascript">
    var baseDir = '${baseDir}';
</script>
</head>
<body>
<div class="flash4" style="margin-top: 50px">
    <ul>
        <#if imgInfoList?? && imgInfoList?size!=0>
            <#list imgInfoList as imgInfo>
                <#if imgInfo_index==0>
                <li class="first">
                    <div class="imgTop"><img src="${baseDir}/${imgInfo.imgPath}" width="538" height="405" alt="" class="tm"></div>
                <#elseif imgInfo_index==imgInfoList?size-1>
                <li class="fast" style="width:${(1180-538)/(imgInfoList?size-1)}px;">
                    <div class="imgTop"><img src="${baseDir}/${imgInfo.imgPath}" width="538" height="405" alt=""></div>
                <#else>
                <li style="width:${(1180-538)/(imgInfoList?size-1)}px;">
                    <div class="imgTop"><img src="${baseDir}/${imgInfo.imgPath}" width="538" height="405" alt=""></div>
                </#if>
                    <div class="imgCen">这是一个标题</div>
                    <div class="imgBot"><a href=""><p class="bt_1">大标签</p><p class="bt_2"><span>这是小标签</span><span>小标签2</span><span>小标签3</span></p></a></div>
                </li>
            </#list>
        </#if>
    </ul>
    <script type="text/javascript">
        <#if imgInfoList??>
            var flash_size=${imgInfoList?size};
        <#else>
            var flash_size=0;
        </#if>
    </script>
</div>
<script type="text/javascript" src="${baseDir}/static/js/common/accordion.js?v=${version}"></script>
</body>
</html>
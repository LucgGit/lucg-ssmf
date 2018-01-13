<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About me</title>
<link rel="stylesheet" href="${baseDir}/static/css/common/common.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/common/aos/aos.css?v=${version}">
<link rel="stylesheet" href="${baseDir}/static/css/addition/about.css?v=${version}">
</head>
<body style="background:rgb(73, 74, 95);">
<header class="start">
    <div class="start-center">
        <h1>More Convenient</h1>
        <h2 class="start__text" aos="fade-up" aos-easing="ease" aos-delay="400">by Lucg</h2>
    </div>
    <span class="start__scroll" aos="fade-up" aos-easing="ease" aos-delay="800">Scroll down<br>
        <i class="chevron bottom"></i>
    </span>
</header>
<section class="section section--code">
    <div class="container">
        <h2 class="section-title">Fade</h2>
        <#if imgInfoList??>
            <#list imgInfoList as item>
                <#if item_index%2==1>
                    <div class="pic pic-right" <#if item.aosEffect??>${item.aosEffect}</#if>>
                <#else>
                    <div class="pic pic-left" <#if item.aosEffect??>${item.aosEffect}</#if>>
                </#if>
                        <img src="${baseImg}" data-original="${item.imgPath}"/>
                        <div class="pic-text"><#if item.imgRemark??>${item.imgRemark}</#if></div>
                    </div>
            </#list>
        </#if>
    </div>
</section>

<script type="text/javascript" src="${baseDir}/static/js/common/jquery-1.8.3.min.js?v=${version}"></script>
<script type="text/javascript" src="${baseDir}/static/common/aos/aos.js?v=${version}"></script>
<script type="text/javascript" src="${baseDir}/static/js/common/jquery.lazyload.min.js?v=${version}"></script>
<script type="text/javascript" src="${baseDir}/static/js/addition/about.js?v=${version}"></script>

</body>
</html>
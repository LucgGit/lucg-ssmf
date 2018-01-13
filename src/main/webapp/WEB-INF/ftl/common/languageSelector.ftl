<#macro languageSelector>
<select id="language">
    <option></option>
    <option value="en_US" <#if language == 'en_US'>selected</#if>>English</option>
    <option value="zh_CN" <#if language == 'zh_CN'>selected</#if>>中文简体</option>
    <option value="ja_JP" <#if language == 'ja_JP'>selected</#if>>日本語</option>
</select>
<script type="text/javascript">
    // 切换语言下拉框事件
    $("#language").change(function() {
        $.ajax({
            url : baseDir + '/locale/change.do',
            type : 'POST',
            data : "locale="+$(this).val(),
            dataType : 'text',
            async : true,
            success : function(data) {
                window.location.reload();
            },
            error:function(data){
            }
        });
    });
</script>
</#macro>
<#--
    分页标签：用于显示数据分页链接。
    pagination：分页对象。
    showPageLinkCount:显示的页数链接数
    isShowMoreLI:是否显示“<li>...</li>”提示更多还有更多页数
-->
<#macro pager pagination formId showPageLinkCount=3 isShowMoreLI=true>
    <#if (pagination.pageCount)??>
        <#if (pagination.pageCount>0)>
            <div class="">
                <div class="pages">
                    <#if (pagination.currentPage>1)>
                        <a class="prev" href="javascript:prePage();"><b></b>上一页</a>
                    <#else>
                        <span  class="prev"><b></b>上一页</span>
                    </#if>
                    <#if (pagination.currentPage>1)>
                        <a href="javascript:firstPage();">1</a>
                    <#else>
                        <#if pagination.pageCount==1 >
                            <a class="current" style="margin-right: 4px;">1</a>
                        <#else>
                            <a class="current">1</a>
                        </#if>
                    </#if> 

                    <@outPutPageNo pagination=pagination formId=formId showPageLinkCount=showPageLinkCount isShowMoreLI=isShowMoreLI/>  

                    <#if (pagination.currentPage<pagination.pageCount)>  
                        <a href="javascript:lastPage();">${pagination.pageCount?c}</a> 
                    <#elseif pagination.pageCount==1 >

                    <#else>
                        <#if pagination.pageCount==pagination.currentPage >
                            <a  class="current" style="margin-right: 4px;">${pagination.pageCount?c}</a>
                        <#else>
                            <a  class="current">${pagination.pageCount?c}</a>
                        </#if>
                    </#if>

                    <#if (pagination.currentPage<pagination.pageCount)>  
                        <a class="next" href="javascript:nextPage();"><b></b>下一页</a>
                    <#else>
                        <span  class="next"><b></b>下一页</span>
                    </#if>
                    <div>向第<input id="pageToNum" name="pageToNum" type="text" value="${pagination.currentPage?c}">页
                        <input type="submit" id="submitButton4Page" value="跳转" class="pagesubmit" onclick="pageSubmit();">
                    </div>

                    <script type="text/javascript">
                        var currentPage = "${pagination.currentPage?c}";
                        currentPage = parseInt(currentPage.replace(/,/g,""));
                        function prePage(){
                        currentPage = currentPage - 1;
                        $("#${formId}").prepend("<input type='hidden' name='currentPage' value='"+currentPage+"' />");
                            $("#${formId}").submit();
                        } 
                        function firstPage(){
                            $("#${formId}").prepend("<input type='hidden' name='currentPage' value='1' />");
                            $("#${formId}").submit();
                        } 
                        function lastPage(){
                            var pageCount = "${pagination.pageCount?c}";
                            pageCount = pageCount.replace(/,/g,"");
                            $("#${formId}").prepend("<input type='hidden' name='currentPage' value='"+pageCount+"' />");
                            $("#${formId}").submit();
                        } 
                        function nextPage(){
                            currentPage = currentPage + 1;
                            $("#${formId}").prepend("<input type='hidden' name='currentPage' value='"+currentPage+"' />");
                            $("#${formId}").submit();
                        }
                        function toPage(page){
                            page = page.replace(/,/g,"");
                            $("#${formId}").prepend("<input type='hidden' name='currentPage' value='"+page+"' />");
                            $("#${formId}").submit();
                        }
                        function pageSubmit(){
                            var regexp =new RegExp("^[1-9]\\d*$");
                            var pageToNum = $("#pageToNum").val();
                            pageToNum =pageToNum.replace(/,/g,"");
                            if(!pageToNum||pageToNum.search(regexp)==-1){
                                alert("请输入正确的页数");
                                return false;
                            }
                            var pageCount= ${pagination.pageCount?string("#####")};
                            if(pageToNum<1||pageToNum>pageCount){
                                alert("请输入正确的页数");
                                return false;
                            }
                            $("#${formId}").prepend("<input type='hidden' name='currentPage' value='"+pageToNum+"' />");
                            $("#${formId}").submit();
                        }
                    </script>
                </div>
            </div>
        </#if>
    </#if>
</#macro>

<#--
    输出分页链接。如果当前页超过 显示的页数链接数 的一半，则当前页居中显示。例如：当前第10页，总共20页，那么显示第6~第15页分页链接，且第10页居中。   
    pagination：分页对象。
    url：链接地址
    showPageLinkCount:显示的页数链接数
    isShowMoreLI:是否显示“<li>...</li>”提示更多还有更多页数0
-->
<#macro outPutPageNo pagination formId showPageLinkCount isShowMoreLI>
    <#--
        └────────────────────────────────────────────────┘
        A                                                             B
           
        └───────┴────────┘
        A1      PageNo  B1

        A->B:pageCount
        A1:startIndex
        B1:endIndex
        A1->B1:showPageLinkCount
        A1->PageNo:spaceOFStartIndexToPageNo
        A1->B1 -1:spaceOFStartIndexToPageLinkCount
    -->

    <#if (showPageLinkCount%2==1)>
        <#assign spaceOFStartIndexToPageNo=((showPageLinkCount+1)/2)-1>
    <#else>
        <#assign spaceOFStartIndexToPageNo=(showPageLinkCount/2)-1>
    </#if>

    <#assign spaceOFStartIndexToPageLinkCount=(showPageLinkCount-1)>

    <#if ((pagination.currentPage-spaceOFStartIndexToPageNo) <= 1) || (pagination.pageCount<=showPageLinkCount)>  
        <#assign startIndex=1>
    <#else>
        <#assign startIndex=(pagination.currentPage-spaceOFStartIndexToPageNo)>  
    </#if>

    <#if ((startIndex+spaceOFStartIndexToPageLinkCount) < pagination.pageCount)>
        <#assign endIndex=startIndex+spaceOFStartIndexToPageLinkCount>
    <#else>
        <#assign endIndex=(pagination.pageCount)>
    </#if>

    <#assign isNeedStartMore=false>
    <#assign isNeedEndMore=false>
    <#if (startIndex >=3)>
        <#assign isNeedStartMore=true>
    </#if>
    <#if (endIndex <= pagination.pageCount-2)>
        <#assign isNeedEndMore=true>
    </#if>

    <#if isNeedStartMore&&isShowMoreLI><span>...</span></#if>
    <#list startIndex..endIndex as i>
        <#if pagination.currentPage != i>
             <#if 1!= i &&pagination.pageCount!=i>
                 <a href="javascript:toPage('${i?c}')">${i?c}</a>
             </#if>
        <#else>
            <#if 1!= i &&pagination.pageCount!=i>
              <a class="current" >${i?c}</a>
            </#if>
        </#if>
    </#list>
    <#if isNeedEndMore&&isShowMoreLI><span>...</span></#if>
</#macro> 
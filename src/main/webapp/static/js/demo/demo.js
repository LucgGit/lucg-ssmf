var laydate = layui.laydate;

laydate.render({
	elem : '#createStartTime'
});

laydate.render({
	elem : '#createEndTime'
});

function queryUserInfo() {
	$("#searchForm").submit();
}
//手风琴动画效果
var flash_index=0;
$(".flash4 ul li").mouseover(function(){
	flash_index=$(this).index();
	$(this).stop().stop().animate({width:538},500).siblings("li").stop().animate({width:(1180-538)/(flash_size-1)},500);
	$(".imgCen").eq(flash_index).css("display","block").siblings(".imgCen").css("display","none");
	$("p.bt_2").eq(flash_index).css("display","block").siblings("p.bt_2").css("display","none");
	$(".imgTop img").eq(flash_index).addClass("tm").siblings(".imgTop img").removeClass("tm");
});
$(".flash4 ul li").mouseout(function(){
	$(".imgCen").css("display","none");
	$("p.bt_2").css("display","none");
});
AOS.init({
	easing : 'ease-out-back',
	duration : 1000
});

$('.start__scroll').on('click', function(e) {
	$('html, body').animate({
		scrollTop : $(window).height()
	}, 1200);
});

var public = checkbrowse();
var showeffect = "";
if ((public['is'] == 'msie' && public['ver'] < 8.0)) {
	showeffect = "show"
} else {
	showeffect = "fadeIn"
}
$("img").lazyload({
	effect : showeffect,// 加载图片使用的效果
	skip_invisible : false
});

function checkbrowse() {
	var ua = navigator.userAgent.toLowerCase();
	var is = (ua.match(/\b(chrome|opera|safari|msie|firefox)\b/) || [ '',
			'mozilla' ])[1];
	var r = '(?:' + is + '|version)[\\/: ]([\\d.]+)';
	var v = (ua.match(new RegExp(r)) || [])[1];
	jQuery.browser.is = is;
	jQuery.browser.ver = v;
	return {
		'is' : jQuery.browser.is,
		'ver' : jQuery.browser.ver
	}
}
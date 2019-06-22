$(function(){
	$(".subnav ul li").mouseover(function(){
		$(this).css("background","#FFFFFF");
		$(this).children().css("color","#027B00");
	});
	
	$(".subnav ul li").mouseout(function(){
		$(this).css("background","#027B00");
		$(this).children().css("color","#FFFFFF");
	});
	
	$(".img img").mouseover(function(){
		$(this).css("opacity","1");
	});
	
	$(".img img").mouseout(function(){
		$(this).css("opacity","0.8");
	});
	
	$("#open").click(function(){
		$("#agreement").css("display","block");
	});
	
	$("#close").click(function(){
		$("#agreement").css("display","none");
	});
	
	$(".morepic ul li img").mouseover(function(){
		var attr = $(this).attr("src");
		$(".treepic img").attr("src",attr);
	});
});
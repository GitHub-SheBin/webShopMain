// JavaScript Document
$(function(){
/*******首页广告轮播效果*******/
	var adnum=0;
	var imgli=$(".imground li");
	var imgitem=$(".imgitem");
	var adlen=imgli.length;
	var auto;
	/*****点击切换广告*****/	
	imgitem.click(function(){	
		clearInterval(auto);
		var itemnum=imgitem.index($(this));		
		var adli=imgli.eq(itemnum);
		var adblings=adli.siblings();
		adnum=itemnum;
		adblings.css("z-index",1);
		adli.addClass("now").css("z-index",2).stop().animate({"width":"560px"},800,function(){adblings.width(0)})	
		$(this).addClass("blue").siblings().removeClass("blue");
	});	
	
	/*****切换上一张广告*****/		
	$(".prev").click(function(){
		adnum--;if(adnum<0) adnum=adlen-1;	
		imgitem.eq(adnum).trigger("click");
	});
	
	/*****切换下一张广告*****/	
	$(".next").click(function(){
		adnum++;if(adnum>adlen-1) adnum=0;	
		imgitem.eq(adnum).trigger("click");
	});
	
	/*****自动播放广告*****/	
	function autoad(){
		auto=setInterval(function(){
		$(".next").trigger("click");
	},3500);	
	}
	autoad();
	$(".featured_slides").mouseout(function(){clearInterval(auto);autoad();});
	
/*******首页广告轮播效果 END****/
	
	$(".selling li").hover(function(){
		$(this).addClass("hover");	
	},function(){$(this).removeClass("hover");	}
	);
	
});

























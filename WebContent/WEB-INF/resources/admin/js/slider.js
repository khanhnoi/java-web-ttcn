$(document).ready(function(){
	var stt= 0 ;
	$("img.slider").each(function(){
		if($(this).is(":visible"))
			stt = $(this).attr("stt");
	});
	$("#next").click(function(){
			next = ++stt;
	$("img.slider").hide();
	$("img.slider").eq(next).show();
	});
  
});
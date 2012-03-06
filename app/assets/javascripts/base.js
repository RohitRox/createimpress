var slide_count=0;
function die_slide(obj){
obj.parentNode.parentNode.removeChild(obj.parentNode);
slide_count-=1;
}
$(document).ready(
function(){

$('#pack_form').hide();

$('#new_impress').click(function(){
	var e = $(document.createElement('div'));
	eClass = 'slide'+slide_count;
	slide_count+=1;
	e.addClass(eClass);
	$('#impress_buffer').append(e);
	$('.'+eClass).attr('id','slide'+slide_count).parent('div').append('<div class="delete-slide btn btn-danger" onclick="javascript: die_slide(this)">Delete This Slide</div><span class="count-info">Slide#'+slide_count+'</span>');
	$('.'+eClass).parent('div').append(g_option());
	scrollTo('.'+eClass,500);

	area = new nicEditor({fullPanel : true}).panelInstance('slide'+slide_count,{hasPanel : true});
});



$('#save_and_download').click(function(){
	var slides = $('.nicEdit-main');
	var pack_div = "";
	var r_x,r_y,r_z,scale,rotate;
	if(slides.length<1){ alert('No Slides Created'); return false; } else
	{
		slides.each(function(index) {
		if(index>0){
		r_x=Math.floor(Math.random()*1000);
		r_y=Math.floor(Math.random()*1000);
		if ($(this).parent('div').find('.rotate').attr('checked')){
		rotate = "data-rotate='"+Math.floor(Math.random()*360)+"'";
		}else { rotate=""; }
		if ($(this).parent('div').find('.scale').attr('checked')){
		scale = "data-scale='"+Math.floor(Math.random()*10)+"'";
		}else { scale=""; }
		if ($(this).parent('div').find('.3d').attr('checked')){
		r_z = "data-z='"+Math.floor(Math.random()*1000)+"'";
		}else { r_z=""; }
		}
		else{
		r_x=0;
		r_y=100;
		r_z="";
		rotate="";
		scale="";
		}
		pack_div += "<div class='step' data-x='"+r_x+"' data-y='"+r_y+"'"+r_z+scale+rotate+">"+$(this).html()+"</div>";
		});
	}

	pack_div;

	$('#pack').attr('value',pack_div);
	$('#pack_pack').attr('value',pack_div);
	$('#pack_form').fadeIn('slow');

});

function g_option(){
var opt='<br /> &nbsp; <label class="checkbox inline"><input type="checkbox" class="rotate"> Rotate</label><label class="checkbox inline"><input type="checkbox" class="scale"> Scale</label><label class="checkbox inline"><input type="checkbox" class="3d"> 3D </label><hr />';
return opt;
}

function scrollTo(o,s){ var d = $(o).offset().top; $("html:not(:animated),body:not(:animated)").animate({ scrollTop: d-200}, s); }


});


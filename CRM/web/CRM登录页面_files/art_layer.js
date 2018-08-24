var pathName = getRootPath();
function getRootPath() {
	var curWwwPath=window.document.location.href;
	var pathName=window.document.location.pathname;
	var pos=curWwwPath.indexOf(pathName);
	var localhostPaht=curWwwPath.substring(0,pos);
	return(localhostPaht);
}
/**
 * 公共提示信息接口
 * alert:没按钮的提示框
 * confirm:带按钮的提示框
 * info:没有标题和按钮的提示框，2秒自动关闭
 * error:错误提示信息
 * success:成功提示信息
 */
var msg = {
	alert : function(content,title) {
		layer.open({
			type: 1,
			shade: false,
			title: false,
			content: content
		});
	},
	confirm : function(content,callback,title) {
		var cf = layer.confirm(content, {
			title:title != null && title != "" ? title : '提示信息',
			move:false,
			icon:3,
			btn: ['确定','取消']
		},function(){
			layer.close(cf);
			var fn = callback;
			fn();
		});

	},
	/* 点击确定按钮关闭弹框 */
	confirm1 : function(content,callback,title) {
		var la = layer.confirm(content, {
			title:title != null && title != "" ? title : '提示信息',
			icon:3
		},callback);
		return la;
	},
	
	info:function(content){
		layer.msg(content,{time: 2000,icon: 0});
	},
	error:function(content){
		layer.msg(content, {time: 2000,icon: 2});
	},
	success:function(content){
		layer.msg(content, {time: 2000,icon: 1});
	},
	msgcont:function (content,title,width,height) {
		layer.open({
			title:title,
			type: 1,
			area: [width, height],
			content: content
		});
	}
};

/**
 * 提示错误信息
 */
$.fn.err = function(title){
	$(this).parent('div').addClass('has-error');
	$(this).tooltip({
		template:'<div class="tooltip" role="tooltip"><div class="tooltip-arrow" style="border-top-color:#d9534f"></div><div class="tooltip-inner" style="background-color:#d9534f"></div></div>',
		title:title,trigger:'manual'}).tooltip('show');
	$(this).focus(function(){
		$(this).parent('div').removeClass('has-error');
		$(this).tooltip('destroy');
	});
};

/**
 * 关闭错误信息
 */
$.fn.closeErr = function(){
	$(this).parent('div').removeClass('has-error');
	$(this).tooltip('destroy');
};
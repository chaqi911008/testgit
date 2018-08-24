<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="expires" content="0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <link href="./CRM登录页面_files/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="./CRM登录页面_files/Login-interface.css" rel="stylesheet" type="text/css">
    <script src="./CRM登录页面_files/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="./CRM登录页面_files/auto-size.js" type="text/javascript" charset="utf-8"></script>
    <script src="./CRM登录页面_files/bootstrap.js" type="text/javascript"></script>
    <script src="./CRM登录页面_files/layer.js" type="text/javascript"></script>
    <link rel="stylesheet" href="./CRM登录页面_files/layer.css" id="layui_layer_skinlayercss">
    <script src="./CRM登录页面_files/art_layer.js" type="text/javascript"></script>
    <script src="./CRM登录页面_files/jquery.vegas.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <title>CRM登录页面</title>
    <script type="text/javascript">
        //js防止页面被iframe嵌套
        $(function(){
            if (window.top != window.self) {
                top.location.href = "login";
            }
        })
    </script>

    <script type="text/javascript">
        $(function(){
            setFontSize();
        })
        $.vegas('slideshow', {
            delay: 4000,
            cover:true,
            backgrounds: [
                {src: 'images/login/Signin-bg.jpg', fade: 2000},
                {src: 'images/login/Signin-bg2.jpg', fade: 2000},
                {src: 'images/login/Signin-bg3.jpg', fade: 2000}
            ]
        });
        if (top.location != self.location)top.location = self.location;
    </script>
    <script type="text/javascript">
        $(function(){
            var a=$("#error").val();
            if(a.length!=0){
                layer.msg(a);
            }
        })
    </script>
</head>
<body><img class="vegas-background" src="./CRM登录页面_files/Signin-bg2.jpg" style="position: fixed; left: 0px; top: -84.5px; width: 1600px; height: 900px; bottom: auto; right: auto;">



<!--登录页 start-->
<div class="Signin-bg">
    <div class="tile">
        <img class="logo" src="./CRM登录页面_files/logo.png" alt="logo">
        <form class="signin" id="formId" role="form" action="tologin" method="post">
            <h3>客户商机管理系统</h3>
            <div class="btn-box">
                <i></i>
                    <input type="hidden" id="error" value="${error}">
                <input type="text" placeholder="请输入账号" id="loginNameId" class="accountNumber" name="loginname" >
            </div>
            <div class="btn-box">
                <i class="icon2"></i>
                <input type="password" id="passWordId" placeholder="请输入密码" class="passWord" name="password" >
            </div>

            <div>
                <div id="captcha1">
                    <p id="wait1" class="show">正在加载验证码......</p>
                </div>
            </div>
            <br>
            <p id="notice1" class="hide">请先完成验证</p>

            <input type="submit" id="submit1" value="登录" class="button-submit btn btn-lg btn-warning btn-block">

        </form>
    </div>
    <h4 class="copyright">Copyright © 2015-2017.Company www.dgg.net All rights reserved. Created By: 顶呱呱集团-技术中心</h4>
</div>
<!--登录页 end-->
<script type="text/javascript">
        function Name() {
            var name=$("#loginNameId").val();
            if(name.length==0){
                layer.msg("姓名不能为空！")
                return false;
            }
               return true;
        }

        function Pwd() {
            var pwd=$("#passWordId").val();
            if(pwd.length==0){
                layer.msg("密码不能为空！")
                return false;
            }
                return true;
        }
        $(function(){
            $("#formId").submit(function () {
            if(Name()&&Pwd()){
                return true;
            }
            return false;
        })
    })

</script>





<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>
<script src="js/gt.js"></script>

<script>
    var handler1 = function (captchaObj) {
        $("#submit1").click(function (e) {
            var result = captchaObj.getValidate();
            if (!result) {
                layer.msg("请先验证！");
                setTimeout(function () {

                }, 2000);
                e.preventDefault();
            }else {
                $("#formId").submit();
            }
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha1");
        captchaObj.onReady(function () {
            $("#wait1").hide();
        });
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
    $.ajax({
        url: "gt/register1?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            if(data==null){
                layer.msg("请验证验证码！");
            }

            // 调用 initGeetest 初始化参数
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "float", // 产品形式，包括：float，popup
                width: "100%"
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handler1);
        }
    });
</script>
<%--
<script type="text/javascript">
    if ("" != "") {
        msg.error("");
    };

    $(function(){
        $('#found input').keyup(function(){
            var jobNum=$.trim(document.getElementById('jobNum').value);
            var testNum=$.trim(document.getElementById('testNum').value);
            var pwd= $.trim(document.getElementById('newPwd').value);
            var sPwd= $.trim(document.getElementById('newPwd1').value);
            if (jobNum==''|| testNum=='' || pwd==''|| pwd!=sPwd) {
                $('#rest-btn').removeAttr("onclick");
                $('#rest-btn').addClass("disabled");
            }else {
                $('#rest-btn').attr("onclick","testPwd()");
                $('#rest-btn').removeClass("disabled");
            }
        });
        $('#newPwd').keyup(function(){
            var reg = new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$");
            var pwdV=$(this).val();
            if(!reg.test(pwdV)) {
                $(this).next('.pwd-tip').html('<span class="red">密码至少为6位，需要数字和字母的组合(不能有符号)</span>');
            }else {
                $(this).next('.pwd-tip').html('<span class="green">输入正确</span>');
            }
        });
        $('#newPwd1').keyup(function(){
            var pwdV=$('#newPwd').val();
            var pwdV1=$(this).val();
            if(pwdV==pwdV1) {
                $(this).next('.pwd-tip').html('<span class="green">密码输入一致</span>');
            }else {
                $(this).next('.pwd-tip').html('<span class="red">两次密码不同</span>');
            }
        })
    });
    function found() {
        layer.open({
            type:1,
            title:'找回密码',
            area:['340px'],
            content:$('#found'),
            end:function(){
                document.getElementById('jobNum').value='';
                document.getElementById('testNum').value='';
                wait=0;
            }
        });
    }
    //验证密码
    function testPwd(){
        var jobNum=$.trim(document.getElementById('jobNum').value);
        var testNum=$.trim(document.getElementById('testNum').value);
        var pwd= $.trim(document.getElementById('newPwd').value);
        var sPwd= $.trim(document.getElementById('newPwd1').value);
        if (jobNum==''|| testNum=='' || pwd=='') {
            layer.msg('工号/密码/验证码不能为空');
        }else if(pwd!=sPwd) {
            layer.msg('两次密码不一致');
        }
        else  {
            $.ajax({
                post:'POST',
                url:'/user/update_pwd.shtml',
                dataType:'json',
                data:{'jobNumber':jobNum,'pwd':pwd,'sPwd':sPwd,'code':testNum},
                success:function(data){
                    if(data.code==1) {
                        layer.closeAll();
                        msg.info(data.msg);
                        setTimeout("window.location.reload()", 1000);
                    }
                    else {
                        msg.info(data.msg);
                    }
                }
            })
        }
    }
    var wait=120;

    //获取验证码
    function getTest(){
        var reg = new RegExp("^[0-9]*$");
        var jobObj=document.getElementById('loginNameId');
        var jobNum= $.trim(jobObj.value);
        if(!reg.test(jobNum) || jobNum=='') {
            $('#getCode').attr("onclick","getTest(this)");
            layer.msg('请输入正确的工号');
        }else {
            $.ajax({
                post:'POST',
                url:'/user/confirm_phone.shtml',
                dataType:'json',
                data:{'jobNumber':jobNum},
                async: true,
                success:function(msg) {
                    if(msg.code==1) {
                        layer.confirm('发送号码为：<b style="color:#ff2e0a;font-weight: bold;">'+msg.phoneNumber+'</b>', {
                            btn: ['确定','取消'] //按钮
                        }, function(index){
                            getTestMain(jobNum);
                            layer.close(index);
                        });
                    }else {
                        layer.msg(msg.msg);
                    }
                }
            })
        }

    }
    function getTestMain(jobNum){
        $.ajax({
            post:'POST',
            url:'/user/get_forget_pwd_validate_code.shtml',
            dataType:'json',
            data:{'jobNumber':jobNum},
            async: false,
            success:function(num) {
                if(num.code==1) {
                    time();
                }else {
                    layer.msg(num.msg);
                }
            }
        })
    }
    //获取验证码倒计时
    function time() {
        if (wait==0) {
            $('#getCode').attr("onclick","getTest(this)");
            $('#getCode').removeClass('disabled').text('获取验证码');
            wait=120;
        }else {
            $('#getCode').removeAttr("onclick");
            $('#getCode').addClass('disabled').text(wait+'s后重新获取');
            wait--;
            setTimeout(function () {
                    time();
                },
                1000);
        }
    }

    //回车登陆
    document.onkeydown=function() {
        if(event.keyCode==13) {
            validate();
        }
    }

    //验证验证码
    function validate(){
        var loginName = $("#loginNameId").val();
        var isTrue = false;
        $.ajax({
            type:'POST',
            url:'/check_login_name_is_xd.shtml',
            data:{'loginName':loginName},
            success:function(data){
                /*var va = data.status;
                isMsg = true;
                if(data.status == 'success'){
                    //小顶家装
                    if($("#sendMessageId").css("display")=="none"){
                        $("#sendMessageId").show();
                        return false;
                    }
                }else{
                    //否
                    isTrue = true;
                    $("#sendMessageId").hide();
                }*/

                var jobObj=document.getElementById('loginNameId');
                var jobNum= $.trim(jobObj.value);
                var code = $("#code").val();
                var passWord = $("#passWordId").val();
                if(null==jobNum || ""==jobNum){
                    layer.msg("工号不能为空");
                    return false;
                }
                if(null==passWord || ""==passWord){
                    layer.msg("密码不能为空");
                    return false;
                }

                $("#formId").submit();
                /*if($("#sendMessageId").css("display")=="none" && isTrue==true){
            	}else{

            		if(null==code || ""==code){
            			layer.msg("验证码不能为空");
            			return false;
            		}
            		$.ajax({
                        post:'POST',
                        url:'/user/checkout_code.shtml',
                        dataType:'json',
                        data:{'jobNumber':jobNum,'code':code},
                        async: false,
                        success:function(num) {
                            if(num.code==1) {
                                $("#formId").submit();
                            }else {
                                layer.msg(num.msg);
                            }
                        }
                    })
            	}*/
            }
        })



    }


</script>
--%>



</body></html>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-17
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CRM</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="../../css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="../../css/mystyle.css" />
    <script src="./CRM登录页面_files/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<script type="text/javascript">
    $(function(){
        //日历
        $("#createTime").click(function(){
            WdatePicker({
                highLineWeekDay:true //周末高亮
                ,readOnly:true      //只读，只可用控件input中 修改内容
                ,dateFmt:'yyyy-MM-dd'
            });
        });

        $("#assignTime").click(function(){
            WdatePicker({
                highLineWeekDay:true //周末高亮
                ,readOnly:true      //只读，只可用控件input中 修改内容
                ,dateFmt:'yyyy-MM-dd'
            });
        });
    });
</script>
<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li><a href="#">客户服务管理</a></li>
        <li class="active">服务创建</li>
    </ol>
</div>
<!-- 添加数据的表格 -->
<div stlye="padding:20px;">
    <form role="form" action="toServiceCreate" method="post">
        <table width="100%" border="0" align="center">
            <tr>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">服务编号</span>
                            <input type="text" class="form-control" readonly style="width:430px;">
                        </div>
                    </div>
                </td>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">服务类型</span>
                                <select class="form-control" name="svr_type" style="width:430px;">
                                <option value="咨询">咨询</option>
                                <option value="投诉">投诉</option>
                                <option value="建议">建议</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="left" colspan="2">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">服务概要</span>
                            <input type="text" name="svr_title" placeholder="必填项" class="form-control" required style="width:900px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">客户名称</span>
                            <input type="text" name="svr_cust_name" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">服务状态</span>
                            <input type="text" name="svr_result" class="form-control" readonly value="新创建" style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="110" align="left" colspan="2">
                    <div class="col-lg-3">
                        <div class="input-group" style="height:100px;">
                            <span class="input-group-addon">服务请求</span>
                            <textarea class="form-control" name="svr_request" placeholder="必填项" required style="width:900px;height:100px;"></textarea>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">创建人&nbsp;</span>
                            <input type="text" name="svr_create_by" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">创建时间</span>
                            <input type="text" name="svr_create_date" class="form-control" placeholder="必填项" required style="width:430px;" id="createTime" />
                        </div>
                    </div>
                </td>
            </tr>
            <!-- 客户经理没有权限分配则不显示下面一行tr的内容 -->
            <tr style="border-top: #EEE solid 2px;">
                <td height="80" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">分配给&nbsp;</span>
                            <select class="form-control" name="svr_due_id" id="svr_due_id" style="width:430px;">
                                <script type="text/javascript">
                                    $(function () {
                                        $.ajax({
                                            url:"selUserName",
                                            type:"post",
                                            dataType:null,
                                            data:"json",
                                            success:function (data) {
                                                for (var i=0;i<data.length;i++){
                                                    var op=data[i];
                                                    var $s="<option value='"+op.user_id+"' ${sal_chance.chc_due_id==op.user_id}?'selected':''>"+op.user_name+"</option>";
                                                    $("#svr_due_id").append($s);
                                                }
                                            }
                                        })
                                    })
                                </script>
                            </select>
                        </div>
                    </div>
                </td>
                <td height="80" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">分配时间</span>
                            <input type="text" name="svr_due_date" class="form-control" style="width:430px;" id="assignTime" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div style="text-align:right; padding-right:20px;">
            <input type="submit" class="btn btn-primary" style="width:80px;" value="保存"/>
            <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>
        </form>
</div>
</body>
<script src="../../js/laydate.dev.js"></script>

</html>

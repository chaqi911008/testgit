<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-18
  Time: 10:06
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
        $("#chc_due_date").click(function(){
            WdatePicker({
                highLineWeekDay:true //周末高亮
                ,readOnly:true      //只读，只可用控件input中 修改内容
                ,dateFmt:'yyyy-MM-dd'
            });
        });

        $("#chc_create_date").click(function(){
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
        <li><a href="#">销售机会管理</a></li>
        <li class="active">新建销售机会</li>
    </ol>
</div>
<!-- 添加数据的表格 -->
<div stlye="padding:20px;">
    <form  action="toChanceManage" method="get">
        <table width="100%" border="0" align="center">
            <tr>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">机会编号</span>
                            <input type="text" class="form-control" readonly style="width:430px;">
                        </div>
                    </div>
                </td>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">机会来源</span>
                            <select class="form-control" style="width: 180px;" id="chc_source"
                                    name="chc_source">
                                <option value="">全部</option>
                            </select>
                            <script type="text/javascript">
                                $(function () {
                                    $.ajax({
                                        url:"selectDice",
                                        type:"post",
                                        data:null,
                                        dataType:"json",
                                        success:function (data) {
                                            for (var i=0;i<data.length;i++){
                                                var op=data[i];
                                                var $s="<option value='"+op.dict_item+"'>"+op.dict_item+"</option>";
                                                $("#chc_source").append($s);
                                            }
                                        }
                                    })
                                })
                            </script>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">客户名称</span>
                            <input type="text" name="chc_cust_name" placeholder="必填项" class="form-control" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">成功几率</span>
                            <select name="chc_rate" class="form-control" style="width:430px;">
                                <option value="10">10%</option>
                                <option value="20">20%</option>
                                <option value="30">30%</option>
                                <option value="40">40%</option>
                                <option value="50">50%</option>
                                <option value="60">60%</option>
                                <option value="70">70%</option>
                                <option value="80">80%</option>
                                <option value="90">90%</option>
                                <option value="100" selected>100%</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="left" colspan="2">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">机会概要</span>
                            <input type="text" name="chc_title"  placeholder="必填项" class="form-control"  style="width:900px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">联系人&nbsp;</span>
                            <input type="text" name="chc_linkman" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">联系电话</span>
                            <input type="text" name="chc_tel" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="110" align="left" colspan="2">
                    <div class="col-lg-3">
                        <div class="input-group" style="height:100px;">
                            <span class="input-group-addon">机会描述</span>
                            <textarea class="form-control" name="chc_desc" placeholder="必填项" required style="width:900px;height:100px;"></textarea>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">创建人&nbsp;</span>
                            <input type="text" name="chc_create_by" value="${user.user_name}" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">创建时间</span>
                            <input type="text" id="chc_create_date" name="chc_create_date" class="form-control"  style="width:430px;"  />
                        </div>
                    </div>
                </td>
            </tr>
            <input type="hidden" name="chc_create_id" value="${user.user_id}">
            <tr style="border-top: #EEE solid 2px;">
                <td height="80" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">指派给&nbsp;</span>
                            <select name="chc_due_id" id="chc_due_id" class="form-control" style="width:430px;">
                            </select>
                        </div>
                    </div>
                </td>

                <script type="text/javascript">
                    $(function(){
                        $.ajax({
                            url:"selectUserName",
                            type:"post",
                            data:null,
                            dataType:"json",
                            success:function (data) {
                                for (var i=0;i<data.length;i++){
                                    var op=data[i];
                                    var $s="<option value='"+op.user_id+"' >"+op.user_name+"</option>";
                                    $("#chc_due_id").append($s);
                                }
                            }
                        })
                    })
                </script>
                <td height="80" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">指派时间</span>
                            <input type="text" id="chc_due_date" name="chc_due_date" class="form-control" style="width:430px;" >
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="60" align="right" colspan="2" style="padding-right:20px;">

                    <input type="submit" class="btn btn-primary" style="width:80px;" value="保存"/>&nbsp;
                    <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
                </td>
            </tr>
        </table>
        </form>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-17
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link rel="stylesheet" type="text/css"
          href="../../css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="../../css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="../../css/mystyle.css" />
    <script src="./CRM登录页面_files/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    <style>
        .serviceinfo td{ font-size:14px;}
        #planinfo th{ font-size:14px;}
        #planinfo td{ font-size:14px;}
    </style>
</head>
<script type="text/javascript">
    $(function(){
        //日历
        $("#manageTime").click(function(){
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
        <li class="active">服务处理</li>
    </ol>
</div>
<!-- 数据表格展示 -->
<div style="padding:0px 20px;">
    <table width="100%" border="0" class="table table-bordered" class="serviceinfo">
        <tr>
            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${sct_service.svr_id}</td>
            <td width="20%" height="40" align="center" class="active">服务类型</td>
            <td width="30%" height="40">${sct_service.svr_type}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">概要</td>
            <td colspan="3">${sct_service.svr_title}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">客户名称</td>
            <td height="40">${sct_service.svr_cust_name}</td>
            <td height="40" align="center" class="active">状态</td>
            <td height="40">${sct_service.svr_result}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">服务请求</td>
            <td colspan="3">${sct_service.svr_request}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">创建人</td>
            <td height="40">${sct_service.svr_create_by}</td>
            <td height="40" align="center" class="active">创建时间</td>
            <td height="40"><fm:formatDate value="${sct_service.svr_create_date}" pattern="yyyy-MM-dd"/> </td>
        </tr>
    </table>
    <div style="padding:5px;"></div>
    <table width="100%" border="0" class="table table-bordered" class="serviceinfo">
        <tr>
            <td width="20%" height="40" align="center" class="active">分配给</td>
            <td width="30%" height="40">${sct_service.svr_due_to}</td>
            <td width="20%" height="40" align="center" class="active">分配时间</td>
            <td width="30%" height="40"><fm:formatDate value="${sct_service.svr_due_date}" pattern="yyyy-MM-dd"/> </td>
        </tr>
    </table>
    <div style="margin:5px; border:2px solid #CCC;"></div>
    <form action="updateSct" method="post">
        <<input type="hidden" name="svr_id" value="${sct_service.svr_id}">
    <table width="100%" border="0" align="center">
        <tr>
            <td height="110" align="left" colspan="2">
                <div class="col-lg-3">
                    <div class="input-group" style="height:100px;">
                        <span class="input-group-addon">服务处理</span>
                        <textarea name="svr_deal" class="form-control" placeholder="必填项" required style="width:900px;height:100px;"></textarea>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td height="50" align="center">
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon">处理人&nbsp;</span>
                        <input type="text" name="svr_deal_by" class="form-control" placeholder="必填项" required style="width:430px;">
                    </div>
                </div>
            </td>
            <td height="50" align="center">
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon">处理时间</span>
                        <input type="text" name="svr_deal_date" class="form-control" placeholder="必填项" required style="width:430px;" id="manageTime" />
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div style="margin:5px; border:2px solid #CCC;"></div>
    <table width="100%" border="0" align="center">
        <tr>
            <td height="50" align="center">
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon">处理结果</span>
                        <input type="text" name="svr_result" class="form-control" placeholder="必填项" required style="width:430px;">
                    </div>
                </div>
            </td>
            <td height="50" align="center">
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon">满意度&nbsp;</span>
                        <select style="width:430px;" name="svr_satisfy" class="form-control">
                            <option value="5">★★★★★</option>
                            <option value="4">★★★★</option>
                            <option value="3">★★★</option>
                            <option value="2">★★</option>
                            <option value="1">★</option>
                        </select>
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


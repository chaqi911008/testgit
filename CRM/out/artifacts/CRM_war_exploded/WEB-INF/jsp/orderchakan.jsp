<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>无标题文档</title>
    <link rel="stylesheet" type="text/css"
          href="css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <style>
        #developinfo td{ font-size:14px;}
        #planinfo th{ font-size:14px;}
        #planinfo td{ font-size:14px;}
    </style>
</head>

<body>
<!-- 导航 -->
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li><a href="orderShow">订单查询</a></li>
        <li class="active">订单查看</li>
    </ol>
</div>
<!-- 数据表格展示 -->
<div style="padding:0px 20px;">
    <table width="100%" border="0" class="table table-bordered" id="developinfo">
        <tr>
            <td width="20%" height="40" align="center" class="active">订单编号</td>
            <td width="30%" height="40">${orders.odr_id}</td>
            <td width="20%" height="40" align="center" class="active">订单类型</td>
            <td width="30%" height="40">${orders.odr_type}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">客户名称</td>
            <td height="40">${orders.odr_customer}</td>
            <td height="40" align="center" class="active">下单日期</td>
            <td height="40"><fm:formatDate value="${orders.odr_date}" pattern="yyyy-MM-dd"/></td>
        </tr>
         <tr>
            <td width="20%" height="40" align="center" class="active">订单总金额</td>
            <td width="30%" height="40">${orders.odr_cost}</td>
        </tr>
    </table>
  
    <div style="text-align:right; padding-right:20px;">
        <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
    </div>
</div>
</body>
</html>

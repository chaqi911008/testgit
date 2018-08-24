<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看用户信息详情</title>
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
<style>
#developinfo td{ font-size:14px;}
#planinfo th{ font-size:14px;}
#planinfo td{ font-size:14px;}
</style>
</head>

<body>
	<!-- 导航 -->
    <div>
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li><a href="#">客户信息</a></li>
          <li class="active">查看</li>
        </ol>
    </div>
    <!-- 数据表格展示 -->
    <div style="padding:0px 20px;">
    	<table width="100%" border="0" class="table table-bordered" id="developinfo">
          <tr>
            <td width="20%" height="40" align="center" class="active">客户编号</td>
            <td width="30%" height="40">${cst_customer.cust_no }</td>
            <td width="20%" height="40" align="center" class="active">客户名称</td>
            <td width="30%" height="40">${cst_customer.cust_name }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">客户等级（名称）</td>
            <td height="40">${cst_customer.cust_level_label }</td>
            <td height="40" align="center" class="active">电话</td>
            <td height="40">${cst_customer.cust_tel }</td>
          </tr>
            <tr>
                <td height="40" align="center" class="active">地址</td>
                <td height="40">${cst_customer.cust_addr }</td>
                <td height="40" align="center" class="active">信用度</td>
                <td height="40">${cst_customer.cust_credit }</td>
            </tr>
          <tr>
            <td height="40" align="center" class="active">注册资金</td>
            <td height="40" colspan="3">${cst_customer.cust_bankroll }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">年营业额</td>
            <td height="40">${cst_customer.cust_turnover }</td>
            <td height="40" align="center" class="active">开户银行</td>
            <td height="40">${cst_customer.cust_bank }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">银行账号</td>
            <td height="40" colspan="3">${cst_customer.cust_bank_account }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">地税登记号</td>
            <td height="40">${cst_customer.cust_local_tax_no }</td>
            <td height="40" align="center" class="active">国税登记号</td>
            <td height="40">${cst_customer.cust_national_tax_no }</td>
          </tr>
            <tr>
                <td height="40" align="center" class="active">营业执照注册号</td>
                <td height="40" colspan="3">${cst_customer.cust_licence_no }</td>
            </tr>
            <tr>
                <td height="40" align="center" class="active">客户状态</td>
                <td height="40">${cst_customer.cust_status }</td>
                <td height="40" align="center" class="active">邮政编码</td>
                <td height="40">${cst_customer.cust_zip }</td>
            </tr>
            <tr>
                <td height="40" align="center" class="active">传真</td>
                <td height="40">${cst_customer.cust_fax }</td>
                <td height="40" align="center" class="active">网址</td>
                <td height="40">${cst_customer.cust_website }</td>
            </tr>
        </table>
        </div>
        <div style="text-align:right; padding-right:20px;">
        	<button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>

</body>
</html>
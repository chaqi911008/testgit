<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-20
  Time: 11:41
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
        <li><a href="#">客户开发计划</a></li>
        <li class="active">查看</li>
    </ol>
</div>
<!-- 数据表格展示 -->
<div style="padding:0px 20px;">
    <table width="100%" border="0" class="table table-bordered" id="developinfo">
        <tr>
            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${salChance.chc_id}</td>
            <td width="20%" height="40" align="center" class="active">机会来源</td>
            <td width="30%" height="40">${salChance.chc_source}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">客户名称</td>
            <td height="40">${salChance.chc_cust_name}</td>
            <td height="40" align="center" class="active">成功几率</td>
            <td height="40">${salChance.chc_rate}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">概要</td>
            <td height="40">${salChance.chc_title}</td>
            <td height="40" align="center" class="active">状态</td>
            <c:if test="${salChance.chc_status==0}">
            <td height="40">未开发</td>
            </c:if>
            <c:if test="${salChance.chc_status==1}">
                <td height="40">开发中</td>
            </c:if>
            <c:if test="${salChance.chc_status==2}">
                <td height="40">已归档</td>
            </c:if>
            <c:if test="${salChance.chc_status==3}">
                <td height="40">开发失败</td>
            </c:if>
        </tr>
        <tr>
            <td height="40" align="center" class="active">联系人</td>
            <td height="40">${salChance.chc_linkman}</td>
            <td height="40" align="center" class="active">联系人电话</td>
            <td height="40">${salChance.chc_tel}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">机会描述</td>
            <td height="40" colspan="3">${salChance.chc_desc}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">创建人</td>
            <td height="40">${salChance.chc_create_by}</td>
            <td height="40" align="center" class="active">创建时间</td>
            <td height="40"><fm:formatDate value="${salChance.chc_create_date}" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">指派给</td>
            <td height="40">${salChance.chc_due_to}</td>
            <td height="40" align="center" class="active">指派时间</td>
            <td height="40"><fm:formatDate value="${salChance.chc_due_date}" pattern="yyyy-MM-dd"/></td>
        </tr>
    </table>
    <div style="padding:5px;"></div>
    <!-- 计划执行效果展示 -->
    <table class="table table-hover" id="planinfo">
        <thead>
        <tr>
            <th width="20%" class="text-center">日期</th>
            <th width="40%" class="text-center">计划</th>
            <th width="40%" class="text-center">执行效果</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${salPlanList}" var="p">
        <tr>
            <td align="center"><fm:formatDate value="${p.pla_date}" pattern="yyyy-MM-dd"/></td>
            <td align="center">${p.pla_todo}</td>
            <td align="center">${p.pla_result} </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="text-align:right; padding-right:20px;">
        <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
    </div>
</div>
</body>
</html>


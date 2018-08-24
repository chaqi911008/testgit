<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-17
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>无标题文档</title>
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
        <li><a href="#">用户管理</a></li>
        <li class="active">操作角色</li>
    </ol>
</div>
<!-- 数据表格展示 -->
<div style="padding:0px 20px;">
    <h1><span class="label label-primary">客户经理</span></h1>
    <form action="" method="post">
        <div style="padding:10px 20px; font-size:14px;">
            <h2><span class="label label-success">营销管理</span></h2>
            <hr/>
            <!-- 读取Floder类型和Document类型的权限,加载出下面的权限列表
            已经拥有的权限操作则加上checked属性 -->
            <div class="checkbox-inline">
                <label><input type="checkbox" value="1" checked="checked">销售机会管理</label>
            </div>
            <div class="checkbox-inline">
                <label><input type="checkbox" value="1">销售机会管理</label>
            </div>

            <h2><span class="label label-success">营销管理</span></h2>
            <hr/>
            <div class="checkbox-inline">
                <label><input type="checkbox" value="1">销售机会管理</label>
            </div>
            <div class="checkbox-inline">
                <label><input type="checkbox" value="1">销售机会管理</label>
            </div>

            <h2><span class="label label-success">营销管理</span></h2>
            <hr/>
            <div class="checkbox-inline">
                <label><input type="checkbox" value="1">销售机会管理</label>
            </div>
            <div class="checkbox-inline">
                <label><input type="checkbox" value="1">销售机会管理</label>
            </div>
        </div>

        <div style="text-align:right; padding-right:20px;">
            <button type="submit" class="btn btn-primary" style="width:80px;">保存</button>
            <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>
    </form>
</div>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-16
  Time: 16:21
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

    <link rel="stylesheet" type="text/css"
          href="../../css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="../../css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="../../css/mystyle.css" />

</head>
    <
<script type="text/javascript">
    function update(id) {

    }
</script>
<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li class="active">角色管理</li>
    </ol>
</div>
<!-- 展示表格数据 -->
<div style="padding:10px 20px;">
    <table class="table table-hover ">
        <thead>
        <tr>
            <th><span>编号</span></th>
            <th><span>角色名称</span></th>
            <th class="text-center" width="50%"><span>角色描述</span></th>
            <th class="text-center"><span>角色拥有者数量</span></th>
            <th class="text-center"><span>操作</span></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${rolePage.list}" var="r">
        <tr>
            <td>${r.role_id}</td>
            <td>
                <c:if test="${r.role_id==1}">
                    系统管理员
                </c:if>
                <c:if test="${r.role_id==2}">
                    高管
                </c:if>
                <c:if test="${r.role_id==3}">
                    客户主管
                </c:if>
                <c:if test="${r.role_id==4}">
                    客户经理
                </c:if>
            </td>
            <td class="text-center">${r.role_desc}</td>
            <td class="text-center">100</td>
            <td style="width: 15%;" align="center">
                <!--系统管理员不需要下面的按钮 -->
                <c:if test="${r.role_id==1}">

                </c:if>
                <c:if test="${r.role_id!=1}">
                <a href="roleAssign" class="table-link" title="操作角色">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
                <!-- 禁用和启用按钮判断出现,跟user列表一样, -->
                <a href="#" onclick="update(${r.role_id})" class="table-link danger" title="禁用">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
                </c:if>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>


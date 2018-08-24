<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-17
  Time: 12:22
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
          href="css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li class="active">用户管理</li>
    </ol>
</div>
<!-- 动态查询条件 -->
<form action="userList" method="post">
<div style="padding:0px 20px 0px 0px;">
    <table>
        <tr>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">用户名称</span>
                        <input type="text" name="userXX" value="${userXX}"  class="form-control" style="width:200px;">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">角色</span>
                        <select name="user_role_id" class="form-control" style="width:200px;">
                            <option value="0" ${user_role_id==""?"selected":""}>全部</option>
                            <!-- 使用ajax读取 -->
                            <option value="1" ${user_role_id=="1"?"selected":""}>系统管理员</option>
                            <option value="2" ${user_role_id=="2"?"selected":""}>高管</option>
                            <option value="3" ${user_role_id=="3"?"selected":""}>客户主管</option>
                            <option value="4" ${user_role_id=="4"?"selected":""}>客户经理</option>
                        </select>
                    </div>
                </div>
            </td>
            <td align="left" width="15%">
                <input type="submit" class="btn btn-info" style="width:80px;" value="查询"></input>
            </td>
            <td>
                <div class="filter-block pull-right" style="margin-left:10px;">
                    <a href="userInsert" class="btn btn-primary pull-right">
                        <i	class="fa fa-plus-circle fa-lg"></i> 添加用户
                    </a>
                </div>
            </td>
        </tr>
    </table>
</div>
</form>
<!-- 展示表格数据 -->
<div style="padding:10px 20px;">
    <table class="table table-hover" id="table">
        <thead>
        <tr>
            <th><span>编号</span></th>
            <th><span>用户名称</span></th>
            <th class="text-center"><span>角色名称</span></th>
            <th class="text-center"><span>操作</span></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userPage.list}" var="u">
        <tr id="tr1">
            <td>${u.user_id}</td>
            <td>${u.user_name}</td>
            <td class="text-center">
                <c:if test="${u.user_role_id==1}">
                    系统管理员
                </c:if>
                <c:if test="${u.user_role_id==2}">
                    高管
                </c:if>
                <c:if test="${u.user_role_id==3}">
                    客户主管
                </c:if>
                <c:if test="${u.user_role_id==4}">
                    客户经理
                </c:if>
            </td>
            <!-- 如果为自己,则不显示下面的操作按钮
                显示&nbsp;
            -->
            <c:if test="${user.user_id==u.user_id}">

            </c:if>
            <c:if test="${user.user_id!=u.user_id}">
                <td style="width: 15%;" align="center">
                    <a href="userAssign?id=${u.user_id}" class="table-link" title="分配角色">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                            </span>
                    </a>
                    <a href="delUser?id=${u.user_id}" class="table-link danger" title="删除">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                            </span>
                    </a>
                </td>
            </c:if>

        </tr>
        </c:forEach>
        </tbody>
    </table>

    <ul class="pager">
        <li>
            <c:if test="${userPage.pageNow==1}" var="s">
                <a href="javaScript:void(0)" style="color: #999">首页</a>
            </c:if>
            <c:if test="${userPage.pageNow!=1}">
                <a href="userList?pageNow=1&userXX=${userXX}&user_role_id=${user_role_id}">首页</a>
            </c:if>

        </li>
        <li>
            <c:if test="${userPage.pageNow>1}">
                <a href="userList?pageNow=${userPage.pageNow-1}&userXX=${userXX}&user_role_id=${user_role_id}">上一页</a>
            </c:if>
            <c:if test="${userPage.pageNow<=1 }">
                <a href="javaScript:void(0)" style="color: #999">上一页</a>
            </c:if>
        </li>
        <li><span>当前第${userPage.pageNow}/共${userPage.pageCount}页</span></li>
        <li>
            <c:if test="${userPage.pageNow<userPage.pageCount}">
                <a href="userList?pageNow=${userPage.pageNow+1}&userXX=${userXX}&user_role_id=${user_role_id}">下一页</a>
            </c:if>
            <c:if test="${userPage.pageNow>=userPage.pageCount }">
                <a href="javaScript:void(0)" style="color: #999">下一页</a>
            </c:if>
        </li>
        <li>
            <c:if test="${userPage.pageNow==userPage.pageCount || userPage.pageCount==0}">
                <a href="javaScript:void(0)" style="color: #999">尾页</a>
            </c:if>
            <c:if test="${userPage.pageNow!=userPage.pageCount && userPage.pageCount!=0}">
                <a href="userList?pageNow=${userPage.pageCount}&userXX=${userXX}&user_role_id=${user_role_id}">尾页</a>
            </c:if>
        </li>
    </ul>
</div>
</body>
</html>


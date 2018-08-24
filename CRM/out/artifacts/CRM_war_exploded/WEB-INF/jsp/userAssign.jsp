<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-17
  Time: 12:20
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
        <li class="active">分配角色</li>
    </ol>
</div>
<!-- 数据表格展示 -->
<form action="touserAssign" method="post" >
<div style="padding:0px 20px;">
    <table width="100%" border="0" class="table table-bordered" id="developinfo">
        <tr>
            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${userAll.user_id}</td>
            <td width="20%" height="40" align="center" class="active">用户名称</td>
            <td width="30%" height="40">${userAll.user_name}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">角色名称</td>
            <td height="40" colspan="3">
                ${userAll.sys_role.role_name}
            </td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">角色概要</td>
            <td height="40" colspan="3">${userAll.sys_role.role_desc}</td>
        </tr>
    </table>
    <div style="padding:5px;"></div>
        <table width="100%" border="0" align="right" class="table">
            <tr>
                <td width="50%">
                    <input type="hidden" id="user_id" name="user_id" value="${userAll.user_id}">
                </td>
                <td height="40" align="right">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">指派角色</span>
                            <select id="role_id" name="role_id" class="form-control" style="width:430px;">
                                <!-- 做判断,自己的目前的角色名称不在下拉列表中 -->
                                <c:if test="${userAll.user_role_id==1}">
                                    <option value="2">高管</option>
                                    <option value="3">客户主管</option>
                                    <option value="4">客户经理</option>
                                </c:if>


                                <c:if test="${userAll.user_role_id==2}">
                                    <option value="1">系统管理员</option>
                                    <option value="3">客户主管</option>
                                    <option value="4">客户经理</option>
                                </c:if>

                                <c:if test="${userAll.user_role_id==3}">
                                    <option value="1">系统管理员</option>
                                    <option value="2">高管</option>
                                    <option value="4">客户经理</option>
                                </c:if>

                                <c:if test="${userAll.user_role_id==4}">
                                    <option value="1">系统管理员</option>
                                    <option value="2">高管</option>
                                    <option value="3">客户主管</option>
                                </c:if>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div style="text-align:right; padding-right:20px;">
            <input type="submit" class="btn btn-primary" style="width:80px;" value="保存"/>
            <%--<script type="text/javascript">
                function baochun(){
                    var b=$("#role_id").val();
                    var a=$("#user_id").val();
                    $.ajax({
                        url:"update",
                        type:"post",
                        data:{"role_id":b,"user_id":a},
                        dataType:"json",
                        success:function (data) {
                            if(data!=null){
                                window.location.href="userAssign?id="+a;
                            }
                        }
                    })
                }
            </script>--%>
            <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>
        </div>
    </form>

</div>

</body>
</html>

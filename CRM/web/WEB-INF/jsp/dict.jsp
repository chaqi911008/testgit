<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-16
  Time: 17:16
  To basge this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="s"%>
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

    <meta charset="utf-8">
</head>

<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li class="active">数据字典管理</li>
    </ol>
</div>
<!-- 动态查询条件 -->
<div style="padding:0px 30px 0px 0px;">
<form action="dictServer" method="post">
    <table>
        <tr>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">类别</span>
                        <input type="text" value="${dict_type}" name="dict_type" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">条目</span>
                        <input type="text" value="${dict_item}" name="dict_item" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">值</span>
                        <input type="text" value="${dict_value}"  name="dict_value" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td align="left" width="15%">
                <button type="submit" class="btn btn-info" style="width:80px;">查询</button>
            </td>
           
        </tr>
    </table>
    </form>
</div>
<!-- 展示表格数据 -->
<div style="padding:10px 20px;">
    <table class="table table-hover">
        <thead>
        <tr>
            <th><span>编号</span></th>
            <th><span>类别</span></th>
            <th><span>条目</span></th>
            <th class="text-center"><span>值</span></th>
            <th>&nbsp;</th>
             <th>&nbsp;</th>
            <th>&nbsp;</th> 
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
         <c:forEach items="${bas.list }" var="b">
       <tr>
            <td>${b.dict_id }</td>
            <td>${b.dict_type }</td>
            <td>${b.dict_item }</td>
            <td class="text-center">${b.dict_value }</td>
            <c:if test="${user.user_role_id==1}">
           <td style="width: 15%;">
           		
              <a href="dalete?id=${b.dict_id}" class="table-link danger" title="删除">
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



<%--
<ul class="pager">
    <li>
        <c:if test="${ordersPage.pageNow==1}" var="s">
            <a href="javaScript:void(0)" style="color: #999">首页</a>
        </c:if>
        <c:if test="${ordersPage.pageNow!=1}">
            <a href="orderShow?pageNow=1&odr_customer=${odr_customer}&odr_type=${odr_type}">首页</a>
        </c:if>

    </li>
    <li>
        <c:if test="${ordersPage.pageNow>1}">
            <a href="orderShow?pageNow=${ordersPage.pageNow-1}&odr_customer=${odr_customer}&odr_type=${odr_type}">上一页</a>
        </c:if>
        <c:if test="${ordersPage.pageNow<=1 }">
            <a href="javaScript:void(0)" style="color: #999">上一页</a>
        </c:if>
    </li>
    <li><span>当前第${ordersPage.pageNow}/共${ordersPage.pageCount}页</span></li>
    <li>
        <c:if test="${ordersPage.pageNow<ordersPage.pageCount}">
            <a href="orderShow?pageNow=${ordersPage.pageNow+1}&odr_customer=${odr_customer}&odr_type=${odr_type}">下一页</a>
        </c:if>
        <c:if test="${ordersPage.pageNow>=ordersPage.pageCount }">
            <a href="javaScript:void(0)" style="color: #999">下一页</a>
        </c:if>
    </li>
    <li>
        <c:if test="${ordersPage.pageNow==ordersPage.pageCount || ordersPage.pageCount==0}">
            <a href="javaScript:void(0)" style="color: #999">尾页</a>
        </c:if>
        <c:if test="${ordersPage.pageNow!=ordersPage.pageCount && ordersPage.pageCount!=0}">
            <a href="orderShow?pageNow=${ordersPage.pageCount}&odr_customer=${odr_customer}&odr_type=${odr_type}">尾页</a>
        </c:if>
    </li>
</ul>
--%>


  <ul class="pager">
        <li>
            <c:if test="${bas.pageNow==1}">
                <a href="javaScript:void(0)" style="color: #999">首页</a>
            </c:if>
            <c:if test="${bas.pageNow!=1}">
                <a href="dictServer?pageNow=1&dict_type=${dict_type}&dict_item=${dict_item}&dict_value=${dict_value}">首页</a>
            </c:if>

        </li>
        <li>
            <c:if test="${bas.pageNow>1}">
                <a href="dictServer?pageNow=${bas.pageNow-1}&dict_type=${dict_type}&dict_item=${dict_item}&dict_value=${dict_value}">上一页</a>
            </c:if>
            <c:if test="${bas.pageNow<=1 }">
                <a href="javaScript:void(0)" style="color: #999">上一页</a>
            </c:if>
        </li>
        <li><span>当前第${bas.pageNow}/共${bas.pageCount}页</span></li>
        <li>
            <c:if test="${bas.pageNow<bas.pageCount}">
                <a href="dictServer?pageNow=${bas.pageNow+1}&dict_type=${dict_type}&dict_item=${dict_item}&dict_value=${dict_value}">下一页</a>
            </c:if>
            <c:if test="${bas.pageNow>=bas.pageCount }">
                <a href="javaScript:void(0)" style="color: #999">下一页</a>
            </c:if>
        </li>

        <li>
            <c:if test="${bas.pageNow==bas.pageCount || bas.pageCount==0}">
                <a href="javaScript:void(0)" style="color: #999">尾页</a>
            </c:if>
            <c:if test="${bas.pageNow!=bas.pageCount && bas.pageCount!=0}">
                <a href="dictServer?pageNow=${bas.pageCount}&dict_type=${dict_type}&dict_item=${dict_item}&dict_value=${dict_value}">尾页</a>
            </c:if>

        </li>
    </ul>
</div>
</body>
</html>


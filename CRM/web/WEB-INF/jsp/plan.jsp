<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-16
  Time: 17:16
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

    <meta charset="utf-8">
</head>

<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li class="active">客户开发计划</li>
    </ol>
</div>
<!-- 动态查询条件 -->
<form action="plan" method="post">
<div style="padding:0px 20px 0px 0px;">
    <table>
        <tr>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">客户名称</span>
                        <input type="text" name="chc_cust_name" value="${chc_cust_name}" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">概要</span>
                        <input type="text" name="chc_title" value="${chc_title}" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">联系人</span>
                        <input type="text" name="chc_linkman" value="${chc_linkman}" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td align="left" width="15%">
                <input type="submit" class="btn btn-info" style="width:80px;" value="查询"/>
            </td>
        </tr>
    </table>
</div>
</form>
<!-- 展示表格数据 -->
<div style="padding:10px 20px;">
    <table class="table table-hover">
        <thead>
        <tr>
            <th><span>编号</span></th>
            <th><span>客户名称</span></th>
            <th><span>概要</span></th>
            <th class="text-center"><span>联系人</span></th>
            <th class="text-center"><span>联系人电话</span></th>
            <th class="text-center"><span>创建时间</span></th>
            <th class="text-center"><span>状态</span></th>
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sal_planPage.list}" var="p">
        <tr>
            <input type="hidden" name="chc_id" value="${p.chc_id}">
            <td>${p.chc_id}</td>
            <td>${p.chc_cust_name}</td>
            <td>${p.chc_title}</td>
            <td class="text-center">${p.chc_linkman}</td>
            <td class="text-center">${p.chc_tel}</td>
            <td class="text-center"><fm:formatDate value="${p.chc_create_date}" pattern="yyyy-MM-dd"/> </td>
            <c:if test="${p.chc_status ==0}">
                <td class="text-center">未开发</td>
            </c:if>
            <c:if test="${p.chc_status ==1}">
                <td class="text-center">开发中</td>
            </c:if>
            <c:if test="${p.chc_status ==2}">
                <td class="text-center">已归档</td>
            </c:if>
            <c:if test="${p.chc_status ==3}">
                <td class="text-center">开发失败</td>
            </c:if>

            <c:if test="${p.chc_status ==2}">
            <td style="width: 15%;">
                <a href="planLookup?id=${p.chc_id}" class="table-link" title="查看">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
            </td>
            </c:if>
            <c:if test="${p.chc_status ==0}">
                <td style="width: 15%;">
                    <a href="planFormulate?id=${p.chc_id}" class="table-link" title="制定计划">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-pencil-square-o fa-stack-1x fa-inverse"></i>
                            </span>
                    </a>
                    <a href="planExecute?id=${p.chc_id}" class="table-link" title="执行计划">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-external-link fa-stack-1x fa-inverse"></i>
                            </span>
                    </a>
                </td>
            </c:if>
            <c:if test="${p.chc_status !=2 && p.chc_status !=0}">
            <td style="width: 15%;">
                <a href="planFormulate?id=${p.chc_id}" class="table-link" title="制定计划">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-pencil-square-o fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
                <a href="planExecute?id=${p.chc_id}" class="table-link" title="执行计划">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-external-link fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
                <a href="upChanceAssignStatus?id=${p.chc_id}&chc_status=2" class="table-link danger" title="开发成功">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-check fa-stack-1x fa-inverse"></i>
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
            <c:if test="${sal_planPage.pageNow==1}" var="s">
                <a href="javaScript:void(0)" style="color: #999">首页</a>
            </c:if>
            <c:if test="${sal_planPage.pageNow!=1}">
                <a href="plan?pageNow=1&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">首页</a>
            </c:if>

        </li>
        <li>
            <c:if test="${sal_planPage.pageNow>1}">
                <a href="plan?pageNow=${sal_planPage.pageNow-1}&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">上一页</a>
            </c:if>
            <c:if test="${sal_planPage.pageNow<=1 }">
                <a href="javaScript:void(0)" style="color: #999">上一页</a>
            </c:if>
        </li>
        <li><span>当前第${sal_planPage.pageNow}/共${sal_planPage.pageCount}页</span></li>
        <li>
            <c:if test="${sal_planPage.pageNow<sal_planPage.pageCount}">
                <a href="plan?pageNow=${sal_planPage.pageNow+1}&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">下一页</a>
            </c:if>
            <c:if test="${sal_planPage.pageNow>=sal_planPage.pageCount }">
                <a href="javaScript:void(0)" style="color: #999">下一页</a>
            </c:if>
        </li>
        <li>
            <c:if test="${sal_planPage.pageNow==sal_planPage.pageCount || sal_planPage.pageCount==0}">
                <a href="javaScript:void(0)" style="color: #999">尾页</a>
            </c:if>
            <c:if test="${sal_planPage.pageNow!=sal_planPage.pageCount && sal_planPage.pageCount!=0}">
                <a href="plan?pageNow=${sal_planPage.pageCount}&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">尾页</a>
            </c:if>
        </li>
    </ul>
</div>
</body>
</html>


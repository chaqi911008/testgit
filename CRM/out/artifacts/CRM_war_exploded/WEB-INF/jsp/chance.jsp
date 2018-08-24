<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-16
  Time: 17:14
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
    <link rel="stylesheet" href="js/jDialog/jDialog.css" type="text/css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jDialog.js"></script>


</head>

<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li class="active">销售机会管理</li>
    </ol>
</div>


<!-- 动态查询条件 -->
<form action="chance" method="post">
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
                <input type="submit"  class="btn btn-info" style="width:80px;" value="查询"/>
            </td>
            <td>
                <div class="filter-block pull-right" style="margin-left:10px;">
                    <a href="chanceManage" class="btn btn-primary pull-right">
                        <i	class="fa fa-plus-circle fa-lg"></i> 添加机会
                    </a>
                </div>
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
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sal_chancePage.list}" var="sal">
        <tr>
            <td>${sal.chc_id}</td>
            <td>${sal.chc_cust_name}</td>
            <td>${sal.chc_title}</td>
            <td class="text-center">${sal.chc_linkman}</td>
            <td class="text-center">${sal.chc_tel}</td>
            <td class="text-center"><fm:formatDate value="${sal.chc_create_date}" pattern="yyyy-MM-dd"/></td>
            <td style="width: 15%;">
                <a href="chanceAssign?id=${sal.chc_id}&chaxun=select"	class="table-link" title="查看">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
                <a href="upChanceAssign?id=${sal.chc_id}&chaxun=update" class="table-link" title="修改">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
                <a href="javaScript:void(0)" id="table-link" class="table-link danger" onclick="del(${sal.chc_id})" title="更改状态">
                    <script type="text/javascript">

                        //删除前的提示
                        function del(id){
                            var dialog = jDialog.confirm('确定要修改状态吗？',{
                                handler : function(button,dialog) {
                                    window.location.href="upChanceAssignStatus?chc_status=3&id="+id;
                                    dialog.close();
                                }
                            },{
                                handler : function(button,dialog) {
                                    dialog.close();
                                }
                            });
                        }

                    </script>
                    <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <ul class="pager">
        <li>
            <c:if test="${sal_chancePage.pageNow==1}" var="s">
                <a href="javaScript:void(0)" style="color: #999">首页</a>
            </c:if>
            <c:if test="${sal_chancePage.pageNow!=1}">
                <a href="chance?pageNow=1&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">首页</a>
            </c:if>

        </li>
        <li>
            <c:if test="${sal_chancePage.pageNow>1}">
                <a href="chance?pageNow=${sal_chancePage.pageNow-1}&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">上一页</a>
            </c:if>
            <c:if test="${sal_chancePage.pageNow<=1 }">
                <a href="javaScript:void(0)" style="color: #999">上一页</a>
            </c:if>
        </li>
        <li><span>当前第${sal_chancePage.pageNow}/共${sal_chancePage.pageCount}页</span></li>
        <li>
            <c:if test="${sal_chancePage.pageNow<sal_chancePage.pageCount}">
                <a href="chance?pageNow=${sal_chancePage.pageNow+1}&&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">下一页</a>
            </c:if>
            <c:if test="${sal_chancePage.pageNow>=sal_chancePage.pageCount }">
                <a href="javaScript:void(0)" style="color: #999">下一页</a>
            </c:if>
        </li>
        <li>
            <c:if test="${sal_chancePage.pageNow==sal_chancePage.pageCount || sal_chancePage.pageCount==0}">
                <a href="javaScript:void(0)" style="color: #999">尾页</a>
            </c:if>
            <c:if test="${sal_chancePage.pageNow!=sal_chancePage.pageCount && sal_chancePage.pageCount!=0}">
                <a href="chance?pageNow=${sal_chancePage.pageCount}&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">尾页</a>
            </c:if>
        </li>
    </ul>
</div>
</body>
</html>


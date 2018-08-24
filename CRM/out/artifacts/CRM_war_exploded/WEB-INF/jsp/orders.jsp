<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
     <%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
    <link rel="stylesheet" href="js/jDialog/jDialog.css" type="text/css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jDialog.js"></script>
    <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>

</head>

<body>
	<!-- 导航 -->
    <div>
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li class="active">订单查询</li>
        </ol>
    </div>
    <!-- 动态查询条件 -->
    <div style="padding:0px 20px 0px 0px;">
    <form action="orderShow" method="post">
    
    	<table>
            <tr>
                <td>
                    <div class="col-lg-3">
                    <div class="input-group" >
                      <span class="input-group-addon" style="width:100px;">客户名称</span>
                      <input type="text" class="form-control" style="width:200px;" name="odr_customer" value="${odr_customer}">
                    </div>
                    </div>
                </td>
                <td>
                    <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon" style="width:100px;">订单类型</span>
                      <select class="form-control"  style="width:200px;" name="odr_type">
                      	<option value="" ${odr_type==""?"selected":""}>全部</option>
                        <option value="销售订单" ${odr_type=="销售订单"?"selected":""}>销售订单</option>
                          <option value="采购订单" ${odr_type=="采购订单"?"selected":""}>采购订单</option>
                          <option value="生产订单" ${odr_type=="生产订单"?"selected":""}>生产订单</option>
                      </select>
                    </div>
                    </div>
                </td>
                <td align="left" width="15%">
                   <input type="submit" class="btn btn-info" style="width:80px" value="查询">
                </td>
                <td>
                    <div class="filter-block pull-right" style="margin-left:10px;">
                        <a href="orderinsert" class="btn btn-primary pull-right"> 
                            <i	class="fa fa-plus-circle fa-lg"></i> 添加订单
                        </a>
                    </div>
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
                    <th><span>客户名称</span></th>
                    <th><span>下单日期</span></th>
                    <th class="text-center"><span>订单类型</span></th>
                    <th class="text-center"><span>订单总金额</span></th>
 
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${ordersPage.list }" var="o">
                <tr>
                    <td>${o.odr_id }</td>
                    <td>${o.odr_customer }</td>
                    <td><fm:formatDate value="${o.odr_date}" pattern="yyyy-MM-dd"/></td>
                    <td class="text-center">${o.odr_type }</td>
                    <td class="text-center">${o.odr_cost } </td>
                    <td style="width: 15%;">
                        <a href="orderchakan?id=${o.odr_id }"	class="table-link" title="查看">
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                            </span>
                        </a> 
                        <a href="orderupdatechaxun?id=${o.odr_id }" class="table-link" title="修改">
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                            </span>
                        </a> 
                        <a href="javaScript:void(0)" onclick="del(${o.odr_id })" class="table-link danger" title="删除">
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                        <script type="text/javascript">
                            //删除前的提示
                            function del(id){
                                var dialog = jDialog.confirm('确定要修改状态吗？',{
                                    handler : function(button,dialog) {
                                        window.location.href="orderdelete?odr_status=2&id="+id;
                                        dialog.close();
                                 }
                                },{
                                        handler : function(button,dialog) {
                                        dialog.close();
                                    }
                                 });
                            }

                        </script>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>

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
    </div>
</body>
</html>

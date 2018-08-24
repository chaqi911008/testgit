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
<title>无标题文档</title>
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />

<style>
#developinfo td{ font-size:14px;}
#planinfo th{ font-size:14px;}
#planinfo td{ font-size:14px;}
</style>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
    $(function(){
        //日历
        $("#odr_date").click(function(){
            WdatePicker({
                highLineWeekDay:true //周末高亮
                ,readOnly:true      //只读，只可用控件input中 修改内容
                ,dateFmt:'yyyy-MM-dd'
            });
        });
    });
</script>
</head>

<body>
	<!-- 导航 -->
    <div>
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li><a href="orderShow">订单查询</a></li>
          <li class="active">订单修改</li>
        </ol>
    </div>
    <!-- 数据表格展示 -->
    <div style="padding:0px 20px;">
    <form action="ordersupdate" method="post">
    	<div stlye="padding:20px;">
			<table width="100%" border="0" align="center">
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">订单编号</span> <input type="text"
									class="form-control" readonly style="width: 430px;" value="${orders.odr_id}" name="odr_id">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户名称</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 430px;" name="odr_customer" value="${orders.odr_customer}">
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">下单日期</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 430px;" name="odr_date" id="odr_date"  value="<fm:formatDate value="${orders.odr_date}" pattern="yyyy-MM-dd"/>">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">订单总金额</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 430px;" name="odr_cost" value="${orders.odr_cost}">
							</div>
						</div>
					</td>
				</tr>
			</table>
        <div style="padding:5px;"></div>
        
        <table width="100%" border="0" align="right" class="table">
          <tr>
            <td height="40" align="right">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">订单类型</span>
                      <select class="form-control" style="width:430px;" name="odr_type">
                      	<!-- 做判断,自己的目前的角色名称不在下拉列表中 -->
						  <option value="" ${requestScope.orders.odr_type == ""?"selected":"" }>全部</option>
                      	<option value="销售订单" ${requestScope.orders.odr_type == "销售订单"?"selected":"" }>销售订单</option>
						  <option value="采购订单" ${requestScope.orders.odr_type == "采购订单"?"selected":"" }>采购订单</option>
						  <option value="生产订单" ${requestScope.orders.odr_type == "生产订单"?"selected":"" }>生产订单</option>
                        </select>
                    </div>
                </div>
            </td>
          </tr>
        </table>
		</div>
        <div style="text-align:right; padding-right:20px;">
            <input type="submit" class="btn btn-primary" style="width:80px;" value="保存"/>
        	<button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>
        </form>
        </div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
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
		<ol class="breadcrumb" style="font-size: 14px;">
			<li><a href="#">主页</a></li>
			<li><a href="orderShow">订单查询</a></li>
			<li class="active">订单添加</li>
		</ol>
	</div>
	<!-- 添加数据的表格 -->
	
	<div stlye="padding:20px;">
		<form role="form" action="ordersadd" method="post">
			<table width="100%" border="0" align="center">
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">订单编号</span> <input type="text"
									class="form-control" readonly style="width: 430px;" >
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
									style="width: 430px;" name="odr_customer">
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">下单日期</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 430px;" name="odr_date" id="odr_date">
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
									style="width: 430px;" name="odr_cost" >
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">订单类型</span>
								<select class="form-control"  style="width:200px;" name="odr_type">
									<option value="">全部</option>
									<option value="销售订单">销售订单</option>
									<option value="采购订单">采购订单</option>
									<option value="生产订单">生产订单</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<div style="text-align: right; padding-right: 20px;">
				<input type="submit" class="btn btn-primary" style="width: 80px;" value="保存"/>
				<button type="button" class="btn btn-primary" style="width: 80px;"
					onclick="history.back()">返回</button>
			</div>
			</form>
	</div>
</body>
</html>

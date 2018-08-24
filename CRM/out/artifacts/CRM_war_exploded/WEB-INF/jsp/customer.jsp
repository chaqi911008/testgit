<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CRM</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/delete.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
<script src="js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="js/jDialog/jDialog.css" type="text/css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jDialog.js"></script>
</head>

<body>
	<!-- 导航 -->
	<div>
		<ol class="breadcrumb" style="font-size: 14px;">
			<li><a href="#">主页</a></li>
			<li class="active">客户信息管理</li>
		</ol>
	</div>
	<!-- 动态查询条件 -->
	<div style="padding: 0px 20px 0px 0px;">
		<form action="customer" method="post">
			<table>
				<tr>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">客户名称</span>
								<input type="text" class="form-control" style="width: 180px;"
								value="${cust_name}"	name="cust_name">
							</div>
						</div>
					</td>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">客户等级</span>
								<select class="form-control" style="width: 180px;"
									name="cust_level">
									<option value="" ${cust_level==""?"selected":""}>全部</option>
									<option value="1" ${cust_level=="1"?"selected":""}>普通用户</option>
									<option value="2" ${cust_level=="2"?"selected":""}>长期用户</option>
									<option value="3" ${cust_level=="3"?"selected":""}>VIP用户</option>
									<option value="4" ${cust_level=="4"?"selected":""}>高VIP用户</option>
									<option value="5" ${cust_level=="5"?"selected":""}>超级VIP用户</option>
								</select>
							</div>
						</div>
					</td>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">客户状态</span>
								<select class="form-control" style="width: 180px;"
									name="cust_status">
									<option value="" ${cust_status==""?"selected":""}>全部</option>
									<option value="正常" ${cust_status=="正常"?"selected":""}>正常</option>
									<option value="流失" ${cust_status=="流失"?"selected":""}>流失</option>
									<option value="删除" ${cust_status=="删除"?"selected":""}>删除</option>
								</select>
							</div>
						</div>
					</td>
					<td align="left" width="15%">
						<input type="submit" class="btn btn-info" style="width: 80px;" value="查询"/>
					</td>
					<td>
						<div class="filter-block pull-right" style="margin-left: 10px;">
							<a href="customerCreate" class="btn btn-primary pull-right">
								<i class="fa fa-plus-circle fa-lg"></i> 添加客户
							</a>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 展示表格数据 -->
	<div style="padding: 10px 20px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th><span>编号</span></th>
					<th><span>客户名称</span></th>
					<th><span>地区</span></th>
					<th class="text-center"><span>客户等级</span></th>
					<th class="text-center"><span>满意度</span></th>
					<th class="text-center"><span>地址</span></th>
					<th class="text-center"><span>开户银行</span></th>
					<th class="text-center"><span>客户状态</span></th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cst_customerPage.list }" var="c">
					<tr>
						<td>${c.cust_no }</td>
						<td>${c.cust_name }</td>
						<td>${c.cust_region }</td>
						<td class="text-center">${c.cust_level_label }</td>
						<td class="text-center">${c.cust_satisfy }</td>
						<td class="text-center">${c.cust_addr }</td>
						<td class="text-center">${c.cust_bank }</td>
						<td class="text-center">${c.cust_status }</td>
						<td style="width: 15%;">
						<p style="float: left;"><a
							href="customerAssign?cust_no=${c.cust_no }" class="table-link" title="查看">
								<span class="fa-stack"> <i
									class="fa fa-square fa-stack-2x"></i> <i
									class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
							</span>
						</a> </p>
						<p style="float: left;"><a href="customerUp?cust_no=${c.cust_no }" class="table-link" title="修改">
						<span class="fa-stack">
									<i class="fa fa-square fa-stack-2x"></i> <i
									class="fa fa-pencil fa-stack-1x fa-inverse"></i>
							</span>
						</a></p>
						<p style="float: left;">
							<a href="javaScript:void (0)" onclick="upStatus(${c.cust_no })"
							   class="table-link danger"> <span class="fa-stack"> <i
									class="fa fa-square fa-stack-2x"></i> <i
									class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
							</span>
							</a>
						</p>
						</td>
					</tr>
				</c:forEach>
				<script type="text/javascript">

                    //删除前的提示
                    function upStatus(id){
                        var dialog = jDialog.confirm('确定要修改状态吗？',{
                            handler : function(button,dialog) {
                                window.location.href="upCustomerStatus?cust_no="+id;
                                dialog.close();
                            }
                        },{
                            handler : function(button,dialog) {
                                dialog.close();
                            }
                        });
                    }
				</script>
			</tbody>
		</table>

		<ul class="pager">
			<li>
				<c:if test="${cst_customerPage.pageNow==1}">
					<a href="javaScript:void(0)" style="color: #999">首页</a>
				</c:if>
				<c:if test="${cst_customerPage.pageNow!=1}">
					<a href="customer?pageNow=1&cust_name=${cust_name}&cust_level=${cust_level}&cust_status=${cust_status}">首页</a>
				</c:if>

			</li>
			<li>
				<c:if test="${cst_customerPage.pageNow>1}">
					<a href="customer?pageNow=${cst_customerPage.pageNow-1}&cust_name=${cust_name}&cust_level=${cust_level}&cust_status=${cust_status}">上一页</a>
				</c:if>
				<c:if test="${cst_customerPage.pageNow<=1 }">
					<a href="javaScript:void(0)" style="color: #999">上一页</a>
				</c:if>
			</li>
			<li><span>当前第${cst_customerPage.pageNow}/共${cst_customerPage.pageCount}页</span></li>
			<li>
				<c:if test="${cst_customerPage.pageNow<cst_customerPage.pageCount}">
					<a href="customer?pageNow=${cst_customerPage.pageNow+1}&cust_name=${cust_name}&cust_level=${cust_level}&cust_status=${cust_status}">下一页</a>
				</c:if>
				<c:if test="${cst_customerPage.pageNow>=cst_customerPage.pageCount }">
					<a href="javaScript:void(0)" style="color: #999">下一页</a>
				</c:if>
			</li>
			<li>
				<c:if test="${cst_customerPage.pageNow==cst_customerPage.pageCount || cst_customerPage.pageCount==0}">
					<a href="javaScript:void(0)" style="color: #999">尾页</a>
				</c:if>
				<c:if test="${cst_customerPage.pageNow!=cst_customerPage.pageCount && cst_customerPage.pageCount!=0}">
					<a href="customer?pageNow=${cst_customerPage.pageCount}&cust_name=${cust_name}&cust_level=${cust_level}&cust_status=${cust_status}">尾页</a>
				</c:if>
			</li>
		</ul>
	</div>
</body>
</html>
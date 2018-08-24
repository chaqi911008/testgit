<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="js/jDialog/jDialog.css" type="text/css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jDialog.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
</head>

<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size: 14px;">
        <li><a href="#">主页</a></li>
        <li class="active">客户流失管理</li>
    </ol>
</div>
<!-- 动态查询条件 -->
<div style="padding: 0px 20px 0px 0px;">
    <form action="custLost" method="post">
        <table>
            <tr>
                <td>
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon" style="width: 100px;">客户名称</span>
                            <input type="text" class="form-control" style="width: 180px;"
                               value="${lst_cust_name}" name="lst_cust_name">
                        </div>
                    </div>
                </td>

                <td>
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon" style="width: 100px;">客户状态</span>
                            <select class="form-control" style="width: 180px;"
                                     name="lst_status">
                                <option value="" ${lst_status==""?"selected":""}>全部</option>
                                <option value="警告" ${lst_status=="警告"?"selected":""}>警告</option>
                                <option value="暂缓流失" ${lst_status=="暂缓流失"?"selected":""}>暂缓流失</option>
                                <option value="已经流失" ${lst_status=="已经流失"?"selected":""}>已经流失</option>
                            </select>
                        </div>
                    </div>
                </td>
                <td align="left" width="15%">
                    <button type="submit" class="btn btn-info" style="width: 80px;">查询</button>
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
            <th class="text-center"><span>最后下单时间</span></th>
            <th class="text-center"><span>确认流失时间</span></th>
            <th class="text-center"><span>状态</span></th>
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cst_lostPage.list }" var="c">
            <tr>
                <td>${c.lst_id }</td>
                <td>${c.lst_cust_name }</td>
                <td class="text-center"><fm:formatDate value="${c.lst_last_order_date }" pattern="yyyy-MM-dd"/> </td>
                <td class="text-center"><fm:formatDate value="${c.lst_lost_date }" pattern="yyyy-MM-dd"/> </td>
                <td class="text-center">${c.lst_status }</td>
                <td style="width: 15%;">
                    <p style="float: left;"><a
                            href="customerAssign?lst_id=${c.lst_id }" class="table-link" title="查看">
								<span class="fa-stack"> <i
                                        class="fa fa-square fa-stack-2x"></i> <i
                                        class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
							</span>
                    </a> </p>
                    <p style="float: left;"><a href="#" class="table-link" title="修改">
						<span class="fa-stack">
									<i class="fa fa-square fa-stack-2x"></i> <i
                                class="fa fa-pencil fa-stack-1x fa-inverse"></i>
							</span>
                    </a></p>
                    <p style="float: left;">
                        <a href="#" onclick="del(${c.lst_id })"
                           class="table-link danger" title="删除"> <span class="fa-stack"> <i
                                class="fa fa-square fa-stack-2x"></i> <i
                                class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
							</span>
                            <script type="text/javascript">

                                //删除前的提示
                                function del(id){
                                    var dialog = jDialog.confirm('确定要修改状态吗？',{
                                        handler : function(button,dialog) {
                                            window.location.href="delLost?lst_id="+id;
                                            dialog.close();
                                        }
                                    },{
                                        handler : function(button,dialog) {
                                            dialog.close();
                                        }
                                    });
                                }

                            </script>
                        </a>
                    </p>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <li>
            <c:if test="${cst_lostPage.pageNow==1}">
                <a href="javaScript:void(0)" style="color: #999">首页</a>
            </c:if>
            <c:if test="${cst_lostPage.pageNow!=1}">
                <a href="custLost?pageNow=1&lst_cust_name=${lst_cust_name}&lst_status=${lst_status}">首页</a>
            </c:if>

        </li>
        <li>
            <c:if test="${cst_lostPage.pageNow>1}">
                <a href="custLost?pageNow=${cst_lostPage.pageNow-1}&lst_cust_name=${lst_cust_name}&lst_status=${lst_status}">上一页</a>
            </c:if>
            <c:if test="${cst_lostPage.pageNow<=1 }">
                <a href="javaScript:void(0)" style="color: #999">上一页</a>
            </c:if>
        </li>
        <li><span>当前第${cst_lostPage.pageNow}/共${cst_lostPage.pageCount}页</span></li>
        <li>
            <c:if test="${cst_lostPage.pageNow<cst_lostPage.pageCount}">
                <a href="custLost?pageNow=${cst_lostPage.pageNow+1}&lst_cust_name=${lst_cust_name}&lst_status=${lst_status}">下一页</a>
            </c:if>
            <c:if test="${cst_lostPage.pageNow>=cst_lostPage.pageCount }">
                <a href="javaScript:void(0)" style="color: #999">下一页</a>
            </c:if>
        </li>
        <li>
            <c:if test="${cst_lostPage.pageNow==cst_lostPage.pageCount || cst_lostPage.pageCount==0}">
                <a href="javaScript:void(0)" style="color: #999">尾页</a>
            </c:if>
            <c:if test="${cst_lostPage.pageNow!=cst_lostPage.pageCount && cst_lostPage.pageCount!=0}">
                <a href="custLost?pageNow=${cst_lostPage.pageCount}&lst_cust_name=${lst_cust_name}&lst_status=${lst_status}">尾页</a>
            </c:if>
        </li>
    </ul>
</div>
</body>
</html>
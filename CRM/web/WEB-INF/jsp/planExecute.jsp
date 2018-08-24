<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-20
  Time: 11:17
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
    <style>
        #developinfo td{ font-size:14px;}
        #planinfo th{ font-size:14px;}
        #planinfo td{ font-size:14px;}
    </style>
    <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="js/jDialog/jDialog.css" type="text/css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jDialog.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".insert").click(function() {
                var c=$(this).parent().prev().val();
                var b=$(this).parents("tr").find(".planid").val();
                $.ajax({
                    url:"updatePlanResult",
                    type:"post",
                    data:{"pla_id":b,"pla_result":c},
                    dataType:"json",
                    success:function (data) {
                        
                    }
                })
            });

        });
    </script>
</head>

<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li><a href="#">客户开发计划</a></li>
        <li class="active">查看</li>
    </ol>
</div>
<!-- 数据表格展示 -->
<div style="padding:0px 20px;">
    <table width="100%" border="0" class="table table-bordered" id="developinfo">
        <tr>
            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${salChanceById.chc_id}</td>
            <td width="20%" height="40" align="center" class="active">机会来源</td>
            <td width="30%" height="40">${salChanceById.chc_source}</td>
        </tr>
        <input type="hidden" name="chc_id" value="${salChanceById.chc_id}" id="chc_id" />
        <tr>
            <td height="40" align="center" class="active">客户名称</td>
            <td height="40">${salChanceById.chc_cust_name}</td>
            <td height="40" align="center" class="active">成功几率</td>
            <td height="40">${salChanceById.chc_rate}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">概要</td>
            <td height="40">${salChanceById.chc_title}</td>
            <td height="40" align="center" class="active">状态</td>
            <c:if test="${salChanceById.chc_status==0}">
            <td height="40">未开发</td>
        </c:if>
            <c:if test="${salChanceById.chc_status==1}">
                <td height="40">开发中</td>
            </c:if>
            <c:if test="${salChanceById.chc_status==2}">
                <td height="40">已归档</td>
            </c:if>
            <c:if test="${salChanceById.chc_status==3}">
                <td height="40">开发失败</td>
            </c:if>
        </tr>
        <tr>
            <td height="40" align="center" class="active">联系人</td>
            <td height="40">${salChanceById.chc_linkman}</td>
            <td height="40" align="center" class="active">联系人电话</td>
            <td height="40">${salChanceById.chc_tel}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">机会描述</td>
            <td height="40" colspan="3">${salChanceById.chc_desc}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">创建人</td>
            <td height="40">${salChanceById.chc_create_by}</td>
            <td height="40" align="center" class="active">创建时间</td>
            <td height="40"><fm:formatDate value="${salChanceById.chc_create_date}" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">指派给</td>
            <td height="40">${salChanceById.chc_due_to}</td>
            <td height="40" align="center" class="active">指派时间</td>
            <td height="40"><fm:formatDate value="${salChanceById.chc_due_date}" pattern="yyyy-MM-dd"/></td>
        </tr>
    </table>
    <div style="padding:5px;"></div>
    <!-- 计划执行效果展示 -->
    <table class="table table-hover" id="planinfo">
        <thead>
        <tr>
            <th width="20%" class="text-center">日期</th>
            <th width="50%" class="text-center">计划</th>
            <th width="30%" class="text-center">执行效果</th>
        </tr>
        </thead>
        <tbody id="planlist">
        <c:forEach items="${salPlanList}" var="p">
        <tr>
            <input type="hidden" value="${p.pla_id}" class="planid"/>
            <td align="center"><fm:formatDate value="${p.pla_date}" pattern="yyyy-MM-dd"/> </td>
            <td align="center" class="plancontent">${p.pla_todo}</td>
            <td align="center">
                <div class="input-group">
                    <input type="text" name="pla_result" id="pla_result" value="${p.pla_result}" class="form-control">
                    <span class="input-group-btn">
                        <button class="btn btn-primary insert" id="insert" type="button">保存</button>
                      </span>
                </div>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="text-align:right; padding-right:20px;">
        <button type="button" class="btn btn-primary" style="width:120px;" onclick="tiaoZhuan()">制定计划</button>
        <button type="button" class="btn btn-primary" style="width:120px;" onclick="upStatus()">终止开发</button>
        <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
    </div>
    <script type="text/javascript">
        function tiaoZhuan(id){
            var id=$("#chc_id").val();
            window.location.href="planFormulate?id="+id;
        }
        
        function upStatus() {
            var id=$("#chc_id").val();
            $.ajax({
                url:"upStatus",
                type:"post",
                data:{"chc_id":id},
                dataType:"json",
                success:function (data) {
                    if(data==true){
                        window.location.href="plan";
                    }
                }
            })
        }
    </script>
</div>
</body>
<script src="../../js/laydate.dev.js"></script>
<script>
    laydate({
        elem: '#date'
    });
</script>
</html>


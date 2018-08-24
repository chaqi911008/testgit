<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-19
  Time: 11:25
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
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".update").click(function() {
                if($(this).html() == "修改"){
                    var content = $(this).parents("tr").find(".plancontent").html();
                    $(this).parents("tr").find(".plancontent")
                        .html("<input type='text' value="+content+" class='updatecontent form-control'/>");
                    $(this).html("保存");
                }else if($(this).html() == "保存") {
                    /* 获得pid和要修改的内容,使用ajax修改*/
                    var pid = $(this).parents("tr").find(".planid").val();
                    var content = $(this).parents("tr").find(".updatecontent").val();
                    if (pid != null && pid != "") {		//有id编号表示是修改计划项
                        $.post(
                            "updatePlan",
                            {"pla_id": pid, "pla_todo": content},
                            function (data) {
                            },
                            "json"
                        )
                        $(this).parents("tr").find(".plancontent").html(content);
                        $(this).html("修改");
                    }
                }
            });
            $(".delete").click(function() {
                var pid = $(this).parents("tr").find(".planid").val();
                if(pid != ""){ // 不等于 "" 时传入id用ajax进行删除
                    $.ajax({
                        url:"delPlan",
                        type:"post",
                        data:{"pla_id":pid},
                        dataType:"json",
                        success:function (data) {
                            if(data=="true"){

                            }
                        }
                    })
                    $(this).parents("tr").remove();
                }
            });

            $(".delete").click(function () {
                var dialog = jDialog.message('删除成功！',{
                    autoClose : 3000,    // 3s后自动关闭
                    padding : '30px',    // 设置内部padding
                    modal: true         // 非模态，即不显示遮罩层
                });
            })
        });
    </script>

    <script type="text/javascript">
        $(function(){
            //日历
            $("#date").click(function(){
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
        <li><a href="#">客户开发计划</a></li>
        <li class="active">制定计划</li>
    </ol>
</div>
<!-- 数据表格展示 -->
<div style="padding:0px 20px;">
    <table width="100%" border="0" class="table table-bordered" id="developinfo">
        <tr>

            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${salChance.chc_id}</td>
            <td width="20%" height="40" align="center" class="active">机会来源</td>
            <td width="30%" height="40">${salChance.chc_source}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">客户名称</td>
            <td height="40">${salChance.chc_cust_name}</td>
            <td height="40" align="center" class="active">成功几率</td>
            <td height="40">${salChance.chc_rate}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">概要</td>
            <td height="40">${salChance.chc_title}</td>
            <td height="40" align="center" class="active">状态</td>
            <td height="40">${salChance.chc_status}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">联系人</td>
            <td height="40">${salChance.chc_linkman}</td>
            <td height="40" align="center" class="active">联系人电话</td>
            <td height="40">${salChance.chc_tel}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">机会描述</td>
            <td height="40" colspan="3">${salChance.chc_desc}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">创建人</td>
            <td height="40">${salChance.chc_create_by}</td>
            <td height="40" align="center" class="active">创建时间</td>
            <td height="40"><fm:formatDate value="${salChance.chc_create_date}" pattern="yyyy-MM-dd"/> </td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">指派给</td>
            <td height="40">${salChance.chc_due_to}</td>
            <td height="40" align="center" class="active">指派时间</td>
            <td height="40"><fm:formatDate value="${salChance.chc_due_date}" pattern="yyyy-MM-dd"/> </td>
        </tr>
    </table>
    <div style="padding:5px;"></div>
    <!-- 计划执行效果展示 -->
    <table class="table table-hover" id="planinfo">
        <thead>
        <tr>
            <th width="20%" class="text-center">日期</th>
            <th width="50%" class="text-center">计划项</th>
            <th width="30%" class="text-center">&nbsp;</th>
        </tr>
        </thead>
        <tbody id="planlist">
        <c:forEach items="${salPlanList}" var="p">
        <tr>
            <input type="hidden" name="pla_id" value="${p.pla_id}" class="planid"/>
            <td align="center"><fm:formatDate value="${p.pla_date}" pattern="yyyy-MM-dd"/> </td>
            <td align="center" class="plancontent">${p.pla_todo}</td>
            <td align="center">
                <button type="button" class="btn btn-primary update" style="width:80px;">修改</button>
                <button type="button" class="btn btn-primary delete" style="width:80px;">删除</button>
            </td>
        </tr>
        </c:forEach>
        <form action="addPlan" method="post">
        <tr>
            <input type="hidden" name="chc_id" id="chc_id" value="${salChance.chc_id}">
            <input type="hidden" value="" class="planid"/>
            <td align="center"><input type="text" name="pla_date" class="form-control" id="date" placeholder="请输入日期"/></td>
            <td align="center" class="plancontent"><input type="text" name="pla_todo" class="form-control" placeholder="请输入计划项"/></td>
            <td align="center">
                <input type="submit" class="btn btn-primary update" style="width:80px;" value="保存"/>
            </td>
        </tr>
        </form>
        </tbody>
    </table>
    <div style="text-align:right; padding-right:20px;">
        <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
    </div>
</div>
</body>
<script src="../../js/laydate.dev.js"></script>
<script>
</script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-17
  Time: 8:57
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
    <script src="./CRM登录页面_files/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="js/jDialog/jDialog.css" type="text/css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jDialog.js"></script>
</head>
<script type="text/javascript">
    $(function(){
        //日历
        $("#startTime").click(function(){
            WdatePicker({
                highLineWeekDay:true //周末高亮
                ,readOnly:true      //只读，只可用控件input中 修改内容
                ,dateFmt:'yyyy-MM-dd'
            });
        });

        $("#endTime").click(function(){
            WdatePicker({
                highLineWeekDay:true //周末高亮
                ,readOnly:true      //只读，只可用控件input中 修改内容
                ,dateFmt:'yyyy-MM-dd'
            });
        });
    });
</script>
<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li><a href="#">客户服务管理</a></li>
        <li class="active">服务分配</li>
    </ol>
</div>
<!-- 动态查询条件 -->
<div style="padding:0px 20px 0px 0px;">
    <form action="serviceAssign" method="post">
    <table>
        <tr>
            <td height="60">
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">客户名称</span>
                        <input type="text" value="${svr_cust_name}" name="svr_cust_name" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">概要</span>
                        <input type="text" value="${svr_title}" name="svr_title" class="form-control" style="width:180px;">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">服务类型</span>
                        <select class="form-control" name="svr_type" style="width:180px;">
                            <option value="" ${svr_type==""?"selected":""}>全部</option>
                            <option value="咨询" ${svr_type=="咨询"?"selected":""}>咨询</option>
                            <option value="投诉" ${svr_type=="投诉"?"selected":""}>投诉</option>
                            <option value="建议" ${svr_type=="建议"?"selected":""}>建议</option>
                        </select>
                    </div>
                </div>
            </td>
            <td align="left" width="15%">&nbsp;

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">创建日期</span>
                        <input type="text" name="svr_create_date" value="${svr_create_date}" class="form-control" style="width:180px;" id="startTime">
                        <span class="input-group-addon">到</span>
                        <input type="text" name="svr_create_date1" value="${svr_create_date1}" class="form-control" style="width:180px;" id="endTime">
                    </div>
                </div>
            </td>
            <td>
                <div class="col-lg-3">
                    <div class="input-group">
                        <span class="input-group-addon" style="width:100px;">状态</span>
                        <input value="新创建" name="svr_result" class="form-control" style="width:180px;" readonly/>
                    </div>
                </div>
            </td>
            <td align="left" width="15%">
                <input type="submit" class="btn btn-info" style="width:80px;" value="查询"/>
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
            <th><span>概要</span></th>
            <th class="text-center"><span>服务类型</span></th>
            <th class="text-center"><span>创建人</span></th>
            <th class="text-center"><span>创建日期</span></th>
            <th class="text-center"><span>分配给</span></th>
            <th class="text-center"><span>操作</span></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sct_servicePage.list}" var="sct">
        <tr>
            <td>${sct.svr_id}</td>
            <td>${sct.svr_cust_name}</td>
            <td>${sct.svr_title}</td>
            <td class="text-center">${sct.svr_type}</td>
            <td class="text-center">${sct.svr_create_by}</td>
            <td class="text-center"><fm:formatDate value="${sct.svr_create_date}" pattern="yyyy-MM-dd"/> </td>
            <td width="15%">
                <div class="input-group">
                    <select class="form-control" name="svr_due_id" id="${sct.svr_id}">
                        <script type="text/javascript">
                            //即时查询用户信息并填充到下拉列表
                            $(function () {
                                $.ajax({
                                    url:"selUserName",
                                    type:"post",
                                    dataType:null,
                                    data:"json",
                                    success:function (data) {
                                        /*$("#svr_due_id").clear();*/
                                        for (var i=0;i<data.length;i++){
                                            var op=data[i];
                                            var $s="<option value='"+op.user_id+"'>"+op.user_name+"</option>";
                                            $("#${sct.svr_id}").append($s);
                                        }
                                    }
                                })
                            })
                        </script>
                    </select>
                    <span class="input-group-btn">
                            <button class="btn btn-primary" type="button" onclick="update(${sct.svr_id},this)">分配</button>
                          </span>
                </div>
                <script type="text/javascript">
                    function update(id,obj) {
                        var svr_due_id=$(obj).parent().prev("select").val();
                       $.ajax({
                           url:"update",
                           type:"post",
                           data:{"svr_id":id,"svr_due_id":svr_due_id},
                           dataType:"json",
                           success:function (data) {
                               if(data==true){
                                   window.location.href="serviceAssign";
                               }
                           }
                       })
                    }
                </script>
            </td>
            <input type="hidden" value="${sct.svr_id}" name="svr_id">
            <td class="text-center">
                <a onclick="del(${sct.svr_id})"  class="table-link danger" title="删除">
                    <script type="text/javascript">
                        function del(id){
                            var dialog = jDialog.confirm('确定要删除吗？',{
                                handler : function(button,dialog) {
                                    window.location.href="delSct?svr_id="+id;
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
            <c:if test="${sct_servicePage.pageNow==1}" var="s">
                <a href="javaScript:void(0)" style="color: #999">首页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow!=1}">
                <a href="serviceAssign?pageNow=1&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">首页</a>
            </c:if>

        </li>
        <li>
            <c:if test="${sct_servicePage.pageNow>1}">
                <a href="serviceAssign?pageNow=${sct_servicePage.pageNow-1}&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">上一页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow<=1 }">
                <a href="javaScript:void(0)" style="color: #999">上一页</a>
            </c:if>
        </li>
        <li><span>当前第${sct_servicePage.pageNow}/共${sct_servicePage.pageCount}页</span></li>
        <li>
            <c:if test="${sct_servicePage.pageNow<sct_servicePage.pageCount}">
                <a href="serviceAssign?pageNow=${sct_servicePage.pageNow+1}&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">下一页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow>=sct_servicePage.pageCount }">
                <a href="javaScript:void(0)" style="color: #999">下一页</a>
            </c:if>
        </li>
        <li>
            <c:if test="${sct_servicePage.pageNow==sct_servicePage.pageCount || sct_servicePage.pageCount==0}">
                <a href="javaScript:void(0)" style="color: #999">尾页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow!=sct_servicePage.pageCount && sct_servicePage.pageCount!=0}">
                <a href="serviceAssign?pageNow=${sct_servicePage.pageCount}&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">尾页</a>
            </c:if>
        </li>
    </ul>




    <%--<ul class="pager">
        <li>
            <c:if test="${sct_servicePage.pageNow==1}" var="s">
                <a href="javaScript:void(0)" style="color: #999">首页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow!=1}">
                <a href="serviceAssign?pageNow=1&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">首页</a>
            </c:if>

        </li>
        <li>
            <c:if test="${sct_servicePage.pageNow>1}">
                <a href="serviceAssign?pageNow=1&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">上一页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow<=1 }">
                <a href="javaScript:void(0)" style="color: #999">上一页</a>
            </c:if>
        </li>
        <li><span>当前第${sct_servicePage.pageNow}/共${sct_servicePage.pageCount}页</span></li>
        <li>
            <c:if test="${sct_servicePage.pageNow<sct_servicePage.pageCount}">
                <a href="serviceAssign?pageNow=1&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">下一页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow>=sct_servicePage.pageCount }">
                <a href="javaScript:void(0)" style="color: #999">下一页</a>
            </c:if>
        </li>
        <li>
            <c:if test="${sct_servicePage.pageNow==sct_servicePage.pageCount || sct_servicePage.pageCount==0}">
                <a href="javaScript:void(0)" style="color: #999">尾页</a>
            </c:if>
            <c:if test="${sct_servicePage.pageNow!=sct_servicePage.pageCount && sct_servicePage.pageCount!=0}">
                <a href="serviceAssign?pageNow=1&svr_cust_name=${svr_cust_name}&svr_title=${svr_title}&svr_type=${svr_type}&svr_create_date=${svr_create_date}&svr_create_date1=${svr_create_date1}&svr_result=${svr_result}">尾页</a>
            </c:if>
        </li>
    </ul>--%>
</div>
</body>
<script src="../../js/laydate.dev.js"></script>
</html>


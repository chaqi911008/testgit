<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-17
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="../../css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="../../css/mystyle.css" />
    <script src="./CRM登录页面_files/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
</head>
<script type="text/javascript">
    $(function(){
        //日历
        $("#createTime").click(function(){
            WdatePicker({
                highLineWeekDay:true //周末高亮
                ,readOnly:true      //只读，只可用控件input中 修改内容
                ,dateFmt:'yyyy-MM-dd'
            });
        });

        $("#assignTime").click(function(){
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
        <li><a href="#">客户管理</a></li>
        <li class="active">客户创建</li>
    </ol>
</div>
<!-- 添加数据的表格 -->
<div stlye="padding:20px;">
    <form role="form" action="toCustomerCreate" method="post">
        <table width="100%" border="0" align="center">
            <tr>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">服务编号</span>
                            <input type="text" class="form-control" readonly style="width:430px;">
                        </div>
                    </div>
                </td>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">客户等级</span>
                            <select class="form-control" name="cust_level" id="cust_level" style="width:430px;">
                                <option value="" >全部</option>
                                <option value="1" >普通用户</option>
                                <option value="2" >长期用户</option>
                                <option value="3" >VIP用户</option>
                                <option value="4" >高VIP用户</option>
                                <option value="5" >超级VIP用户</option>
                            </select>
                            <input type="hidden" name="cust_level_label" id="cust_level_label">
                            <script type="text/javascript">
                                $(function(){
                                    $("#cust_level").change(function(){
                                        $("#cust_level_label").val($("#cust_level option:checked").text());
                                    })
                                })
                            </script>

                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">客户名称</span>
                            <input type="text" name="cust_name" placeholder="必填项" class="form-control" required style="width:430px;">
                        </div>
                    </div>
                </td>

                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">地区</span>
                            <input type="text" name="cust_region" placeholder="必填项" class="form-control" required style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">客户经理</span>
                            <select name="cust_manager_id" id="cust_mamager_id" class="form-control" style="width:430px;">
                                <script type="text/javascript">
                                    $(function(){
                                        $.ajax({
                                            url:"selectUserName",
                                            type:"post",
                                            data:null,
                                            dataType:"json",
                                            success:function (data) {
                                                for (var i=0;i<data.length;i++){
                                                    var op=data[i];
                                                    var $s="<option value='"+op.user_id+"' >"+op.user_name+"</option>";
                                                    $("#cust_mamager_id").append($s);
                                                }
                                            }
                                        })
                                    })
                                </script>
                            </select>
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">地址</span>
                            <input type="text" name="cust_addr" class="form-control"  style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">邮政编码</span>
                            <input type="text" name="cust_zip" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">法人</span>
                            <input type="text" name="cust_chieftain" class="form-control"  style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">满意度&nbsp;</span>
                            <input type="text" name="cust_satisfy" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">信用度</span>
                            <input type="text" name="cust_credit" class="form-control" placeholder="必填项" required style="width:430px;" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">电话&nbsp;</span>
                            <input type="text" name="cust_tel" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">传真</span>
                            <input type="text" name="cust_fax" class="form-control" placeholder="必填项" required style="width:430px;" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">网址&nbsp;</span>
                            <input type="text" name="cust_website" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">营业执照注册号</span>
                            <input type="text" name="cust_licence_no" class="form-control" placeholder="必填项" required style="width:430px;" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">注册资金&nbsp;</span>
                            <input type="text" name="cust_bankroll" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">年营业额</span>
                            <input type="text" name="cust_turnover" class="form-control" placeholder="必填项" required style="width:430px;" />
                        </div>
                    </div>
                </td>
            </tr>

            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">开户银行&nbsp;</span>
                            <input type="text" name="cust_bank" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">银行账号</span>
                            <input type="text" name="cust_bank_account" class="form-control" placeholder="必填项" required style="width:430px;" />
                        </div>
                    </div>
                </td>
            </tr>

            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">地税登录号&nbsp;</span>
                            <input type="text" name="cust_local_tax_no" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">国税登录号</span>
                            <input type="text" name="cust_national_tax_no" class="form-control" placeholder="必填项" required style="width:430px;" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div style="text-align:right; padding-right:20px;">
            <input type="submit" class="btn btn-primary" style="width:80px;" value="保存"/>
            <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>
    </form>
</div>
</body>
<script src="../../js/laydate.dev.js"></script>

</html>

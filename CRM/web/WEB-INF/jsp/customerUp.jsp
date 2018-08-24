<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018-05-26
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改客户</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
    <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
</head>

<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li><a href="customer">客户信息管理</a></li>
        <li class="active">修改客户</li>
    </ol>
</div>
<!-- 添加数据的表格 -->
<div stlye="padding:20px;">
    <form role="form" method="post" action="toUpCustomer">
        <input type="hidden" value="${cst_customer.cust_no}" name="cust_no"/>
        <table width="100%" border="0" align="center">
            <tr>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">客户名称</span>
                            <input type="text" name="cust_name" value="${cst_customer.cust_name}" class="form-control"  style="width:430px;">
                        </div>
                    </div>
                </td>
                <td width="50%" height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">地区</span>
                            <input type="text" name="cust_region" value="${cst_customer.cust_region}" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <input type="hidden" name="cust_level_label" value="${cst_customer.cust_level_label}">
                        <div class="input-group">
                            <span class="input-group-addon">客户等级</span>
                            <select name="cust_level" id="cust_level" style="width:430px;"  class="form-control">
                                <option value="" ${cst_customer.cust_level==""?"selected":""}>全部</option>
                                <option value="1" ${cst_customer.cust_level=="1"?"selected":""}>普通用户</option>
                                <option value="2" ${cst_customer.cust_level=="2"?"selected":""}>长期用户</option>
                                <option value="3" ${cst_customer.cust_level=="3"?"selected":""}>VIP用户</option>
                                <option value="4" ${cst_customer.cust_level=="4"?"selected":""}>高级VIP</option>
                                <option value="5" ${cst_customer.cust_level=="5"?"selected":""}>超级VIP</option>
                            </select>
                           <%-- <input type="hidden" name="cust_level_label" id="cust_level_label">
                            <script type="text/javascript">
                                $(function(){
                                    $("#cust_level").change(function(){
                                        $("#cust_level_label").val($("#cust_level option:checked").text());
                                        alert($("#cust_level_label").val());
                                    })
                                })
                            </script>--%>

                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">满意度</span>
                            <input type="text" name="cust_satisfy" value="${cst_customer.cust_satisfy}" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="left" colspan="2">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">信用度</span>
                            <input type="text" name="cust_credit" value="${cst_customer.cust_credit}" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">地址&nbsp;</span>
                            <input type="text" name="cust_addr" value="${cst_customer.cust_addr}" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">邮政编码</span>
                            <input type="text" name="cust_zip" value="${cst_customer.cust_zip}" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="left" colspan="2">
                    <div class="col-lg-3">
                        <div class="input-group" >
                            <span class="input-group-addon">电话</span>
                            <input type="text" name="cust_tel" value="${cst_customer.cust_tel}" class="form-control" style="width:430px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">传真&nbsp;</span>
                            <input type="text" name="cust_fax" value="${cst_customer.cust_fax}" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">网址</span>
                            <input type="text" name="cust_website" value="${cst_customer.cust_website}" class="form-control" required style="width:430px;"  />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">营业执照注册号&nbsp;</span>
                            <input type="text" name="cust_licence_no" value="${cst_customer.cust_licence_no}" class="form-control" placeholder="必填项" required style="width:430px;">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">法人</span>
                            <input type="text" name="cust_chieftain" value="${cst_customer.cust_chieftain}" class="form-control" required style="width:430px;"  />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">注册资金&nbsp;</span>
                            <input type="text" name="cust_bankroll" value="${cst_customer.cust_bankroll}" class="form-control"  style="width:430px;" readonly="readonly">
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">年营业额</span>
                            <input type="text" name="cust_turnover" value="${cst_customer.cust_turnover}" class="form-control" required style="width:430px;" readonly="readonly" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr style="border-top: #EEE solid 2px;">
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">开户银行&nbsp;</span>
                            <input type="text" name="cust_bank" value="${cst_customer.cust_bank}" class="form-control" required style="width:430px;" readonly="readonly"/>
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">银行账号</span>
                            <input type="text" name="cust_bank_account" value="${cst_customer.cust_bank_account}" class="form-control" style="width:430px;" readonly="readonly"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">地税登记号</span>
                            <input type="text" name="cust_local_tax_no" value="${cst_customer.cust_local_tax_no}" class="form-control" style="width:430px;" readonly="readonly"/>
                        </div>
                    </div>
                </td>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">国税登记号</span>
                            <input type="text" name="cust_national_tax_no" value="${cst_customer.cust_national_tax_no}" class="form-control" style="width:430px;" readonly="readonly"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">客户状态</span>
                            <select class="form-control" name="cust_status" style="width:430px;">
                                <option value="" ${cst_customer.cust_status==""?"selected":""}>全部</option>
                                <option value="正常" ${cst_customer.cust_status=="正常"?"selected":""}>正常</option>
                                <option value="流失" ${cst_customer.cust_status=="流失"?"selected":""}>流失</option>
                                <option value="删除" ${cst_customer.cust_status=="删除"?"selected":""}>删除</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="50" align="right" colspan="2" style="padding-right:20px;">
                    <input type="submit" class="btn btn-primary" style="width:80px;" value="保存"/>&nbsp;
                    <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
                </td>
            </tr>
        </table>
        </form>
</div>
</body>
<script src="js/laydate.dev.js"></script>

</html>

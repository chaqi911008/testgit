<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/drilldown.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>

    <link rel="stylesheet" href="css/delete.css">
    <link rel="stylesheet" type="text/css"
          href="css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
    <script src="js/jquery-1.8.3.min.js"></script>
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
    <form action="lostChart" method="post">
        <table>
            <tr>
                <td>
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon" style="width: 100px;">年份</span>
                            <select class="form-control" style="width: 180px;"
                                    name="year">
                                <option value="" ${year==""?"selected":""}>全部</option>
                                <option value="2015" ${year==2015?"selected":""}>2015</option>
                                <option value="2016" ${year==2016?"selected":""}>2016</option>
                                <option value="2017" ${year==2017?"selected":""}>2017</option>
                                <option value="2018" ${year==2018?"selected":""}>2018</option>
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






<div></div>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<script>
    var chart = Highcharts.chart('container',{
        chart: {
            type: 'column'
        },
        title: {
            text: '${year-3} ~ ${year}年，客户流失分析'
        },
        subtitle: {
            text: '数据来源: 查琪'
        },
        xAxis: {
            categories: [
                '一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '流失人数 (人)'
            }
        },
        tooltip: {
            // head + 每个 point + footer 拼接成完整的 table
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f}人</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                borderWidth: 0
            }
        },
        series:${data}
    });
</script>
</body>
</html>
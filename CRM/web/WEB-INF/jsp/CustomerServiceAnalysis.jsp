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
        <script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
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
        <ol class="breadcrumb" style="font-size:14px;">
                <li><a href="#">主页</a></li>
                <li class="active">客户服务分析</li>
        </ol>
</div>
<div id="container" style="min-width:400px;height:400px"></div>
        <script>
        var chart = Highcharts.chart('container', {
            chart: {
                type: 'line'
            },
            title: {
                text: '客户服务分析'
            },
            subtitle: {
                text: '数据来源: WorldClimate.com'
            },
            xAxis: {
                categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
            },
            yAxis: {
                title: {
                    text: '服务条数 (条)'
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        // 开启数据标签
                        enabled: true          
                    },
                    // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                    enableMouseTracking: false
                }
            },
            series: ${data}
            /*
            	[{
                name: '东京',
                data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
            }, {
                name: '伦敦',
                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
            }]
            */
        });
        </script>
</body>
</html>
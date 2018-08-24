<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* css 代码  */
    </style>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts/themes/grid-light.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>

    <link rel="stylesheet" href="css/delete.css">
    <link rel="stylesheet" type="text/css"
          href="css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />

</head>
</head>
</head>
<body>

<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li class="active">客户各地区占比分析图</li>
    </ol>
</div>
	<div id="container" style="min-width:400px;height:400px"></div>
        <script>
        var chart = Highcharts.chart('container', {
            title: {
                text: '2018 客户各地区占比分析图'
            },
            tooltip: {
                headerFormat: '{series.name}<br>',
                pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,  // 可以被选择
                    cursor: 'pointer',       // 鼠标样式
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },

            series:${data},

            	/*
            	[{
                type: 'pie',
                name: '浏览器访问量占比',
                data: [
                    ['Firefox',   45.0],
                    ['IE',       26.8],
                    {
                        name: 'Chrome',
                        y: 12.8,
                        sliced: true,  // 默认突出
                        selected: true // 默认选中 
                    },
                    ['Safari',    8.5],
                    ['Opera',     6.2],
                    ['其他',   0.7]
                ]
            	*/
        });



       /*var chart = Highcharts.chart('container', {
           chart: {
               spacing : [40, 0 , 40, 0]
           },
           title: {
               floating:true,
               text: ''
           },
           tooltip: {
               pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   dataLabels: {
                       enabled: true,
                       format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                       style: {
                           color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                       }
                   },
                   point: {
                       events: {
                           mouseOver: function(e) {  // 鼠标滑过时动态更新标题
                               // 标题更新函数，API 地址：https://api.hcharts.cn/highcharts#Chart.setTitle
                               chart.setTitle({
                                   text: e.target.name+ '\t'+ e.target.y*12.5 + ' %'
                               });
                           }
                           //,
                           // click: function(e) { // 同样的可以在点击事件里处理
                           //     chart.setTitle({
                           //         text: e.point.name+ '\t'+ e.point.y + ' %'
                           //     });
                           // }
                       }
                   },
               }
           },
           series:

       }, function(c) { // 图表初始化完毕后的会掉函数
           // 环形图圆心
           var centerY = c.series[0].center[1],
               titleHeight = parseInt(c.title.styles.fontSize);
           // 动态设置标题位置
           c.setTitle({
               y:centerY + titleHeight/2
           });
       });*/
        </script>
</body>
</html>
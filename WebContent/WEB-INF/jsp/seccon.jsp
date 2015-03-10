<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>统计表格</title>
<script src="js/jquery.min.js"></script>
<script src="js/highcharts.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		console.log("hello");
		smallPicClick();
		drow1();
	});
	function smallPicClick() {
		$.ajax({
			type : "post",
			url : "test/query.action",
			data : {
				name : "<s:property value="#title"/>"
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				var json = eval(data);
				//da(json);
				fx(json);

			},
			error : function() {
				console.log("error");
			}
		});
	};
	var all = {};
	var jso = {};
	var time = [];
	var zhi = [];
	var xxx = [];
	function te() {
		var lll = [];
		lll.push("1");
		lll.push("2");
		lll.push("3");
		console.log(lll);
	};

	function fx(objson) {
		//取得所有时间。
		$.each(objson[0], function(key, value) {
			time.push(key);
			time.sort();
		});

		console.log("数组排序 : " + time.sort());
		for (var x = 0; x < time.length; x++) {
			var ty = objson[0][time[x]];
			$.each(ty, function(key, value) {
				console.log(time[x] + ":" + key + "----" + value);
				zhi = jso[key];
				if (zhi == null) {
					zhi = [];
				}
				zhi.push(parseInt(value.join()));
				jso[key] = zhi;
				zhi = null;
			});
		}
		;

		$.each(jso, function(key, value) {
			console.log(key + " === " + value);
			var values = {};
			values.name = key;
			values.data = value;
			xxx.push(values);
		});
		//把json对象转行成字符串格式
		test = JSON.stringify(xxx);
		console.log("test:" + test);
		console.log("xxx : " + xxx);

		draw();
	};

	function draw() {
		$('#container').highcharts({
			chart : {
				type : 'line'
			},
			title : {
				text : '空气质量监控统计'
			},
			xAxis : {
				categories : time
			},
			yAxis : {
				title : {
					text : '空气质量指数'
				}
			},
			series : xxx
		/**
		[ {
		name : 'PM2.5细颗粒物',
		data : [ 29, 86, 45, 61 ]
		}, {
		name : 'PM10可吸入颗粒物',
		data : [ 70, 65, 35, 62 ]
		}, {
		name : 'NO2二氧化氮',
		data : [ 25, 15, 64, 26 ]
		} ]
		 **/
		});
	};

	function go_home() {
		window.location.href = "home.action";
	}
	
	
	function drow1(){
		  var myChart = echarts.init(document.getElementById('test')); 
	      
	      var option = {
	          tooltip: {
	              show: true
	          },
	          legend: {
	              data:['销量','退货']
	          },
	          xAxis : [
	              {
	                  type : 'category',
	                  data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
	              }
	          ],
	          yAxis : [
	              {
	                  type : 'value'
	              }
	          ],
	          series : [
	              {
	                  "name":"销量",
	                  "type":"line",
	                  "data":[5, 20, 40, 10, 10, 20]
	              },
	              {
	                  "name":"退货",
	                  "type":"line",
	                  "data":[15, 12, 30, 20, 30, 5]
	              }
	          ]
	      };
	      // 为echarts对象加载数据 
	      myChart.setOption(option); 
	};
</script>
</head>

<body>
	<div style="width: 1065px; margin: 0 auto;">
		<div
			style="width: 1065px; height: 80px; border-bottom: 1px solid #630; text-align: left; line-height: 80px;">
			<div
				style="cursor: pointer; float: left; background: url(img/title.png) no-repeat left; background-size: 190px 80px; height: 80px; width: 190px; margin-left: 30px;"
				onclick="go_home()"></div>
			<div
				style="margin-left: 1000px; height: 80px; width: 100px; font-size: 12px;">
				联系我们</div>
		</div>

		<div style="height: 50px;">检测物质</div>

		<div id="container" style="width: 100%; height: 400px;"></div>
		
		<div id="test" style="width: 100%; height: 400px;"></div>

		<div
			style="height: 80px; border: 1px hidden #111; text-align: center; font-size: 12px; line-height: 80px; border-top: 1px solid #630;">
			king大数据处理，统计所有的业务数据，助您腾飞|© 2014 使用前必读 京ICP证030173号</div>
	</div>
</body>
<script src="dist/echarts-all.js"></script>
</html>
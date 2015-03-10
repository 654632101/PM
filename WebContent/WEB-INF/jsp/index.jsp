<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(path);
	System.out.println(basePath);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>首页</title>

<style>
.icont {
	float: left;
	width: 100px;
	height: 100px;
	background-size: 100px 100px;
	margin-left: 50px;
	margin-top: 10px;
	cursor: pointer;
}

#buoy {
	position:relative;
	width: 100px;
	height: 8px;
	background: #97CBFF;
	border-radius: 5px;
	left: 50px;
	-moz-transition: all 200ms ease-in-out;
    -ms-transition: all 200ms ease-in-out;
    -o-transition: all 200ms ease-in-out;
    -webkit-transition: all 200ms ease-in-out;
    transition: all 200ms ease-in-out;
}

#buoy.hover{
	-moz-transition-duration: 3000s;
    -ms-transition-duration: 3000s;
    -o-transition-duration: 3000s;
    -webkit-transition-duration: 3000s;
    transition-duration: 3000s;
}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.nicenav.js"></script>
<script type="text/javascript">
	function click1() {
		window.location.href = "top.action?name=one";
	}
	function click2() {
		window.location.href = "goto.action?title=one";
	}

	function smallPicClick() {
		$.ajax({
			type : "post",
			url : "test/query.action",
			data : {
				name : 'king'
			},
			dataType : "json",
			success : function(data) {
				alert(data);
				var json = eval(data);
				da(json);

			},
			error : function() {
				alert("error");
			}
		});
	}
	function da(objson) {
		for (var i = 0, l = objson.length; i < l; i++) {
			for ( var day in objson[i]) {
				alert(day + ":");
				var types = eval(objson[i][day]);
				$.each(objson[i][day], function(key, value) {
					alert(day + ":" + key + "----" + value);
				});
			}
		}
	};
</script>
</head>

<body>
	<div style="width: 1065px; margin: 0 auto;">
		<div
			style="width: 1065px; height: 80px; border-bottom: 1px solid #630; text-align: left; line-height: 80px;">
			<div
				style="cursor: pointer; float: left; background: url(img/title.png) no-repeat left; background-size: 190px 80px; height: 80px; width: 190px; margin-left: 30px;"></div>
			<div
				style="margin-left: 1000px; height: 80px; width: 100px; font-size: 12px;">
				联系我们</div>
		</div>

		<div style="height: 500px; border: 1px hidden #111;">
			<div style="float: left; width: 275px; height: 500px;">
				<div
					style="font-size: 40px; margin-top: 100px; margin-left: 30px; font-family: 微软雅黑;">空气质量统计</div>
				<div style="font-size: 20px; margin-top: 10px; margin-left: 30px;">监控各城市PM2.5指数，污染统计图</div>
				<div onclick="click1()"
					style="margin-top: 100px; margin-left: 30px;">
					<div
						style="background-color: #97CBFF; height: 50px; width: 150px; line-height: 50px; text-align: center; cursor: pointer; border-radius: 25px">
						<font style="color: #FFFFFF; font-family: 微软雅黑;">点击进入</font>
					</div>
				</div>
			</div>
			<div
				style="background-image: url(img/bg_1.jpg); background-repeat: no-repeat; height: 500px; margin-left: 275px;">
			</div>
		</div>

		<div class="tit" style="height: 150px;border: 1px solid #F0F0F0;">
			<div class = "kuang" style = "height:8px;">
				<div id="buoy"></div>
			</div>
			<div class="icont" style="background-image: url(img/257.png);"
				onclick="click1()"></div>
			<div class="icont" style="background-image: url(img/258.png);"
				onclick="smallPicClick()"></div>
			<div class="icont" style="background-image: url(img/259.png);" onclick="click2()"></div>

			<div class="icont" style="background-image: url(img/260.png);"></div>

			<div class="icont" style="background-image: url(img/261.png);"></div>

			<div class="icont" style="background-image: url(img/262.png);"></div>

			<div class="icont" style="background-image: url(img/263.png);"></div>

		</div>

		<div style="height: 80px; border: 1px hidden #111; text-align: center; font-size: 12px; line-height: 80px;">
			king大数据处理，统计所有的业务数据，助您腾飞|© 2014 使用前必读 京ICP证030173号</div>
	</div>

</body>
<script type="text/javascript">
$(".icont").mouseover(function(){
	var tit = $(".tit").offset();
	var xxx = $(this).offset();
	$("#buoy").css({left:xxx.left-tit.left});
});
</script>
</html>
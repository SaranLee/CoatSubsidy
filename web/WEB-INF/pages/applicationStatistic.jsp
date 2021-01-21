<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/31
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>申请总览</title>
	<!-- 告诉浏览器屏幕自适应 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
	<link rel="stylesheet"
				href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
	<!-- 主题样式 -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/dist/css/adminlte.min.css">
	<!-- 离线 Google 字体: Source Sans Pro -->
	<link href="${PATH}/static/adminlte/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700"
				rel="stylesheet">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- daterange picker -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/daterangepicker/daterangepicker.css">
	<!-- iCheck for checkboxes and radio inputs -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
	<!-- Bootstrap Color Picker -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
	<!-- Tempusdominus Bbootstrap 4 -->
	<link rel="stylesheet"
				href="${PATH}/static/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
	<!-- Select2 -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/select2/css/select2.min.css">
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
	<!-- Bootstrap4 Duallistbox -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
	<!-- 主题样式 -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/dist/css/adminlte.min.css">
	<!-- layui -->
	<link rel="stylesheet" href="${PATH}/static/layui/css/modules/layer/default/layer.css">
</head>
<body class="sidebar-mini" style="height: auto;">
<div class="wrapper">
	<jsp:include page="aside.jsp"/>

	<!-- Content Wrapper. 包含页面内容 -->
	<div class="content-wrapper" style="min-height: 1200.88px;">
		<div style="height: 10px"></div>
		<!-- 主体内容 -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-info">
									<div class="inner">
										<h3>${sta.count}</h3>

										<p>总申请数</p>
									</div>
									<div class="icon">
										<i class="ion ion-bag"></i>
									</div>
									<a href="#" class="small-box-footer">更多信息 <i class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-success">
									<div class="inner">
										<h3>${sta.passCount}</h3>

										<p>通过数</p>
									</div>
									<div class="icon">
										<i class="ion ion-stats-bars"></i>
									</div>
									<a href="#" class="small-box-footer">更多信息 <i class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-warning">
									<div class="inner">
										<h3>${sta.failCount}</h3>

										<p>不通过数</p>
									</div>
									<div class="icon">
										<i class="ion ion-person-add"></i>
									</div>
									<a href="#" class="small-box-footer">更多信息 <i class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-danger">
									<div class="inner">
										<h3>${sta.pendCount}</h3>

										<p>待审核数</p>
									</div>
									<div class="icon">
										<i class="ion ion-pie-graph"></i>
									</div>
									<a href="#" class="small-box-footer">更多信息 <i class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div style="height: 300px;" id="sta"></div>
							</div>
						</div>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- Main Footer -->
	<footer class="main-footer">
		<strong>Copyright © 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
		保留所有权利。
		<div class="float-right d-none d-sm-inline-block">
			<b>版本</b> 3.0.5
		</div>
	</footer>
	<div id="sidebar-overlay"></div>

</div>
</body>
</html>

<!-- 载入脚本 -->

<!-- jQuery -->
<script src="${PATH}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="${PATH}/static/adminlte/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="${PATH}/static/adminlte/plugins/chart.js/Chart.min.js"></script>
<script src="${PATH}/static/adminlte/dist/js/demo.js"></script>
<script src="${PATH}/static/adminlte/dist/js/pages/dashboard3.js"></script>
<!-- Bootstrap 4 -->
<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="${PATH}/static/adminlte/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="${PATH}/static/adminlte/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="${PATH}/static/adminlte/plugins/moment/moment.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/moment/locale/zh-cn.js"></script>
<script src="${PATH}/static/adminlte/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="${PATH}/static/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="${PATH}/static/adminlte/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${PATH}/static/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap 开关 -->
<script src="${PATH}/static/adminlte/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- AdminLTE App -->
<script src="${PATH}/static/adminlte/dist/js/adminlte.min.js"></script>
<!-- 用于演示 AdminLTE -->
<script src="${PATH}/static/adminlte/dist/js/demo.js"></script>
<script src="${PATH}/static/layui/lay/modules/layer.js"></script>
<!-- 自己的js -->
<script src="${PATH}/static/js/my.js"></script>
<!--echarts-->
<script src="${PATH}/static/js/echarts.min.js"></script>
<script>
  setHighlightAndMenuOpen("申请总览", "申请总览");

  $.ajax({
		url:"${PATH}/application/statisticAjax",
		dataType:"json",
		success:function (result) {
      var myE = echarts.init($("#sta")[0]);
      var option = {title: {
          text: '申请统计'
        },
        tooltip: {},
        legend: {
          data:['申请数']
        },
        xAxis: {
          data: ["申请总数","通过数","不通过数","待审核数"]
        },
        yAxis: {},
        series: [{
          name: '申请数',
          type: 'bar',
          data: []
        }]
      };
      option.series[0].data[0] = result.data.count;
      option.series[0].data[1] = result.data.passCount;
      option.series[0].data[2] = result.data.failCount;
      option.series[0].data[3] = result.data.pendCount;
      myE.setOption(option);
    }
	});


</script>
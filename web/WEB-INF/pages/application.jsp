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
  <title>申请寒衣</title>
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
  <link rel="stylesheet"
		href="${PATH}/static/adminlte/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
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
  <!-- summernote -->
  <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/summernote/summernote-bs4.css">
  <!-- layui -->
  <link rel="stylesheet" href="${PATH}/static/layui/css/modules/layer/default/layer.css">

	<!--自定义样式-->
	<style>

	</style>
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
		  <div class="col-lg-8">
			<div class="card">
			  <div class="card-header">

			  </div>
			  <div class="card-body">
				<form id="form_application" action="${PATH}/application/" method="post">
					<div class="form-group row">
						<input type="hidden" name="_method" value="POST">
						<label for="application_reason" class="col-sm-1 offset-sm-1 col-form-label font-weight-normal">申请理由</label>
						<div class="col-sm-9">
							<textarea id="application_reason" name="applicationReason" placeholder="当前没有申请批次，请等待下一个批次开启后再申请！" class="form-control"></textarea>
						</div>
					</div>
					<!--按钮-->
					<div class="row">
						<div class="col-sm-10 offset-1">
							<button type="button" class="btn btn-primary disabled container-fluid" id="btn_application">提交申请</button>
						</div>
					</div>
				</form>
			  </div>
			  <!--/.card body-->
			</div>
			<!--/.card-->
		  </div>
		  <!-- /.col-md-6 -->
		</div>
		<!-- /.row -->
	  </div>
	  <!-- /.container-fluid -->
	</div>
	<!-- /.content -->
  </div>

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
<script src="${PATH}/static/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
<!-- 自己的js -->
<script src="${PATH}/static/js/my.js"></script>

<script>
  setHighlightAndMenuOpen("申请寒衣", "申请寒衣");

  //进行批次激活检验、困难等级检查
  $.ajax({
		url:"${PATH}/batch/hasActiveOne",
		dataType:"json",
		success:function (result) {
		  //当前没有激活批次
      console.info(result.data);
      setBtnEnabled($("#btn_application"));
      setTips("");
			if(!result.data){
				setBtnDisabled($("#btn_application"));
				setTips("当前没有申请批次，请等待下一个批次开启后再申请！");
      }
			else{
        $.ajax({
          url:"${PATH}/batch/checkUserDiff",
          dataType:"json",
          success:function (result) {
            //困难等级不符合
            if(!result.data){
              setBtnDisabled($("#btn_application"));
              setTips("你的困难等级不符合当前批次要求，不能进行申请！");
            }
          }
        });
      }
    }
	});

  $("#btn_application").click(function () {
		$.ajax({
			url:"${PATH}/application/",
			type:"POST",
			data:$("#form_application").serialize(),
			dataType:"json",
			success:function (result) {
				if(result.data)
				  layer.msg("申请成功", {time:2000, offset:['50%', '50%']});
      }
		});
  });



</script>

<script>
	function setBtnEnabled(btn) {
	  $(btn).removeClass("disabled");
  }
  function setBtnDisabled(btn){
	  $(btn).addClass("disabled");
	}
	function setTips(str){
	  $("#application_reason").attr("placeholder", str);
	}
</script>

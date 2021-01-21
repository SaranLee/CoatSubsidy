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
	<title>白名单管理</title>
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
						<!--批次表格-->
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-2" style="align-content: center">
										<h3 class="card-title">所有白名单用户</h3>
									</div>
									<div class="col-sm-1 offset-8 card-tools">
										<button id="btn_add_whitelist" type="button" class="btn btn-outline-primary btn-sm container-fluid">
											添加用户
										</button>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap" style="text-align: center">
									<thead>
									<tr>
										<th>序号</th>
										<th>学号/工号</th>
										<th>姓名</th>
										<th>角色</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${list}" var="user" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${user.sn}</td>
											<td>${user.name}</td>
											<td>${user.roleId}</td>
											<c:if test="${user.isEnabled}">
												<td style="color: limegreen">已启用</td>
												<td>
													<button type="button" class="btn btn-danger btn-sm btn_disable" name="${user.sn}">
														禁&nbsp&nbsp用
													</button>
												</td>
											</c:if>
											<c:if test="${!user.isEnabled}">
												<td style="color: #891c14">已禁用</td>
												<td>
													<button type="button" class="btn btn-success btn-sm btn_enable" name="${user.sn}">
														启&nbsp&nbsp用
													</button>
												</td>
											</c:if>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
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

	<!--模态框-->
	<div class="modal fade" id="modal_add_whitelist" tabindex="-1" role="dialog" aria-labelledby="add_whitelist"
			 aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="add_whitelist">添加白名单用户</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form_add_whitelist">
						<input type="hidden" id="batch_id" name="id">
						<div class="form-group row ">
							<label for="sn" class="col-sm-2 offset-sm-1 col-form-label font-weight-normal">工号</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="sn" name="sn">
							</div>
						</div>
						<div class="form-group row ">
							<label for="name" class="col-sm-2 offset-sm-1 col-form-label font-weight-normal">姓名</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="name" name="name" disabled>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div class="container-fluid">
						<div class="row" style="text-align: center;margin: auto">
							<button type="button" class="btn btn-sm btn-secondary col-sm-3 offset-2" data-dismiss="modal">返回
							</button>
							<button type="button" class="btn btn-sm btn-primary col-sm-3 offset-2" id="btn_add">添加</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


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

<script>
  setHighlightAndMenuOpen("批次设置", "批次设置");

  //点击添加按钮打开模态框
  $("#btn_add_whitelist").click(function () {
    //显示添加批次的模态框
    $("#modal_add_whitelist").modal("show");
  });

  if($("#sn").val() == null || $("#sn").val().trim === ""){
    $("#name").val("请输入工号");
  }

  //模态框中，工号输入框，改变时，ajax查询姓名
  $("#sn").bind("input propertychange", function () {
    var sn = $(this).val();
    if(sn == null || sn.trim() === ""){
      $("#name").val("请输入工号");
      return;
    }
  	var user = queryUserBySn(sn);
    if(user != null)
      $("#name").val(user.username);
    else
      $("#name").val("查无此人");
  });

  //点击模态框中的保存按钮，添加批次或者修改批次信息
  $("#btn_add").click(function () {
    var sn = $("#sn").val();
    if(sn == null || sn.trim() === ""){
      layer.msg("请输入工号!");
      return false;
    }
    var user = queryUserBySn(sn);
    if(user != null)
      $.ajax({
				url:"${PATH}/whiteList/",
				type:"post",
				data:{'sn':sn, 'name':user.username},
				dataType:"json",
				success:function (result) {
					layer.msg("添加成功", {time:1500, offset:['50%', '50%']}, function () {
						$("#modal_add_whitelist").modal("hide");
          });
        }
			});
    else
      layer.msg("请输入正确的工号!");
  });

</script>

<script>
  /**
	 * 查询user_manage中指定sn的用户
   * @param sn
   * @returns {*}
   */
	function queryUserBySn(sn){
	  var data;
    $.ajax({
      url:"${PATH}/userManage/" + sn,
      type:"get",
      dataType:"json",
			async:false,
      success:function (result) {
        data = result.data;
      }
    });
    return data;
	}
</script>
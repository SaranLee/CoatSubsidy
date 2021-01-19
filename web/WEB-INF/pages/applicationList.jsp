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
	<title>申请管理</title>
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
						<!--申请表格-->
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-2" style="align-content: center">
										<h3 class="card-title">所有申请</h3>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap" style="text-align: center">
									<thead>
									<tr>
										<th>序号</th>
										<th>批次名</th>
										<th>学号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>学院</th>
										<th>专业</th>
										<th>班级</th>
										<th>困难等级</th>
										<th>申请原因</th>
										<th>操作</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${requestScope.list}" var="application" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${application.batchName}</td>
											<td>${application.sn}</td>
											<td>${application.name}</td>
											<td>${application.gender}</td>
											<td>${application.collegeName}</td>
											<td>${application.majorName}</td>
											<td>${application.className}</td>
											<td>${application.difficultyLevel}</td>
											<td>${application.applicationReason}</td>
											<td>
												<button class="btn btn-sm btn-primary btn_info" name="${application.id}">审核详情</button>
											</td>
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
	<div class="modal fade" id="modal_audit_info" tabindex="-1" role="dialog" aria-labelledby="audit"
			 aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="audit">审核详情</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="application_id" name="id">
					<div class="timeline" id="audit_history_line">
						<%--<div>--%>
							<%--<i class="fas fa-check bg-green"></i>--%>
							<%--<div class="timeline-item">--%>
								<%--<h3 class="time"><i class="fas fa-clock"> 2021-01-01</i></h3>--%>
								<%--<h3 class="timeline-header">由 <a href="#">Jay White</a> 审核</h3>--%>
								<%--<div class="timeline-body">--%>
									<%--<h4 style="color: green; margin:auto">通过</h4>--%>
								<%--</div>--%>
								<%--<div class="timeline-footer" style="padding: 0px 10px 10px 10px">--%>
									<%--sdfsjlfj--%>
								<%--</div>--%>
							<%--</div>--%>
						<%--</div>--%>
					</div>
				</div>
				<div class="modal-footer">
					<div class="container-fluid">
						<div class="row" style="text-align: center;margin: auto">
							<button type="button" class="btn btn-sm btn-secondary col-sm-3 offset-2" data-dismiss="modal">返回
							</button>
							<button type="button" class="btn btn-sm btn-primary col-sm-3 offset-2" data-dismiss="modal" id="btn_confirm">确定</button>
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
  setHighlightAndMenuOpen("申请管理", "申请管理");

  //点击审核详情按钮
  $(".btn_info").click(function () {
    $("#application_id").val($(this).attr("name"));

    $.ajax({
			url:"${PATH}/auditHistory/" + $(this).attr("name"),
			dataType:"json",
			success:function (result) {
			  //List<AuditHistory>
				var list = result.data;
				console.info(list);
				$("#audit_history_line").empty();
				$(list).each(function (i, history) {
				  var status, color, icon, flag, date;
				  if(history.status === "TG") {
            status = "通过";
            color = "green";
            icon = "check";
            flag = true;
          }
				  else{
            status = "不通过";
            color = "red";
            icon = "ban";
            flag = false;
					}
				  date = new Date(history.gmtCreated).toLocaleDateString()
						.replace("/", "年").replace("/", "月").concat("日");
				  date = date + "  " + new Date(history.gmtCreated).toTimeString().substr(0, 8);

					$("#audit_history_line").append("<div>\n" +
            "\t\t\t\t\t\t\t<i class=\"fas fa-" + icon + " bg-" + color + "\"></i>\n" +
            "\t\t\t\t\t\t\t<div class=\"timeline-item\">\n" +
            "\t\t\t\t\t\t\t\t<h3 class=\"time\"><i class=\"fas fa-clock\"> " + date + "</i></h3>\n" +
            "\t\t\t\t\t\t\t\t<h3 class=\"timeline-header\">由 <a href=\"#\">" + history.auditorName + "</a> 审核</h3>\n" +
            "\t\t\t\t\t\t\t\t<div class=\"timeline-body\">\n" +
            "\t\t\t\t\t\t\t\t\t<h4 style=\"color: " + color + "; margin:auto\">" + status + "</h4>\n" +
            "\t\t\t\t\t\t\t\t</div>\n" +
            "\t\t\t\t\t\t\t\t<div class=\"timeline-footer\" style=\"padding: 0px 10px 10px 10px\">\n" +
            "\t\t\t\t\t\t\t\t\t" + history.auditComment + "\n" +
            "\t\t\t\t\t\t\t\t</div>\n" +
            "\t\t\t\t\t\t\t</div>\n" +
            "\t\t\t\t\t\t</div>");
        });
				var leftFlow = 3 - list.length;
        //如果这个的状态是不通过，设置最后一个Flow为红色
        if(list[list.length - 1].status === "BTG"){
          $("#audit_history_line").append("<div>\n" +
            "\t\t\t\t\t\t\t<i class=\"fas fa-stop bg-red\"></i>\n" +
            "\t\t\t\t\t\t</div>");
        }
        else{
          for(var i = 0;i < leftFlow;i++){
            var index = list.length + i;
            var role;
            switch (index) {
              case 0: role = "辅导员"; break;
              case 1: role = "学院"; break;
              case 2: role = "学校"; break;
            }
            $("#audit_history_line").append("<div>\n" +
              "\t\t\t\t\t\t\t<i class=\"fas fa-hourglass-start bg-gray\"></i>\n" +
              "\t\t\t\t\t\t\t<div class=\"timeline-item\">\n" +
              "\t\t\t\t\t\t\t\t<h3 class=\"timeline-header\">等待" + role + "审核</h3>\n" +
              "\t\t\t\t\t\t\t</div>\n" +
              "\t\t\t\t\t\t</div>");
          }
        }

				if(list.length >= 3) {
				  var color;
				  if(list[list.length - 1].status !== "TG")
				    color = "red";
				  else
				    color = "green";
          $("#audit_history_line").append("<div>\n" +
            "\t\t\t\t\t\t\t<i class=\"fas fa-stop bg-" + color + "\"></i>\n" +
            "\t\t\t\t\t\t</div>");
        }
      }
		});

    //显示模态框
    $("#modal_audit_info").modal("show");
  });

</script>
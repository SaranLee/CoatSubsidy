<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/25
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>aside</title>
	<%--<link rel="stylesheet" href="${PATH}/static/adminlte/dist/css/adminlte.min.css">--%>
</head>
<body>
<!-- 导航栏 -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- 左侧导航栏链接 -->
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
		</li>
		<li class="nav-item d-none d-sm-inline-block">
			<a href="../../index3.html" class="nav-link">首页</a>
		</li>
		<li class="nav-item d-none d-sm-inline-block">
			<a href="#" class="nav-link">联系</a>
		</li>
	</ul>
</nav>
<!-- /.navbar -->

<!-- 主侧边栏容器 -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- 品牌 Logo -->
	<a href="index3.html" class="brand-link">
		<img src="${pageContext.request.contextPath}/static/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				 class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">寒衣系统</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- 侧边栏用户面板（可选） -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img id="login_user_avatar" src="${PATH}/static/img/avatar04.png" class="img-circle elevation-2" alt="用户头像">
			</div>
			<div class="info">
				<c:if test="${sessionScope.loginUser.roleId == 1}">
					<a class="username" href="#" class="d-block">${sessionScope.loginUser.name}（学生）</a>
				</c:if>
				<c:if test="${sessionScope.loginUser.roleId == 2}">
					<a class="username" href="#" class="d-block">${sessionScope.loginUser.name}（学校）</a>
				</c:if>
				<c:if test="${sessionScope.loginUser.roleId == 3}">
					<a class="username" href="#" class="d-block">${sessionScope.loginUser.name}（学院）</a>
				</c:if>
				<c:if test="${sessionScope.loginUser.roleId == 4}">
					<a class="username" href="#" class="d-block">${sessionScope.loginUser.name}（辅导员）</a>
				</c:if>
			</div>
		</div>

		<!-- 侧边栏菜单 -->
		<nav class="mt-2">
			<!--一级菜单-->
			<c:if test="${sessionScope.loginUser.roleId == 1}">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/toPage" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								申请寒衣
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/product/listByStudent" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								选择寒衣
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/whiteList/logout" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								退出登录
							</p>
						</a>
					</li>
				</ul>
			</c:if>
			<c:if test="${sessionScope.loginUser.roleId == 2}">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/waitingForAudit" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								待我审核
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/statistic" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								申请总览
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/list" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								申请管理
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/batch/list" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								批次设置
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/whiteList/list" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								白名单管理
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="#" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								寒衣管理
								<i class="fas fa-angle-left right"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="${PATH}/product/list" class="nav-link link-2nd">
									<i class="far fa-circle nav-icon"></i>
									<p>寒衣列表</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${PATH}/product/toAdd" class="nav-link link-2nd">
									<i class="far fa-circle nav-icon"></i>
									<p>添加寒衣</p>
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/whiteList/logout" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								退出登录
							</p>
						</a>
					</li>
				</ul>
			</c:if>
			<c:if test="${sessionScope.loginUser.roleId == 3}">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/waitingForAudit" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								待我审核
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/list" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								申请管理
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/whiteList/logout" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								退出登录
							</p>
						</a>
					</li>
				</ul>
			</c:if>
			<c:if test="${sessionScope.loginUser.roleId == 4}">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/waitingForAudit" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								待我审核
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/application/list" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								申请管理
							</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="${PATH}/whiteList/logout" class="nav-link link-1st">
							<i class="nav-icon fas fa-edit"></i>
							<p>
								退出登录
							</p>
						</a>
					</li>
				</ul>
			</c:if>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>

<!--模态框-->
<div class="modal fade" id="modal_switch_user" tabindex="-1" role="dialog" aria-labelledby="audit"
		 aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="audit">切换用户</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<c:if test="${loginUser.sn != 6421}">
					<form id="school" action="${PATH}/whiteList/login" method="post">
						<input type="hidden" name="name" value="谢伯华">
						<input type="hidden" name="sn" value="6421">
						<button class="btn btn-outline-primary col-sm-8 offset-sm-2">谢伯华（学校用户）</button>
					</form>
				</c:if>
				<c:if test="${loginUser.sn != 9693}">
					<form id="college" action="${PATH}/whiteList/login" method="post">
						<input type="hidden" name="name" value="陈华">
						<input type="hidden" name="sn" value="9693">
						<button class="btn btn-outline-primary col-sm-8 offset-sm-2">陈华（学院用户）</button>
					</form>
				</c:if>
				<c:if test="${loginUser.sn != 11084}">
					<form id="instructor" action="${PATH}/whiteList/login" method="post">
						<input type="hidden" name="name" value="王群超">
						<input type="hidden" name="sn" value="11084">
						<button class="btn btn-outline-primary col-sm-8 offset-sm-2">王群超（辅导员）</button>
					</form>
				</c:if>
				<c:if test="${loginUser.sn != 11084}">
					<form id="instructor" action="${PATH}/whiteList/login" method="post">
						<input type="hidden" name="name" value="李道成">
						<input type="hidden" name="sn" value="11068">
						<button class="btn btn-outline-primary col-sm-8 offset-sm-2">李道成（辅导员）</button>
					</form>
				</c:if>
				<c:if test="${loginUser.sn != 0121801100625}">
					<form id="student" action="${PATH}/whiteList/login" method="post">
						<input type="hidden" name="name" value="李佳辉">
						<input type="hidden" name="sn" value="0121801100625">
						<button class="btn btn-outline-primary col-sm-8 offset-sm-2">李佳辉（学生）</button>
					</form>
				</c:if>

			</div>
		</div>
	</div>
</div>
</body>
</html>

<script src="${PATH}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<%--<script src="${PATH}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
<%--<!-- AdminLTE App -->--%>
<%--<script src="${PATH}/static/adminlte/dist/js/adminlte.min.js"></script>--%>

<script>
	$(".username").click(function () {
		$("#modal_switch_user").modal("show")
  });
</script>
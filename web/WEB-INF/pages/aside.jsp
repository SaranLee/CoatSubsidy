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
            <img src="${pageContext.request.contextPath}/static/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- 侧边栏用户面板（可选） -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img id="login_user_avatar" src="" class="img-circle elevation-2" alt="用户头像">
                </div>
                <div class="info">
                    <a href="#" class="d-block">${sessionScope.loginUser.name}</a>
                </div>
            </div>

            <!-- 侧边栏菜单 -->
            <nav class="mt-2">
                <!--一级菜单-->
                <c:if test="${sessionScope.loginUser.roleId == 2}">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link link-1st">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    待我审核
                                </p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link link-1st">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    申请总览
                                </p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link link-1st">
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
                            <a href="#" class="nav-link link-1st">
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
                                    <a href="#" class="nav-link link-2nd">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>寒衣列表</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${PATH}/product/toPage" class="nav-link link-2nd">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>添加寒衣</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${sessionScope.loginUser.roleId == 1}">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link link-1st">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    申请寒衣
                                </p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link link-1st">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    申请历史
                                </p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link link-1st">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    balabala
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
</body>
</html>
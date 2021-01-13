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
    <title>批次列表</title>
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
    <link rel="stylesheet" href="${PATH}/static/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
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
                                    <div class="col-sm-1" style="align-content: center">
                                        <h3 class="card-title">所有批次</h3>
                                    </div>
                                    <div class="col-sm-5 offset-2">
                                        <div class="input-group input-group-sm">
                                            <input type="text" class="form-control" placeholder="批次名" style="display: inline">
                                            <select class="form-control" style="display: inline-block">
                                                <option>困难等级</option>
                                            </select>
                                            <span class="input-group-append">
                                            <button type="button" class="btn btn-info btn-flat">搜&nbsp&nbsp索</button>
                                        </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 offset-2 card-tools">
                                        <button id="btn_add_batch" type="button" class="btn btn-outline-primary btn-sm" style="margin-right: 10px;">添加批次</button>
                                        <button id="del_batch" type="button" class="btn btn-outline-danger btn-sm" style="margin-right: 60px;">批量删除</button>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap" style="text-align: center">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>编号</th>
                                        <th>批次名</th>
                                        <th>申请开始时间</th>
                                        <th>申请结束时间</th>
                                        <th>选衣开始时间</th>
                                        <th>选衣结束时间</th>
                                        <th>困难等级</th>
                                        <th>当前批次状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.pageInfo.list}" var="batch" varStatus="status">
                                        <tr id="slkfjsfj">
                                            <td>${pageInfo.pageSize * (pageInfo.pageNum - 1) + status.count}</td>
                                            <td>${batch.id}</td>
                                            <td>${batch.name}</td>
                                            <td>${batch.applicationStartDate}</td>
                                            <td>${batch.applicationEndDate}</td>
                                            <td>${batch.registerStartDate}</td>
                                            <td>${batch.registerEndDate}</td>
                                            <td>${batch.difficultyLevel}</td>
                                            <c:if test="${batch.active == 1}">
                                                <td style="color: limegreen">已激活</td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-sm btn_close" name="${batch.id}">关&nbsp&nbsp闭</button>
                                                    <button type="button" class="btn btn-primary btn-sm btn_mod" name="${batch.id}">修&nbsp&nbsp改</button>
                                                </td>
                                            </c:if>
                                            <c:if test="${batch.active == 0}">
                                                <td style="color: #891c14">未激活</td>
                                                <td>
                                                    <button type="button" class="btn btn-success btn-sm btn_active" name="${batch.id}">激&nbsp&nbsp活</button>
                                                    <button type="button" class="btn btn-primary btn-sm btn_mod" name="${batch.id}">修&nbsp&nbsp改</button>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div style="text-align: center; vertical-align: center; margin-bottom: 10px;margin-top: 10px">
                                    <!--每页记录数-->
                                    <div class="form-group" style="display: inline-block; float: left; margin-left: 50px">
                                        <label for="setPageSize" class="col-form-label font-weight-light">每页记录数</label>
                                        <select id="setPageSize" class="form-control" style="display: inline-block; width: 80px;">
                                            <option value="10">10条</option>
                                            <option value="20">20条</option>
                                            <option value="50">50条</option>
                                            <option value="100">100条</option>
                                        </select>
                                    </div>
                                    <!--页码-->
                                    <nav aria-label="Page navigation example" style="display: inline-block; vertical-align: middle">
                                        <ul id="empPaging" class="pagination" style="margin: 0px">
                                            <!--前一页-->
                                            <c:if test="${requestScope.pageInfo.hasPreviousPage}">
                                                <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNo=${requestScope.pageInfo.prePage}&pageSize=${requestScope.pageInfo.pageSize}">Previous</a></li>
                                            </c:if>
                                            <c:if test="${!requestScope.pageInfo.hasPreviousPage}">
                                                <li class="page-item disabled"><a class="page-link" href="${PATH}/batch/list?pageNo=${requestScope.pageInfo.prePage}&pageSize=${requestScope.pageInfo.pageSize}">Previous</a></li>
                                            </c:if>
                                            <!--首页-->
                                            <c:if test="${requestScope.pageInfo.navigateFirstPage > 1}">
                                                <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNo=1$pageSize=${requestScope.pageInfo.pageSize}">1</a></li>
                                            </c:if>
                                            <!--省略号-->
                                            <c:if test="${requestScope.pageInfo.navigateFirstPage > 2}">
                                                <li class="page-item"><span class="page-link">...</span></li>
                                            </c:if>
                                            <c:forEach items="${requestScope.pageInfo.navigatepageNums}" var="showNo" varStatus="index">
                                                <c:if test="${requestScope.pageInfo.pageNum == showNo}">
                                                    <li class="page-item active"><a class="page-link" href="${PATH}/batch/list?pageNo=${showNo}&pageSize=${requestScope.pageInfo.pageSize}">${showNo}</a></li>
                                                </c:if>
                                                <c:if test="${requestScope.pageInfo.pageNum != showNo}">
                                                    <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNo=${showNo}&pageSize=${requestScope.pageInfo.pageSize}">${showNo}</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <!--省略号-->
                                            <c:if test="${requestScope.pageInfo.navigateLastPage < requestScope.pageInfo.pages - 1}">
                                                <li class="page-item"><span class="page-link">...</span></li>
                                            </c:if>
                                            <!--尾页-->
                                            <c:if test="${requestScope.pageInfo.navigateLastPage < requestScope.pageInfo.pages}">
                                                <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNo=${requestScope.pageInfo.pages}&pageSize=${requestScope.pageInfo.pageSize}">${requestScope.pageInfo.pages}</a></li>
                                            </c:if>
                                            <!--后一页-->
                                            <c:if test="${requestScope.pageInfo.hasNextPage}">
                                                <li class="page-item"><a class="page-link" href="${PATH}/batch/list?pageNo=${requestScope.pageInfo.nextPage}&pageSize=${requestScope.pageInfo.pageSize}">Next</a></li>
                                            </c:if>
                                            <c:if test="${!requestScope.pageInfo.hasNextPage}">
                                                <li class="page-item disabled"><a class="page-link" href="${PATH}/batch/list?pageNo=${requestScope.pageInfo.nextPage}&pageSize=${requestScope.pageInfo.pageSize}">Next</a></li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                    <!--页面跳转-->
                                    <div class="form-group" style="display: inline-block; float: right; margin-right: 50px;">
                                        <input type="number" name="jump" class="form-control" style="display: inline-block; width: 80px;">
                                        <button name="jump" type="button" class="btn btn-sm btn-outline-success">Go</button>
                                    </div>
                                </div>

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

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
        <div class="p-3 control-sidebar-content"><h5>自定义 AdminLTE</h5>
            <hr class="mb-2">
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>无导航栏边框</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>页面小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>导航栏小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>底部小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏平面样式</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏传统样式</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>紧凑侧边栏</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏子级缩进</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>主侧边栏禁用悬停/获得焦点时自动展开</span></div>
            <div class="mb-4"><input type="checkbox" value="1" class="mr-1"><span>品牌小号字体</span></div>
            <h6>导航栏颜色</h6>
            <div class="d-flex">
                <div class="d-flex flex-wrap mb-3">
                    <div class="bg-primary elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-secondary elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-info elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-success elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-danger elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-indigo elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-purple elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-pink elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-navy elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-lightblue elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-teal elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-cyan elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-dark elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-gray-dark elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-gray elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-light elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-warning elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-white elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-orange elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                </div>
            </div>
            <h6>强调颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-fuchsia elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-maroon elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lime elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-olive elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
            </div>
            <h6>暗色侧边栏颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-fuchsia elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-maroon elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lime elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-olive elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
            </div>
            <h6>亮色侧边栏颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-fuchsia elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-maroon elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lime elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-olive elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
            </div>
            <h6>品牌 LOGO 颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-secondary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-cyan elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-dark elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-gray-dark elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-gray elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-light elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-white elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <a href="javascript:void(0)">清除</a></div>
        </div>
    </aside>
    <!-- /.control-sidebar -->

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
    <div class="modal fade" id="modal_batch_info" tabindex="-1" role="dialog" aria-labelledby="batch_info"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="batch_info">添加批次</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form_add_batch">
                        <input type="hidden" id="batch_id" name="id">
                        <div class="form-group row ">
                            <label for="batch_name" class="col-sm-3 col-form-label font-weight-normal">批次名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="batch_name" name="name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="applicationStartDate" class="col-sm-3 col-form-label font-weight-normal">申请开始时间</label>
                            <div class="col-sm-9 input-group date" id="applicationStartDate" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#applicationStartDate" name="applicationStartDate">
                                <div class="input-group-append" data-target="#applicationStartDate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="applicationEndDate" class="col-sm-3 col-form-label font-weight-normal">申请结束时间</label>
                            <div class="col-sm-9 input-group date" id="applicationEndDate" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#applicationEndDate" name="applicationEndDate">
                                <div class="input-group-append" data-target="#applicationEndDate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="registerStartDate" class="col-sm-3 col-form-label font-weight-normal">选衣开始时间</label>
                            <div class="col-sm-9 input-group date" id="registerStartDate" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#registerStartDate" name="registerStartDate">
                                <div class="input-group-append" data-target="#registerStartDate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="registerEndDate" class="col-sm-3 col-form-label font-weight-normal">选衣开始时间</label>
                            <div class="col-sm-9 input-group date" id="registerEndDate" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#registerEndDate" name="registerEndDate">
                                <div class="input-group-append" data-target="#registerEndDate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="difficultyLevel" class="col-sm-3 col-form-label font-weight-normal">困难等级</label>
                            <div class="col-sm-9">
                                <select id="difficultyLevel" class="form-control" name="difficultyLevel">
                                    <!---->
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="active">
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="container-fluid">
                        <div class="row" style="text-align: center;margin: auto">
                            <button type="button" class="btn btn-sm btn-secondary col-sm-3 offset-2" data-dismiss="modal">返回
                            </button>
                            <button type="button" class="btn btn-sm btn-primary col-sm-3 offset-2" id="btn_save">保存</button>
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
<!-- 用于演示 AdminLTE  -->
<script src="${PATH}/static/adminlte/dist/js/demo.js"></script>
<script src="${PATH}/static/layui/lay/modules/layer.js"></script>
<!-- 自己的js -->
<script src="${PATH}/static/js/my.js"></script>

<script>
    setHighlightAndMenuOpen("批次设置", "批次设置");

    // 日期范围选择器
    $('#applicationStartDate').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    $('#applicationEndDate').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    $('#registerStartDate').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    $('#registerEndDate').datetimepicker({
        format: 'YYYY-MM-DD'
    });

    //显示初始每页记录数
    $("#setPageSize").val(${pageInfo.pageSize});
    //设置每页记录数
    $("#setPageSize").change(function () {
        var pageSize = ${pageInfo.pageSize};
        var pageNum = ${pageInfo.pageNum};
        var newPageSize = $(this).val();
        var newPageNum;
        var firstRecord = pageSize * (pageNum - 1) + 1;
        newPageNum = Math.ceil(firstRecord / newPageSize);
        window.location = "${PATH}/batch/list?&pageNo=" + newPageNum + "&pageSize=" + newPageSize;
    })
    //跳转页码
    $("button[name='jump']").click(function () {
        var pageNo = $("input[name='jump']").val();
        if(pageNo < 1)
            pageNo = 1;
        if(pageNo > ${pageInfo.pages})
            pageNo = ${pageInfo.pages};
        window.location = "${PATH}/batch/list?&pageNo=" + pageNo + "&pageSize=" + ${pageInfo.pageSize};
    });

    //点击添加按钮打开模态框
    $("#btn_add_batch").click(function () {
        //检查是否有已激活批次的ajax
        if(hasActiveOne())
            layer.msg("当前已有激活的批次，请在激活批次失效后再添加！", {time:2000, anim:6, offset:['50%', '50%']});
        else{
            //清空表单
            resetFormAddBatch();
            //初始化困难等级下拉
            initDifficultyLevels("tskn");
            //设置为激活
            $("input[name='active']").val(1);
            //显示添加批次的模态框
            $("#modal_batch_info").modal("show");

            //点击模态框中的添加按钮，添加批次
            $("#btn_save").click(function () {
                if( !isModalInfoCorrect() )
                    return;
            })
        }
    });

    //点击修改按钮打开模态框
    $(".btn_mod").click(function () {
        //清空表单
        resetFormAddBatch();
        $("#batch_info").text("修改批次信息");
        var batch = getBatchById($(this).attr("name"));
        //修改信息，需要知道修改哪一个批次，设置批次id
        $("#batch_id").val(batch.id);
        $("#batch_name").val(batch.name);
        $("input[name=applicationStartDate]").val(formatDate(batch.applicationStartDate));
        $("input[name=applicationEndDate]").val(formatDate(batch.applicationEndDate));
        $("input[name=registerStartDate]").val(formatDate(batch.registerStartDate));
        $("input[name=registerEndDate]").val(formatDate(batch.registerEndDate));
        $("input[name=active]").val(batch.active);
        initDifficultyLevels(batch.difficultyLevel);
        $("#modal_batch_info").modal("show");
    });

    //点击激活按钮
    $(".btn_active").click(function () {
        var btn = this;
        if(hasActiveOne())
            layer.msg("当前已经有激活批次，不能激活其他批次！", {time:2000, anim:6, offset:['50%','50%']});
        else{
            $.ajax({
                url:"${PATH}/batch/save",
                type:"POST",
                data:{id:$(btn).attr("name"), active:1},
                dataType:"json",
                success:function (result) {
                    if(result.data)
                        layer.msg("激活成功", {time:1000, offset:['50%','50%']}, function () {
                            window.location = "${PATH}/batch/list?pageNo=${pageInfo.pageNum}&pageSize=${pageInfo.pageSize}";
                        });
                }
            })
        }
    });

    //点击模态框中的保存按钮，添加批次或者修改批次信息
    $("#btn_save").click(function () {
        if( !isModalInfoCorrect() )
            return;
        //修改批次，需要id，表单域id有值；添加批次，不需要id，表单域里id没有值
        if($("#batch_id").val() == null) {
            layer.confirm("确定修改吗？", {icon:2, offset:['50%', '50%']}, function(){
                //修改批次的ajax
                $.ajax({
                    url:"${PATH}/batch/save",
                    type:"POST",
                    data:$("#form_add_batch").serialize(),
                    dataType:"json",
                    success:function (result) {
                        //true修改成功
                        if(result.data){
                            layer.msg("修改成功", {time: 2000, offset:['50%', '50%']}, function () {
                                window.location = "${PATH}/batch/list?pageNo=${pageInfo.pageNum}&pageSize=${pageInfo.pageSize}";
                            })
                        }
                        else {
                            layer.msg("修改失败")
                        }
                    }
                });
            }, function (index) {
                layer.close(index);
            });
        }
        else{
            //添加批次的ajax
            $.ajax({
                url:"${PATH}/batch/save",
                type:"POST",
                data:$("#form_add_batch").serialize(),
                dataType:"json",
                success:function (result) {
                    //true添加成功
                    if(result.data){
                        layer.msg("添加批次成功", {time: 2000, offset:['50%', '50%']}, function () {
                            window.location = "${PATH}/batch/list";
                        })
                    }
                }
            });
        }
    });

    //点击关闭按钮
    $(".btn_close").click(function () {
        var btn = this;
        layer.confirm("确认关闭吗？", {icon:3, offset:['50%','50%']}, function(){
            $.ajax({
                url:"${PATH}/batch/save",
                type:"POST",
                data:{id:$(btn).attr("name"), active:0},
                dataType:"json",
                success:function (result) {
                    if(result.data)
                        layer.msg("关闭成功！", {time:1000, offset:['50%','50%']}, function () {
                            window.location = "${PATH}/batch/list?pageNo=${pageInfo.pageNum}&pageSize=${pageInfo.pageSize}";
                        });
                }
            });
        }, function (index) {
            layer.close(index);
        });
    });
</script>

<script>
    /**
     * 用ajax请求获得是否已经有激活批次
     */
    function hasActiveOne(){
        var data;
        $.ajax({
            url:"${PATH}/batch/hasActiveOne",
            dataType:"json",
            async:false,
            success:function (result) {
                data = result.data
            }
        });
        return data;
    }

    /**
     * 通过id获取批次信息
     */
    function getBatchById(id){
        var data;
        $.ajax({
            url:"${PATH}/batch/" + id,
            type:"GET",
            dataType:"json",
            async:false,
            success:function (result) {
                data = result.data;
            }
        })
        return data;
    }

    /**
     * 转化为date字符串 yyyy-MM-dd
     * @param date
     * @returns {string}
     */
    function formatDate(date){
        var year = date.year;
        var month = date.monthValue < 10 ? "0" + date.monthValue : date.monthValue;
        var day = date.dayOfMonth < 10 ? "0" + date.dayOfMonth : date.dayOfMonth;
        return year + "-" + month + "-" + day;
    }

    /**
     * 初始化困难等级下拉框，并且设置初值
     * @param initValue
     */
    function initDifficultyLevels(initValue){
        var list;
        $.ajax({
            url: "${PATH}/dictionary/listByType?type=" + "DIFFICULTY",
            type: "GET",
            dataType: "json",
            success: function (result) {
                list = result.data;
                $("#difficultyLevel").empty();
                $(list).each(function (i, item) {
                    $("#difficultyLevel").append("<option value='" + item.itemValue + "'>" + item.itemName + "</option>");
                });
                $("#difficultyLevel").val(initValue);
            }
        });
    }

    /**
     * 检查模态框中的信息完整性和合理性
     * @returns {boolean}
     */
    function isModalInfoCorrect(){
        if($("#batch_name").val() === ""){
            layer.msg("请输入批次名", {time:2000, anim:6, offset:['50%', '50%']});
            return false;
        }
        //检查日期合理性，开始日期不能大于结束日期
        console.info($("input[name=applicationStartDate]").val());
        if(new Date($("input[name=applicationStartDate]").val()) > new Date($("input[name=applicationEndDate]").val())){
            layer.msg("申请开始日期不能大于结束日期", {time:2000, anim:6, offset:['50%', '50%']});
            return false;
        }
        if(new Date($("input[name=registerStartDate]").val()) > new Date($("input[name=registerEndDate]").val())){
            layer.msg("选衣开始日期不能大于结束日期", {time:2000, anim:6, offset:['50%', '50%']});
            return false;
        }
        return true
    }

    /**
     * 清空form_add_batch表单，包括隐藏域
     */
    function resetFormAddBatch(){
        $("#form_add_batch")[0].reset();
        $("#batch_id").val(null);
        $("input[name='active']").val(null);
    }
</script>
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
  <title>添加寒衣</title>
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
				<form id="form_add_product" action="${PATH}/product/" method="post" enctype="multipart/form-data">
				  <!--put请求，添加数据-->
				  <input type="hidden" name="_method" value="PUT">
				  <div class="form-group row">
					<label for="prod_name" class="col-sm-1 offset-1 col-form-label font-weight-normal">寒衣名</label>
					<div class="col-sm-9">
					  <input type="text" class="form-control" id="prod_name" name="name">
					</div>
				  </div>
				  <div class="form-group row">
					<label for="prod_number" class="col-sm-1 offset-1 col-form-label font-weight-normal">编号</label>
					<div class="col-sm-9">
					  <input type="text" class="form-control" id="prod_number" name="productNumber">
					</div>
				  </div>
				  <div class="form-group row">
					<label for="batch" class="col-sm-1 offset-1 col-form-label font-weight-normal">所属批次</label>
					<div class="col-sm-9">
					  <select class="form-control" id="batch" name="batchId">

					  </select>
					</div>
				  </div>
				  <div class="form-group row">
					<label class="col-sm-1 offset-1 col-form-label font-weight-normal">性别</label>
					<div class="col-sm-9">
					  <div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="male" name="gender" class="custom-control-input" value="M">
							<label class="custom-control-label font-weight-light" for="male">男&nbsp款</label>
					  </div>
					  <div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="female" name="gender" class="custom-control-input" value="F">
							<label class="custom-control-label font-weight-light" for="female">女&nbsp款</label>
					  </div>
					  <div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="male_female" name="gender" class="custom-control-input" value="MF">
							<label class="custom-control-label font-weight-light" for="male_female">男女皆宜</label>
					  </div>
					</div>
				  </div>
				  <!--规格-->
				  <div class="form-group row">
					<label class="col-sm-1 offset-1 col-form-label font-weight-normal">规格</label>
					<div class="col-sm-9">
						<span id="sku_span" style="display: inline-block">
							<!--添加的规格-->
						</span>
						<span id="btn_add_sku" class="btn btn-primary btn-sm">添加</span>
						<input id="input_add_sku" class="btn btn-outline-primary btn-sm" style="width: 100px; display: none">
					</div>
				  </div>
				  <!--图片-->
				  <div class="form-group row">
						<label class="col-sm-1 offset-1 col-form-label font-weight-normal">图片</label>
						<div class="col-sm-3">
							<input type="file" name="imgs" class="form-control">
						</div>
						<div class="col-sm-3">
							<input type="file" name="imgs" class="form-control">
						</div>
						<div class="col-sm-3">
							<input type="file" name="imgs" class="form-control">
						</div>
				  </div>
				  <!--描述-->
				  <div class="form-group row">
					<label for="batch" class="col-sm-1 offset-1 col-form-label font-weight-normal">描述</label>
					<div class="col-sm-9">
					  <textarea class="textarea" name="description" placeholder="在这里填写内容" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
					</div>
				  </div>
				  <!--按钮-->
				  <div class="row">
					<div class="col-sm-10 offset-1">
					  <button type="button" class="btn btn-primary container-fluid" id="btn_add_product">添加寒衣</button>
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
  setHighlightAndMenuOpen("寒衣管理", "添加寒衣");
  //文本编辑框
  $('.textarea').summernote({lang : 'zh-CN'});

  //获取所有的批次，并添加下拉框选项，最后设置批次初值
  $.ajax({
	url:"${PATH}/batch/",
	type:"GET",
	dataType:"json",
	success:function (result){
	  //添加下拉框选项
	  $(result.data).each(function (i, batch) {
		$("#batch").append("<option value='" + batch.id + "'>" + batch.name + "</option>");
      });
      //设置批次初始值为当前激活的批次，如果没有激活批次，设置为最近添加的一个批次，在上面获取所有批次时，是按添加顺序排序的，所以设置初值为第1个option
      $.ajax({
        url:"${PATH}/batch/currBatch",
        type:"GET",
        dataType:"json",
        success:function (result) {
          if(result.data != null)
            $("#batch").val(result.data.id);
        }
      });
    }
  });

  //添加寒衣按钮
  $("#btn_add_product").click(function () {
    var formData = new FormData();
    formData.append("_method", "POST");
    formData.append("name", $("#prod_name").val());
    formData.append("productNumber", $("#prod_number").val());
    formData.append("batchId", $("#batch").val());
    formData.append("gender", $("input:radio[name='gender']:checked").val());
    $("input[name='skuNames']").each(function (i, skuName) {
			formData.append("skuNames", $(skuName).val())
    });
    $("input[name='imgs']").each(function (i, img) {
			formData.append("imgs", img.files[0]);
    });
    formData.append("description", $("textarea").val());

		$.ajax({
			url:"${PATH}/product/",
			type:"post",
			contentType: false,
			processData: false,
			data:formData,
			dataType:"json",
			success:function (result) {
			if(result.data) {
						layer.msg("添加寒衣成功", {time: 2000, offset: ['50%', '50%']});
						resetFormAddProduct();
					}
				}
		});
  });

  //点击添加规格的按钮
	$("#btn_add_sku").click(function () {
	  $(this).attr("style", "display: none");
	  $("#input_add_sku").attr("style", "width: 100px;");
	  $("#input_add_sku").focus();
	  $("#input_add_sku").blur(function () {
	    var value = $(this).val();
			if(value !== "" ) {
        //<div class="btn-group"><input type="text" name="skus" class="sku btn btn-sm btn-info" style="width: 60px" value=""> <div class="btn btn-sm btn-info" style="text-align: center">x</div></div>
        $("#sku_span").append('<div class="btn-group" style="margin-right: 5px"><input type="text" name="skuNames" class="sku btn btn-sm btn-info" style="width: 60px" value="' + value + '"> <div class="btn_del_sku btn btn-sm btn-info" style="text-align: center">x</div></div>')

        //点击添加好后的规格，改变样式
        $(".sku").focus(function () {
          $(this).removeClass("btn-info");
          $(this).addClass("btn-outline-info");
        });
        $(".sku").blur(function () {
          $(this).addClass("btn-info");
          $(this).removeClass("btn-outline-info");
        });
        //点击删除规格的按钮
        $(".btn_del_sku").click(function () {
          $(this).parent().remove();
        });
			}
      $("#btn_add_sku").attr("style", "");
      $(this).attr("style", "width: 100px; display: none");
      $(this).val("");
    });
  });

  //重置表单
  function resetFormAddProduct(){
    $("#form_add_product")[0].reset();
  }
</script>

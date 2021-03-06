<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/17
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>选择寒衣</title>
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
	<!-- summernote -->
	<link rel="stylesheet" href="${PATH}/static/adminlte/plugins/summernote/summernote-bs4.css">
	<!-- layui -->
	<link rel="stylesheet" href="${PATH}/static/layui/css/modules/layer/default/layer.css">
	<style>
		.corner{
			border-radius: 10px
		}

		.prod_img_outline{
			border: solid 1px #c1c1c1;
			border-radius: 20px;
			width:120px;
			height:120px;
			margin-right: 20px;
			text-align: center;
			padding: 30px 0;
			position: relative;
			z-index: 0;
		}

		.prod_img_outline:hover{
			cursor: pointer;
		}

		.prod_img{
			width:60px;
			height:60px;
		}

		.show_none{
			display: none;
		}

		.circle_btn_del{
			display: none;
			width: 20px;
			height: 20px;
			text-align: center;
			line-height: 20px;
			color: #ffffff;
			background-color: #ff2823;
			opacity: 0.7;
			border-radius: 10px;
			position: absolute;
			left: 90px;
			top: 5px;
			z-index: 1;
		}

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
					<c:forEach items="${requestScope.list}" var="product" varStatus="status">
						<div class="card col-sm-2 corner" style="margin: 10px 10px 0px 20px">
							<div class="card-body">
								<div id="prodImgs" class="carousel slide" data-ride="carousel" style="height: 280px">
									<ol class="carousel-indicators">
										<c:forEach items="${product.imgs}" varStatus="status">
											<c:if test="${status.index == 0}">
												<li data-target="#prodImgs" data-slide-to="${status.index}" class="active"></li>
											</c:if>
											<c:if test="${status.index != 0}">
												<li data-target="#prodImgs" data-slide-to="${status.index}"></li>
											</c:if>
										</c:forEach>
									</ol>
									<div class="carousel-inner">
										<c:forEach items="${product.imgs}" var="img" varStatus="status">
											<c:if test="${status.index == 0}">
												<div class="carousel-item active">
													<img height="270" class="d-block w-100" src="${PATH}${img.path}" alt="第${status.count}张图片">
												</div>
											</c:if>
											<c:if test="${status.index != 0}">
												<div class="carousel-item">
													<img height="270" class="d-block w-100" src="${PATH}${img.path}" alt="第${status.count}张幻灯片">
												</div>
											</c:if>
										</c:forEach>
									</div>
									<a class="carousel-control-prev" href="#prodImgs" role="button" data-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">上一张</span>
									</a>
									<a class="carousel-control-next" href="#prodImgs" role="button" data-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">下一张</span>
									</a>
								</div>
								<div class="row">
									<h5 style="line-height: 50px; margin: auto; ">${product.name}</h5>
								</div>
								<div class="row" style="text-align: center; margin: auto">
									<div class="col-sm-12" style="text-align: center; margin: auto">
										<button name="${product.id}" class="btn btn-info btn-sm btn_info container-fluid">详情</button>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card-->
					</c:forEach>
				</div>
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
	<div class="modal fade" id="modal_prod_info" tabindex="-1" role="dialog" aria-labelledby="prod_info"
			 aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="prod_info">选择寒衣</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form_modal_product" action="${PATH}/application/selectProduct" method="post">
						<!--put请求，添加数据-->
						<input type="hidden" name="_method" value="PUT">
						<input type="hidden" name="id" id="prod_id">

						<div class="form-group row">
							<label for="prod_name" class="col-sm-1 offset-1 col-form-label font-weight-normal">寒衣名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="prod_name" name="name" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="prod_number" class="col-sm-1 offset-1 col-form-label font-weight-normal">编号</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="prod_number" name="productNumber" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="batch" class="col-sm-1 offset-1 col-form-label font-weight-normal">所属批次</label>
							<div class="col-sm-9">
								<select class="form-control" id="batch" name="batchId" disabled>

								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-1 offset-1 col-form-label font-weight-normal">性别</label>
							<div class="col-sm-9">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="male" name="gender" class="custom-control-input" value="M" disabled>
									<label class="custom-control-label font-weight-light" for="male">男&nbsp款</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="female" name="gender" class="custom-control-input" value="F" disabled>
									<label class="custom-control-label font-weight-light" for="female">女&nbsp款</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="male_female" name="gender" class="custom-control-input" value="MF" disabled>
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
							<div class="prod_img_outline">
								<div class="circle_btn_del">×</div>
								<img class="prod_img" src="${PATH}/static/img/add.png" alt="">
								<input type="file" name="imgs" class="show_none">
							</div>
							<div class="prod_img_outline">
								<div class="circle_btn_del">×</div>
								<img class="prod_img" src="${PATH}/static/img/add.png" alt="">
								<input type="file" name="imgs" class="show_none">
							</div>
							<div class="prod_img_outline">
								<div class="circle_btn_del">×</div>
								<img class="prod_img" src="${PATH}/static/img/add.png" alt="">
								<input type="file" name="imgs" class="show_none">
							</div>
						</div>
						<!--描述-->
						<div class="form-group row">
							<label for="batch" class="col-sm-1 offset-1 col-form-label font-weight-normal">描述</label>
							<div class="col-sm-9">
								<textarea class="textarea" name="description" placeholder="在这里填写内容" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; display: none;"></textarea>
							</div>
						</div>
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
<script src="${PATH}/static/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<script src="${PATH}/static/adminlte/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
<!-- 自己的js -->
<script src="${PATH}/static/js/my.js"></script>

<script>
  setHighlightAndMenuOpen("选择寒衣", "选择寒衣");
  //文本编辑框
  $('.textarea').summernote({lang : 'zh-CN'});

  //点击修改按钮，打开模态框
	$(".btn_info").click(function () {
	  $("#prod_id").val($(this).name);

    //获取该寒衣的信息：ProductVO，并设置表单信息的的初值
    $.ajax({
      url:"${PATH}/product/" + $(this).attr("name"),
      type:"get",
      dataType:"json",
      success:function (result) {
        if(result.data != null){
          var product = result.data;
          console.info(product);
          //设置表单初值
          $("#prod_id").val(product.id);
          $("#prod_name").val(product.name);
          $("#prod_number").val(product.productNumber);
          initBatchOptions();
          $("#batch").val(product.batchId);
          checkGender(product.gender);
          emptySkus();
          $(product.skus).each(function (i, sku) {
            addSku(sku.name);
          });
          var prod_img_outline = $(".prod_img_outline").first();
          $(product.imgs).each(function (i, img) {
            $(prod_img_outline).children("img").attr('name', img.path);
            setImgInput($(prod_img_outline).children("input"), "", prod_img_outline.children("img"), "${PATH}" + img.path, true);
            prod_img_outline = prod_img_outline.next();
          });
          $(".textarea").summernote("code", product.description);
        }
      }
    });
	  //显示模态框
		$("#modal_prod_info").modal("show");
  });


</script>












<script>
  /**
	 * 添加一个可以进行修改和删除的规格标签
   * @param skuName 规格名称
   */
	function addSku(skuName){
    //<div class="btn-group"><input type="text" name="skus" class="sku btn btn-sm btn-info" style="width: 60px" value=""> <div class="btn btn-sm btn-info" style="text-align: center">x</div></div>
    $("#sku_span").append('<div class="btn-group" style="margin-right: 5px"><input type="text" name="skuNames" class="sku btn btn-sm btn-info" style="width: 60px" value="' + skuName + '"> <div class="btn_del_sku btn btn-sm btn-info" style="text-align: center">x</div></div>')

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

	/**
	 * 清空sku，防止重复append
	 */
	function emptySkus(){
		$("#sku_span").empty();
	}

  /**
	 * 重置表单，清空表单信息
   */
  function resetFormAddProduct(){
    $("#form_modal_product")[0].reset();
  }

  /**
	 * 获取所有的批次，并添加下拉框选项
   */
  function initBatchOptions(){
    $("#batch").empty();
    $.ajax({
      url:"${PATH}/batch/",
      type:"GET",
      dataType:"json",
			async:false,
      success:function (result){
        //添加下拉框选项
        $(result.data).each(function (i, batch) {
          $("#batch").append("<option value='" + batch.id + "'>" + batch.name + "</option>");
        });
      }
    });
	}

  /**
	 * 设置性别初值
   * @param val 要check的radio值
   */
	function checkGender(val){
    $("input[type=radio][name=gender]").attr("checked",false);
    $("input[type=radio][name=gender][value=" + val + "]").attr("checked",true);
	}

  /**
	 * 获取input file的真实路径
   */
  function getObjectURL(file) {
    var url = null;
    if (window.createObjcectURL != undefined) {
      url = window.createOjcectURL(file);
    } else if (window.URL != undefined) {
      url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) {
      url = window.webkitURL.createObjectURL(file);
    }
    return url;
  }

  //点击图片，选择上传的图片
  $(".prod_img_outline").click(function(){
	  var input = $(this).children("input");
	  var img = $(this).children("img");
    input[0].click(function () {
			$(input).val($(img).src());
    });
    input.change(function () {
      var urlStr = $(this).val();
      if(urlStr == null || urlStr === ""){
        clearImgInput(this, img);
			}else{
        setImgInput(null, null, $(img), getObjectURL(this.files[0]), false);
      }
    });

	});

  //显示 x 按钮
  $(".prod_img_outline").mouseover(function () {
    var img = $(this).children("img");
    if(img.attr('src') !== "${PATH}/static/img/add.png")
    	$(this).children(".circle_btn_del").show();
  });
  //隐藏 x 按钮
  $(".prod_img_outline").mouseleave(function () {
    $(this).children(".circle_btn_del").hide();
  });

  //点击 x 按钮时
  $(".circle_btn_del").click(function (e) {
		e.stopPropagation();
		clearImgInput($(this).next().next(), $(this).next());
  });

  /**
	 * 将input的value清除，并将图片替换为add.png
   */
	function clearImgInput(input, img){
    $(input).val("");
    $(img).attr("src", "${PATH}/static/img/add.png");
    $(img).css("width", "60px").css("height", "60px");
    $(img).parent().css("padding", "30px 0");
	}

  /**
	 * 设置input的value，并设置图片为指定图片
   * @param input input元素
   * @param value	input元素的值
   * @param img		img元素
   * @param src		img元素的src
   * @param old		是否是旧图片
   */
  function setImgInput(input, value, img, src, old){
    if(input != null){
      $(input).val(value);
      //如果old == true，设置为旧图片，不用再次上传
      if(old) {
        $(input).attr('name', 'oldImg');
      }
      else {
        $(input).attr('name', 'imgs');
      }
		}
    $(img).attr("src", src);
    $(img).css("width", "100px").css("height", "100px");
    $(img).parent().css("padding", "10px 0");
	}

</script>
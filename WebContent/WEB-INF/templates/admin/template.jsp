<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!-- header -->
<!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap Admin Theme v3</title>
    <link rel="shortcut icon" type="image/ico" href="${contextPath}/resources/admin/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${contextPath}/resources/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${contextPath}/resources/admin/css/style1.css" rel="stylesheet">
    <link href="${contextPath}/resources/admin/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="${contextPath}/resources/admin/assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
 <link href="${contextPath}/resources/admin/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
 
  <link href="${contextPath }/resources/public/css/font-awesome.css" rel="stylesheet">
  
 <script type="text/javascript" src="${contextPath}/resources/admin/ckeditor/ckeditor.js"></script>
 
 <style type="text/css">
			.myError{
				color: red;
				font-style: italic;
			}
		</style>
  <!-- Argon CSS -->
  
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<tiles:insertAttribute name="header" />
    <div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		  	<tiles:insertAttribute name="left-bar"></tiles:insertAttribute>
		  </div>
		  <div class="col-md-10">
				<tiles:insertAttribute name="content" />
		  </div><!-- /.col-md-10 -->
		</div><!-- /.row -->
    </div><!-- /.page-content -->

   <tiles:insertAttribute name="footer" />

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${contextPath}/resources/admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/admin/js/custom.js"></script>
    <script src="${contextPath}/resources/admin/js/slider.js"></script>
     <script src="${contextPath}/resources/admin/assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="${contextPath}/resources/admin/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Optional JS -->
  <script src="${contextPath}/resources/admin/assets/vendor/chart.js/dist/Chart.min.js"></script>
  <script src="${contextPath}/resources/admin/assets/vendor/chart.js/dist/Chart.extension.js"></script>
  <!-- Argon JS -->
  <script src="${contextPath}/resources/admin/assets/js/argon.js?v=1.0.0"></script>
  <script src="${contextPath }/resources/public/js/sequence-theme.modern-slide-in.js"></script>  
  <script type="text/javascript" src="${contextPath }/resources/public/js/nouislider.js"></script>
  </body>
</html>
    <!-- /.footer -->
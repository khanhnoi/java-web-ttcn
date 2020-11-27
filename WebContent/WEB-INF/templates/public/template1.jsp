<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Daily Shop | Product</title>
    
    <!-- Font awesome -->
    <link href="${contextPath }/resources/public/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="${contextPath }/resources/public/css/bootstrap.css" rel="stylesheet">   
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="${contextPath }/resources/public/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="${contextPath }/resources/public/css/jquery.simpleLens.css">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="${contextPath }/resources/public/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="${contextPath }/resources/public/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="${contextPath }/resources/public/css/theme-color/default-theme.css" rel="stylesheet">
    <!-- Top Slider CSS -->
    <link href="${contextPath }/resources/public/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="${contextPath }/resources/public/css/style.css" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  
   <!-- wpf loader Two -->
   <tiles:insertAttribute name="header1"></tiles:insertAttribute>
  <!-- / menu -->
  <!-- Start slider -->
  <tiles:insertAttribute name="content"></tiles:insertAttribute>
  <!-- / Client Brand -->

  <!-- Subscribe section -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>   

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="${contextPath }/resources/public/js/bootstrap.js"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="${contextPath }/resources/public/js/jquery.smartmenus.js"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="${contextPath }/resources/public/js/jquery.smartmenus.bootstrap.js"></script>  
  <!-- To Slider JS -->
  <script src="${contextPath }/resources/public/js/sequence.js"></script>
  <script src="${contextPath }/resources/public/js/sequence-theme.modern-slide-in.js"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="${contextPath }/resources/public/js/jquery.simpleGallery.js"></script>
  <script type="text/javascript" src="${contextPath }/resources/public/js/jquery.simpleLens.js"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="${contextPath }/resources/public/js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="${contextPath }/resources/public/js/nouislider.js"></script>
  <!-- Custom js -->
  <script src="${contextPath }/resources/public/js/custom.js"></script> 
  

  </body>
</html>
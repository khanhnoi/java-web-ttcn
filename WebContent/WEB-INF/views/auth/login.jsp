<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login V9</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${contextPath}/resources/auth/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/auth/css/main.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="container-login100"
		style="background-image: url('images/bg-01.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form class="login100-form validate-form"
				action="${pageContext.request.contextPath}/auth/login" method="post">
				<span class="login100-form-title p-b-37"> Sign In </span>
				<c:if test="${param['msg'] eq 'Error'}">
					<div class="alert alert-danger">
						<strong>Sai tên đăng nhập hoặc mật khẩu</strong>
					</div>

				</c:if>
				<div class="wrap-input100 validate-input m-b-20"
					data-validate="Enter username or email">
					<input class="input100" type="text" name="username"
						placeholder="username or email"> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"
					data-validate="Enter password">
					<input class="input100" type="password" name="password"
						placeholder="password"> <span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<button class="login100-form-btn">Sign In</button>
				</div>

				
				
			</form>


		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script
		src="${contextPath}/resources/auth/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${contextPath}/resources/auth/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${contextPath}/resources/auth/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${contextPath}/resources/auth/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${contextPath}/resources/auth/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${contextPath}/resources/auth/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${contextPath}/resources/auth/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${contextPath}/resources/auth/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/auth/js/main.js"></script>

</body>
</html>
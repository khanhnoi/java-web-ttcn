<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="sidebar content-box" style="display: block;">
	<!-- Nav-bar -->
	<ul class="nav">
		<!-- Main menu -->
		<li class="nav-item"><a class="nav-link"
			href="${contextPath }/admin"> <i class="ni ni-spaceship"></i>
				Trang chủ
		</a></li>
		<li><a href="${contextPath }/admin/cat"> <i
				class="ni ni-tv-2 text-primary"></i> Danh mục
		</a></li>
		<li><a href="${contextPath }/admin/book"> <i
				class="ni ni-planet text-blue"></i> Tin sách
		</a></li>
		<li><a href="${contextPath }/admin/cart"> <i
				class="ni ni-single-05 text-red"></i> Đơn hàng
		</a></li>
		<li><a href="${contextPath }/admin/user"> <i
				class="ni ni-pin-3 text-orange"></i> Users
		</a></li>
		<li><a href="${contextPath }/admin/contact"> <i
				class="ni ni-single-02 text-yellow"></i> Liên hệ
		</a></li>
		

	</ul>
	<!-- /.nav-bar -->
</div>
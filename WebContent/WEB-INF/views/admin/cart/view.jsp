<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal" var="principal" />
<div class="content-box-large">
	<div class="row">
		<div class="panel-heading">
			<div class="panel-title ">Chi tiết đơn hàng</div>
		</div>
	</div>
	<hr>
	<div class="row"></div>
	<h6>${msg }</h6>
	<div class="row">
		<div class="panel-body">
			
			<form action="" method="POST">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="name">Tên người dùng</label> 
							<p>${order.name }</p>
						</div>
						<div class="form-group">
							<label for="name">Phone</label>
							<p>${order.phone }</p>
						</div>
						<div class="form-group">
							<label for="name">Địa chỉ</label>
							<p>${order.address }</p>
						</div>
						<div class="form-group">
							<label for="name">Ngày đặt</label>
							<p>${order.date }</p>
						</div>
						<div class="form-group">
							<label for="name">Cách thanh toán</label>
							<p>${order.payments }</p>
						</div>
						<div class="form-group">
							<select class="form-control" name="paid">
								<c:choose>
									<c:when test="${order.paid eq 0 }">
										<option value="0">Chưa thanh toán</option>
										<option value="1">Đã thanh toán</option>
									</c:when>
									<c:otherwise>
										<option value="1">Đã thanh toán</option>
										<option value="0">Chưa thanh toán</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
						
					</div>
				</div>
		</div>
		
		<table cellpadding="0" cellspacing="0" border="0"
			class="table table-striped table-bordered" id="example">
			<thead>
				<tr>
					<th>Tên  sản phẩm</th>
					<th>Số lượng</th>
					<th>Gía sản phẩm</th>
					<th>Tổng</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach  items="${listCartOrder }" var="objOrder">	
					<c:set value="${bookDAO.getBook(objOrder.getPro_id()) }" var="item"></c:set>	
					<tr class="odd gradeX">
					
						<td>${item.name }</td>
						<td>${objOrder.quantity }</td>
						<td>${item.price}</td>
						<td>${objOrder.quantity*item.price}</td>
					</tr>
					</c:forEach>
			</tbody>
			
		</table>
				<p style="color: red;float: right;font-weight: bold">Tổng: ${total } Đ</p>
		<div class="row">
			<div class="col-sm-12">
				<input type="submit" value="Save" class="btn btn-success" /> 
			</div>
		</div>
		</form>
	</div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->


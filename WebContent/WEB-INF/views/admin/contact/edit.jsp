<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tablib.jsp" %>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="row">
				<form action="" method="POST">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Sửa liên hệ</div>
			  			</div>
			  			<form:errors path="objContact.*" class="myErrors"></form:errors>
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								<c:if test="${not empty objContact }">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên liên hệ</label>
											<input type="text" name="name" class="form-control" placeholder="${objContact.name }" value="${objContact.name }" >
										</div>
										<div class="form-group">
											<label for="name">Email</label>
											<input type="text" name="email" class="form-control" placeholder="${objContact.email }" value="${objContact.email }" >
										</div>
										<div class="form-group">
											<label for="name">Phone</label>
											<input type="text" name="phone" class="form-control" placeholder="${objContact.phone }" value="${objContact.phone }" >
										</div>
										<div class="form-group">
											<label for="name">Địa chỉ</label>
											<input type="text" name="address" class="form-control" placeholder="${objContact.address }" value="${objContact.address }" >
										</div>
										<div class="form-group">
											<label for="name">Chủ đề</label>
											<input type="text" name="subject" class="form-control" placeholder="${objContact.subject }" value="${objContact.subject }" >
										</div>
										<div class="form-group">
											<label for="name">Nội dung</label>
											<input type="text" name="content" class="form-control" placeholder="${objContact.content }" value="${objContact.content }">
										</div>
										
									</div>

									<div class="col-sm-6"></div>

									
								</div>
								</c:if>
								<hr>

								<div class="row">
									<div class="col-sm-12">
										<input type="submit" value="Sửa" class="btn btn-success" />
										<input type="reset" value="Nhập lại" class="btn btn-default" />
									</div>
								</div>

							</div>
						</div>
			  		</div>
			  		</form>
	  			</div>
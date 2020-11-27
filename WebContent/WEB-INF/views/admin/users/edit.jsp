<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tablib.jsp" %>
<div class="row">
				<form action="<%-- ${contextPath }/admin/cat/edit/${cid} --%>" method="POST" enctype="multipart/form-data">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Sửa người dùng</div>
			  			</div>
			  			<form:errors path="objUser.*" class="myErrors"></form:errors>
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên đăng nhập</label>
											<input type="text" name="username" class="form-control" placeholder="${objUser.username }" value="${objUser.username }" >
										</div>
										<div class="form-group">
											<label for="name">Họ tên</label>
											<input type="text" name="fullname" class="form-control" placeholder="${objUser.fullname }" value="${objUser.fullname }" >
										</div>
										<div class="form-group">
											<label for="name">Password</label>
											<input type="text" name="password" class="form-control" placeholder="${objUser.password }" value="" >
										</div>
										<div class="form-group">
											<label for="name">Birthday</label>
											<input type="text" name="birthday" class="form-control" placeholder="Nhập ngày sinh" value="${objUser.birthday }">
										</div>
										<div class="form-group">
											<label for="name">Email</label>
											<input type="text" name="email" class="form-control" placeholder="Nhập email" value="${objUser.email }">
										</div>
										<div class="form-group">
											<label>Avatar</label>
											<input type="file" name="picturePreview" class="btn btn-default" id="exampleInputFile1" value="${pageContext.request.contextPath }/fileUpload/${objUser.avatar}" src="${pageContext.request.contextPath }/fileUpload/${objUser.avatar}">
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
										<div class="form-group">
											<label for="name">Giới tính</label>
											<select class="form-control" name="sId">
											   <option value="${sex.sId }">${sex.sname }</option>
											   <c:forEach items="${listSex}" var="objSex">
											   <option value="${objSex.sId}">${objSex.sname}</option>
											   </c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="name">Chức năng</label>
											<select class="form-control" name="roleId">
											   <option value="${role.roleId }">${role.name }</option>
											   <c:forEach items="${listRole}" var="objRole">
											   <option value="${objRole.roleId}">${objRole.name}</option>
											   </c:forEach>
											</select>
										</div>
									</div>

									<div class="col-sm-6"></div>

									
								</div>

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
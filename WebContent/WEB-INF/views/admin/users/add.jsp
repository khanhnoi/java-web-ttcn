<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm người dùng</div>
			  			</div>
			  			<h6>${msg }</h6>
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								<form:errors path="objUser.*" class="myErrors" ></form:errors>
								<c:if test="${param['msg'] eq 'userError'}">
			                		<p>Chức năng không để trống</p>
			                	</c:if>
								<form action="" method="POST" enctype="multipart/form-data" >
								<div class="row">
								
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên đăng nhập</label>
											<input type="text" name="username" class="form-control" placeholder="Nhập tên đăng nhập">
										</div>
										<div class="form-group">
											<label for="name">Họ tên</label>
											<input type="text" name="fullname" class="form-control" placeholder="Nhập họ tên">
										</div>
										<div class="form-group">
											<label for="name">Password</label>
											<input type="text" name="password" class="form-control" placeholder="Nhập mật khẩu">
										</div>
										<div class="form-group">
											<label for="name">Birthday</label>
											<input type="text" name="birthday" class="form-control" placeholder="Nhập ngày sinh">
										</div>
										<div class="form-group">
											<label for="name">Email</label>
											<input type="text" name="email" class="form-control" placeholder="Nhập mật khẩu">
										</div>
										<div class="form-group">
											<label>Thêm Avatar</label>
											<input type="file" name="picturePreview" class="btn btn-default" id="exampleInputFile1">
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
										<div class="form-group">
											<label for="name">Giới tính</label>
											<select class="form-control" name="sId">
											   <option value="">Chọn giới tính</option>
											   <c:forEach items="${listSex}" var="objSex">
											   <option value="${objSex.sId}">${objSex.sname}</option>
											   </c:forEach>
											</select>
										</div>
										
										<div class="form-group">
											<label for="name">Chức năng</label>
											
											<select class="form-control" name="roleId">
											   <option value="">Chọn chức năng</option>
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
										<input type="submit" value="Thêm" class="btn btn-success" />
										<input type="reset" value="Nhập lại" class="btn btn-default" />
									</div>
								</div>
								</form>	
							</div>
						</div>
			  		</div>
	  			</div><!-- /.row col-size -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tablib.jsp" %>
<div class="row">
				<form action="<%-- ${contextPath }/admin/cat/edit/${cid} --%>" method="POST">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Sửa danh mục</div>
			  			</div>
			  			<h5>${msg }</h5>
			  			<form:errors path="objCat.*" class="myErrors"></form:errors>
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên danh mục</label>
											<input type="text" name="cname" class="form-control" placeholder="${objCat.cname }" value="${objCat.cname }" >
										</div>
										<div class="form-group">
											<label for="name">Danh mục cha</label>
											<select class="form-control" name="scid">
											   <option value="">Chọn danh mục cha</option>
											   <option value="0">Không</option>
											   <c:forEach items="${listCat }" var="objCat">
											   <option value="${objCat.cid }">${objCat.cname }</option>
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
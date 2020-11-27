<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Sửa nội dung sách</div>
			  			</div>
			  			<form:errors path="objBook.*"></form:errors>
			  			
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								<h4>${msg }</h4>
								<c:if test="${not empty objBook }">
								<form action="" method="POST"  enctype="multipart/form-data" >
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên sách</label>
											<input type="text" name="name" class="form-control" placeholder="Nhập tên sách" value="${objBook.name }">
										</div>
										
										<div class="form-group">
											<label>Danh mục sách</label>
											<select class="form-control" name="cid">
											   
											   <option value="${cat.cid }">${cat.cname }</option>
											   <c:forEach items="${listCat }" var="objCat">
											   <option value="${objCat.cid }">${objCat.cname }</option>
											   </c:forEach>
											</select>
										</div>

										<div class="form-group">
											<label>Chọn hình ảnh</label>
											<input type="file" name="picturePreview" class="btn btn-default" id="exampleInputFile1">
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
										<div class="form-group">
											<label>Chọn hình ảnh mô tả 1</label>
											<input type="file" name="picturePreview1" class="btn btn-default" id="exampleInputFile1">
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
										<div class="form-group">
											<label>Chọn hình ảnh mô tả 2</label>
											<input type="file" name="picturePreview2" class="btn btn-default" id="exampleInputFile1">
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
										<div class="form-group">
										   <label>Mô tả</label>
										   <textarea class="form-control" rows="3" id="detail" name="detail">${objBook.detail }</textarea>
										</div>
										<div class="form-group">
											<label for="name">Gía</label>
											<input type="text" name="price" class="form-control" placeholder="Nhập giá" value="${objBook.price }">
										</div>
										<div class="form-group">
											<label for="name">Tác giả</label>
											<input type="text" name="author" class="form-control" placeholder="Nhập tác giả" value="${objBook.author }">
										</div>
										<div class="form-group">
											<label for="name">Số lượng</label>
											<input type="text" name="amount" class="form-control" placeholder="Nhập số lượng sách bán"  value="${objBook.amount }">
										</div>
									</div>
									
									<div class="col-sm-6"></div>

									 <!-- <div class="col-sm-12">
										<div class="form-group">
										   <label>Chi tiết</label>
										   <textarea class="form-control" rows="7" name=""></textarea>
										</div>
									</div>  -->
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
			  		</c:if>
	  			</div><!-- /.row col-size -->
<script>
    var editor = CKEDITOR.replace('detail');
    
</script>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    <security:authentication property="principal" var="principal" />
	<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý người dùng</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${contextPath }/admin/user/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
                	<div class="col-md-4">
                 	 
                  	</div>
				</div>

				<div class="row">
				<div><p>${msg }</p></div>
  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width="10%">ID</th>
								<th >Tên đăng nhập</th>
								<th >Họ tên</th>
								<th>Avatar</th>
								<th>Email</th>
								<th>Birthday</th>
								<th>Tình hình khóa</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty listUser }">
						<c:forEach items="${listUser }" var="objUser">
							<c:set var="urlEdit" value="${contextPath }/admin/user/edit/${objUser.id }/${page }"></c:set>
							<c:set var="urlDel" value="${contextPath }/admin/user/del/${objUser.id }"></c:set>
							<tr class="odd gradeX">
								<td>${objUser.id }</td>
								<td >${objUser.username }</td>
								<td >${objUser.fullname }</td>
								<td class="center text-center">
								<c:choose>
								<c:when test="${not empty objUser.avatar }">
									<img class="picture_land" src="${pageContext.request.contextPath }/fileUpload/${objUser.avatar}" />
								</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${objUser.sex.sname eq 'Nam' }">
												<img class="picture_land" src="${pageContext.request.contextPath }/resources/admin/images/avna.jpg" />
											</c:when>
											<c:otherwise>
												<img class="picture_land" src="${pageContext.request.contextPath }/resources/admin/images/avnu.jpg" />
											</c:otherwise>
										</c:choose>
										
									</c:otherwise>
									</c:choose>
								</td>
								<td>${objUser.email }</td>
								<td>${objUser.birthday }</td>
								
								<td class="center">
										<span id="actice-${objUser.id }" >
										<c:if test="${principal.username eq 'admin' }">
                                              <a href="javascript:void(0)" onclick="active(${objUser.id},${objUser.active});">
                                          </c:if>
                                          <c:if test="${objUser.username ne 'admin' }">
                                              <c:choose>
												<c:when test="${objUser.active == 1 }">
													
													<img src="${contextPath}/resources/admin/images/ac.png" alt="" />
												</c:when>
													<c:otherwise>
														<img src="${contextPath}/resources/admin/images/de.png" alt="" />
													</c:otherwise>
											</c:choose>
											</c:if>
                                             </a> 
                                             </span>
                                             </td>   
										</td> 
								
								<%--  <c:choose>
					      		<c:when test="${principal.username eq 'admin' }">
					      			<td class="center text-center">
									<a href="${urlEdit }" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
                                    <a href="${urlDel }" title="Xóa" class="btn btn-danger" onclick="return confirm('Ban co muon xoa khong?')" ><span class="glyphicon glyphicon-trash" ></span> Xóa</a>
								</td>
					      		</c:when>
					      		<c:otherwise>
					      			
					      				<td class="center text-center">
					      				<c:if test="${principal.username eq objUser.username }">
											<a href="${urlEdit }" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
										</c:if>
										</td>
					      			
					      		</c:otherwise>
					      	</c:choose>  --%>
								<td class="center text-center">
									<a href="${urlEdit }" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
                                    <a href="${urlDel }" title="Xóa" class="btn btn-danger" onclick="return confirm('Ban co muon xoa khong?')" ><span class="glyphicon glyphicon-trash" ></span> Xóa</a>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						</tbody>
					</table>

					<!-- Pagination -->
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page >1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/admin/user/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					      </c:if>
					      <c:forEach begin="1" end="${sumPage }"  var="i">
					      	<c:set var="active" value="" />
					      	<c:choose>
					      		<c:when test="${i == page}">
					      			<c:set var="active" value="active" />
					      		</c:when>
					      		<c:otherwise>
					      			<c:set var="active" value="" />
					      		</c:otherwise>
					      	</c:choose>
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/user/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					      <li><a href="${pageContext.request.contextPath }/admin/user/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   </c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div>
  			
  			
<script type="text/javascript">
      function active(id,active)
      {
       var url ="${pageContext.request.contextPath }/admin/user/active";                    
       var tmp="#actice-"+id;
		console.log(id);
		console.log(active);
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
            	id : id    ,
            	active: active
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#actice-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>      
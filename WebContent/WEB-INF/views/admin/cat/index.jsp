<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
	<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý danh mục</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${contextPath }/admin/cat/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
                	<div class="col-md-4">
                 	 <div class="input-group form">
                 	 <form action="" method="post">
                       
                       <span class="input-group-btn">
                       <input type="text" class="form-control" placeholder="Search..." name="search">
                         <input class="btn btn-primary" type="submit" value="Search"></span>
                      </form>
                  	 </div>
                  	</div>
				</div>

				<div class="row">
				<div><p>${msg }</p></div>
  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width="10%">ID</th>
								<th width="60%">Tên</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						
						
						<tbody>
								<c:if test="${not empty listCatDad }">
									<c:forEach items="${listCatDad }" var="objCatDad">
										<c:set var="urlEdit" value="${contextPath }/admin/cat/edit/${objCatDad.cid }/${page }"></c:set>
										<c:set var="urlDel" value="${contextPath }/admin/cat/del/${objCatDad.cid }"></c:set>
									<tr class="odd gradeX">
										<td>${objCatDad.cid }</td>
										<td>${objCatDad.cname }

											<ul style="list-style: none">
												<c:forEach items="${catDAO.getCatY(objCatDad.cid) }" var="objCatY">
												<li>${objCatY.cname }<a
													href="${contextPath }/admin/cat/del/${objCatY.cid }"
													onclick="return confirm('Bạn có chắc chắn muốn xóa')"
													class="fa fa-trash-o">
													<img alt="" src="<%=request.getContextPath() %>/templates/admin/img/dedl.jpg" style="weight:15px; height:15px" />
													</a> 
													<a href="${contextPath }/admin/cat/edit/${objCatY.cid }/${page }" 
													 class="fa fa-pencil">
													<img alt="" src="<%=request.getContextPath() %>/templates/admin/img/edi.png" style="weight:20px; height:20px" />
													</a>
												<c:if test="${not empty catDAO.getCatY(objCatY.cid) }">
													<c:forEach items="${catDAO.getCatY(objCatY.cid) }" var="objCatY2">
														+<li>${objCatY2.cname }<a
															href="${contextPath }/admin/cat/del/${objCatY2.cid }"
															onclick="return confirm('Bạn có chắc chắn muốn xóa')"
															class="fa fa-trash-o">
															<img alt="" src="<%=request.getContextPath() %>/templates/admin/img/dedl.jpg" style="weight:15px; height:15px" />
															</a> 
															<a href="${contextPath }/admin/cat/edit/${objCatY2.cid }/${page }" 
															 class="fa fa-pencil">
															<img alt="" src="<%=request.getContextPath() %>/templates/admin/img/edi.png" style="weight:20px; height:20px" />
															</a>
														</li>
														</c:forEach>
												</c:if>
												</li>
												</c:forEach>
												
											</ul>
											
											</td>
										<td align="center"><a
											href="${urlEdit }"
											class="btn btn-primary">Sửa</a> 
											<a
											href="${urlDel }"
											onclick="return confirm('Bạn có chắc chắn muốn xóa')"
											class="btn btn-danger">Xóa</a></td>

									</tr>
									</c:forEach>
									</c:if>
								</tbody>
					</table>

					<!-- Pagination -->
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page>1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/admin/cat/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/cat/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					       <li><a href="${pageContext.request.contextPath }/admin/cat/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					  	</c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div>
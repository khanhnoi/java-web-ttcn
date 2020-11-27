<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
	<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Kết quả tìm kiếm</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">

					</div>
                	<div class="col-md-4">
                 	 <div class="input-group form">
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
						<c:if test="${not empty listCat }">
						<c:forEach items="${listCat }" var="objCat">
							<c:set var="urlEdit" value="${contextPath }/admin/cat/edit/${objCat.cid }/${page }"></c:set>
							<c:set var="urlDel" value="${contextPath }/admin/cat/del/${objCat.cid }"></c:set>
							<tr class="odd gradeX">
								<td>${objCat.cid }</td>
								<td >${objCat.cname }</td>
								
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    <security:authentication property="principal" var="principal" />
	<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Profile</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">

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
								<th>Quyền truy cập</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${user }" var="user">
							<c:set var="urlEdit" value="${contextPath }/admin/user/edit/${user.id }"></c:set>
							
							<tr class="odd gradeX">
								<td>${principal.id }</td>
								<td >${principal.username }</td>
								<td >${principal.fullname }</td>
								<td>${principal.role}</td>
								
					      			<td class="center text-center">
									<a href="${urlEdit }" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
								</td>
					      		
								
							</tr>
						</c:forEach>
						
						</tbody>
					</table>

					<!-- Pagination -->
					
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div>
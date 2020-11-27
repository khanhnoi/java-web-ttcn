<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal" var="principal" />
<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Kết quả tìm kiếm</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${contextPath }/admin/land/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
                	<div class="col-md-4">
                 	 <div class="input-group form">
                 	 
                  	 </div>
                  	</div>
				</div>

				<div class="row">
  				<div class="panel-body">
  				<h4>${msg }</h4>
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th>ID</th>
								<th width="30%">Tên</th>
								<th>Danh mục</th>
								<th>Gía(nghìn VNĐ)</th>
								<th>Tác giả</th>
								<th>Lượt đọc</th>
								<th>Hình ảnh</th>
								<th>Trạng thái</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listBook }" var="objBook">
							<c:set var="urlEdit" value="${contextPath }/admin/land/edit/${objBook.id }/${page }"></c:set>
							<c:set var="urlDel" value="${contextPath }/admin/land/del/${objBook.id }"></c:set>
							<tr class="odd gradeX">
								<td>${objBook.id }</td>
								<td>${objBook.name }</td>
								<td>${objBook.cat.cname }</td>
								<td>${objBook.price }</td>
								<td>${objBook.author }</td>
								<td>${objBook.view }</td>
								
								<td class="center text-center">
								<c:choose>
								<c:when test="${not empty objBook.picture }">
									<img class="picture_land" src="${pageContext.request.contextPath }/fileUpload/${objBook.picture}" />
								</c:when>
									<c:otherwise>
										<c:out value="Khong co hinh anh"></c:out>
									</c:otherwise>
									</c:choose>
								</td>
								<td class="center">
										<span id="actice-${objBook.id }" >
										<%-- c:if test="${principal.username eq 'admin' }">
                                              <a href="javascript:void(0)" onclick="active(${objLand.lid},${objLand.active});">
                                          </c:if>     --%>
                                              <c:choose>
												<c:when test="${objBook.active == 1}">
													<img src="${contextPath}/resources/admin/images/ac.png" alt="" />
												</c:when>
													<c:otherwise>
														<img src="${contextPath}/resources/admin/images/de.png" alt="" />
													</c:otherwise>
											</c:choose>
											
                                             </a> 
                                             </span>
                                             </td>   
										</td>
								<td class="center text-center">
									<a href="${urlEdit }" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa </a>
                                    <a href="${urlDel }" title="Xóa" onclick="return confirm('Ban co muon xoa khong?')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- Pagination -->
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page>1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/admin/book/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/book/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					       <li><a href="${pageContext.request.contextPath }/admin/book/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					  	</c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->
  			
  <!-- <script type="text/javascript">
      function active(lid,active)
      {
       var url ="${pageContext.request.contextPath }/admin/book/active";                    
       var tmp="#actice-"+lid;
		console.log(lid);
		console.log(active);
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
            	lid : lid    ,
            	active: active
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#actice-"+lid;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>       -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="content-box-large">
				<div>${msg }</div>
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Danh sách liên hệ</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						
						<a href="${contextPath }/admin/contact/delAll" title="Xóa"  onclick="return confirm('Bạn có chắc chắn muốn xóa các liên hệ đã chọn')" class="btn btn-success">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Xóa các liên hệ đã duyệt</a>
					</div>
                	<div class="col-md-4">
                 	 <!-- <div class="input-group form">
                       <input type="text" class="form-control" placeholder="Search...">
                       <span class="input-group-btn">
                         <button class="btn btn-primary" type="button">Search</button>
                       </span>
                  	 </div> -->
                  	</div>
				</div>

				<div class="row">
  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width="5%">ID</th>
								<th width="10%">Tên người gửi</th>
								<th width="15%">Email</th>
								<th>Phone</th>
								<th>Địa chỉ</th>
								<th width="30%">Nội dung</th>
								<th>Trạng thái</th>
								<th width="15%">Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty listContact }">
						<c:forEach items="${listContact }" var="objContact">
							<c:set var="urlEdit" value="${contextPath }/admin/contact/edit/${objContact.id }/${page }"></c:set>
							<c:set var="urlDel" value="${contextPath }/admin/contact/del/${objContact.id }"></c:set>
							<tr class="odd gradeX">
								<td>${objContact.id }</td>
								<td>${objContact.name }</td>
								<td>${objContact.email}</td>
								<td>${objContact.phone }</td>
								<td>${objContact.address }</td>
								<td class="center">${objContact.content }</td>
								<td class="center">
										<span id="actice-${objContact.id }" >
                                              <a href="javascript:void(0)" onclick="active(${objContact.id},${objContact.active});">
                                              <c:choose>
												<c:when test="${objContact.active == 1}">
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
                                    <a href="${urlDel }" title="Xóa"  onclick="return confirm('Ban co muon xoa khong?')" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash"></span> Xóa</a>
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
					      <li class="disabled"><a href="${pageContext.request.contextPath }/admin/contact/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/contact/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<(sumPage-1) }">
					       <li><a href="${pageContext.request.contextPath }/admin/contact/${page +1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					   </c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large --> 
  			
<script type="text/javascript">
      function active(id,active)
      {
       var url ="${pageContext.request.contextPath }/admin/contact/active";                    
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
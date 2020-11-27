<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal" var="principal" />
<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý đơn hàng</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${contextPath }/admin/cart/delAll" title="Xóa"  onclick="return confirm('Bạn có chắc chắn muốn xóa các đơn đã chọn')" class="btn btn-success">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Xóa</a>
					</div>
                	
				</div>
				
				<div class="row">
  				<div class="panel-body">
  				<h4>${msg }</h4>
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th>ID Bill</th>
								<th width="30%">Họ tên</th>
								<th>Phone</th>
								<th>Địa chỉ</th>
								<th>Hình thức thanh toán</th>
								
								<th>Tình trạng giao hàng</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listOrder }" var="objOrder">
							<c:set var="urlView" value="${contextPath }/admin/cart/view/${objOrder.order_id }"></c:set>
							<c:set var="urlDel" value="${contextPath }/admin/cart/del/${objOrder.order_id }"></c:set>
							<tr class="odd gradeX">
								<td>${objOrder.order_id }</td>
								<td>${objOrder.name }</td>
								<td>${objOrder.phone }</td>
								<td>${objOrder.address }</td>
								<td>${objOrder.payments }</td>
								<%-- <td>${cartOrderDAO.getItem(objOrder.order_id).quantity * bookDAO.getItemsPr(cartOrderDAO.getItem(objOrder.order_id).pro_id).price}</td> --%>
								
								
								<td class="center">
										<span id="actice-${objOrder.order_id }" >
										 
										<c:if test="${account.username eq 'admin' }">  
                                              <a href="javascript:void(0)" onclick="active(${objOrder.order_id},${objOrder.checked});">
                                              </c:if>
                                              <c:choose>
												<c:when test="${objOrder.checked == 1}">
													<img src="${contextPath}/resources/admin/images/ac.png" alt="" />
												</c:when>
													<c:otherwise>
														<img src="${contextPath}/resources/admin/images/de.png" alt="" />
													</c:otherwise>
											</c:choose>
											
                                             </a> 
                                             </span>
                                             </td>   
										
								
								<td class="center text-center">
									<a href="${urlView }" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Xem </a>
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
					      <li class=""><a href="${pageContext.request.contextPath }/admin/cart/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/cart/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					       <li><a href="${pageContext.request.contextPath }/admin/cart/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					  	</c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->
  			
  <script type="text/javascript">
      function active(order_id,checked)
      {
       var url ="${pageContext.request.contextPath }/admin/cart/active";                    
       var tmp="#actice-"+order_id;
		console.log(order_id);
		console.log(checked);
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
      			order_id : order_id    ,
      			checked: checked
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#actice-"+order_id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>       
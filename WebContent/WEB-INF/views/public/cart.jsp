<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
 
  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
   <img src="${contextPath }/resources/public/img/dd.jpg" alt="fashion img" style="width: 1920px; height: 300px;">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Cart Page</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>                   
          <li class="active">Giỏ hàng</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 
 <section id="cart-view">
   <div class="container">
   <h6>${msg }</h6>
     <div class="row">
       <div class="col-md-12">
         <div class="cart-view-area">
           <div class="cart-view-table">
             <form action="${contextPath }/cart/upCart" method="post">
               <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th></th>
                        <th></th>
                        <th>Sản phẩm</th>
                        <th>Gía</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sessionScope.myCartItems }" var="objCart">
                     <span id="acticeRemove-${objCart.value.book.id}" >
                      <tr>
                       
                        <td>
                        <a class="remove" href="${pageContext.request.contextPath }/cart/remove/${objCart.value.book.id}" onclick="return confirm('Ban co muon xoa sản phẩm này?')" >
                        <fa class="fa fa-close"></fa></a></td>
                         
                         <c:url var="urlDetail"
						value="/chi-tiet/${StringUtils.makeSlug(objCart.value.book.name)}-${objCart.value.book.id}.html"></c:url>
                        <td><a href="${urlDetail }"><img src="${contextPath }/fileUpload/${objCart.value.book.picture}" alt="img"></a></td>
                        
                        <td><a class="aa-cart-title" href="${urlDetail }">${objCart.value.book.name }</a></td>
                        <td>${objCart.value.book.price } VNĐ</td>
                         <%-- <span id="acticeQ-${objCart.value.book.id}" > --%>
                         <td>
                         
                         <%-- <a href="javascript:void(0)" onclick="activeQ(${objCart.value.book.id},${objCart.value.quantity });"> --%>
                         <input class="aa-cart-quantity" type="number" name="quantity" value="${objCart.value.quantity }" >
                        
                         
                         </td>
                         
                        
                        <td>${objCart.value.quantity * objCart.value.book.price } VNĐ</td>
                        </span>
                      </tr>
                     
                      </c:forEach>
                      <tr>
                        <td colspan="6" class="aa-cart-view-bottom">
                          
                          <input class="aa-cart-view-btn" type="submit" value="Update Cart">
                        </td>
                      </tr>
                      </tbody>
                  </table>
                </div>
             </form>
             <!-- Cart Total view -->
             <div class="cart-view-total">
               <h4>Cart Totals</h4>
               <table class="aa-totals-table">
                 <tbody>
                   <!-- <tr>
                     <th>Subtotal</th>
                     <td>$450</td>
                   </tr> -->
                   <tr>
                     <th>Tổng</th>
                     <td>${sessionScope.myCartTotal } VNĐ</td>
                   </tr>
                 </tbody>
               </table>
               <a href="${pageContext.request.contextPath }/checkout" class="aa-cart-view-btn">Proced to Checkout</a>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>
 <!-- / Cart view section -->


  <!-- Subscribe section -->
 <script type="text/javascript">
      function activeQ(id,quantity)
      {
       var url ="${pageContext.request.contextPath }/updateQuantity";                    
       var tmp="#acticeQ-"+id;
		console.log(id);
		console.log(quantity)
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
      			id : id    ,
            	quantity : quantity
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#acticeQ-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
   <script type="text/javascript">
      function activeRemove(productId)
      {
       var url ="${pageContext.request.contextPath }/cart/removeActive2";                    
       var tmp="#acticeRemove-"+productId;
		console.log(productId);
		
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
      			productId :  productId  ,
            	
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#acticeRemove-"+productId;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
   
   <script type="text/javascript">
      function activeQ(productId,quantity)
      {
       var url ="${pageContext.request.contextPath }/cart/updateQuantity";                    
       var tmp="#acticeQ-"+productId;
		console.log(productId);
		console.log(quantity);
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
      			productId :  productId  ,
      			quantity : quantity
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#acticeQ-"+productId;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
  
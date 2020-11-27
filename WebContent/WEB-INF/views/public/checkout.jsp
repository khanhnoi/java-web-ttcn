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
        <h2>Checkout Page</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>                   
          <li class="active">Checkout</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="checkout">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="checkout-area">
          <form action="${pageContext.request.contextPath }/checkout/deliver" method="post">
            <div class="row">
              <div class="col-md-8">
                <div class="checkout-left">
                  <div class="panel-group" id="accordion">
                    <!-- Coupon section -->
                    <form:errors path="objOrder.*" class="myError" ></form:errors>
              		<h6 class="myError">${msg }</h6>
                    <!-- Shipping Address -->
                    <div class="panel panel-default aa-checkout-billaddress">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                            Shippping Address
                          </a>
                        </h4>
                      </div>
                      
                      <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="Name" name="name">
                              </div>                             
                            </div>                            
                          </div>  
                          <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="Address" name="address">
                              </div>                             
                            </div>                            
                          </div>  
                          <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                                <input type="text" placeholder="Phone" name="phone">
                              </div>                             
                            </div>                            
                          </div>  
                           <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                                <textarea cols="8" rows="3" name="status">Status</textarea>
                              </div>                             
                            </div>                            
                          </div> 
                                      
                        </div>
                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="checkout-right">
                  <h4>Order Summary</h4>
                  <div class="aa-order-summary-area">
                    <table class="table table-responsive">
                      <thead>
                        <tr>
                          <th>Product</th>
                          <th>Total</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${sessionScope.myCartItems }" var="objCart">
                        <tr>
                          <td>${objCart.value.book.name } <strong> x  ${objCart.value.quantity }</strong></td>
                          <td>$${objCart.value.book.price }</td>
                        </tr>
                       </c:forEach> 
                      </tbody>
                      <tfoot>
                        
                         <tr>
                          <th>Total</th>
                          <td id="total">${sessionScope.myCartTotal }</td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <h4>Payment Method</h4>
                  <div class="aa-payment-method">                    
                    
    					 <label> <input type="radio" name="payId" value="2" checked onclick="return confirm('Chọn biểu tượng thẻ muốn thanh toán!')"> 
    					Thanh toán Paypal</label> 
    					 <label> <input type="radio" name="payId" value="1" > 
    					 Giao hàng tại nhà </label> 
    					 <div id="paypal-button-container"></div> <div id="alternate-button-container"> 
    					 </div>

    				<!-- Include the PayPal JavaScript SDK -->
					    <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>
					
					    <script>
					        // Render the PayPal button into #paypal-button-container
					        paypal.Buttons({
								
					            // Set up the transaction
					            createOrder: function(data, actions) {
					            	 var sum = document.getElementById('total').innerText; 
					            	
					                return actions.order.create({
					                    purchase_units: [{
					                        amount: {
					                            value: sum, 
					                        }
					                    }],
					                redirect_urls : {
										return_url : '${contextPath}/',
										cancel_url : '${contextPath}/checkout?msg=error'
									}
					                });
					            },
					
					            // Finalize the transaction
					            onApprove: function(data, actions) {
					                return actions.order.capture().then(function(details) {
					                    // Show a success message to the buyer
					                    alert('Thanh toán thành công!');
					                    actions.redirect();
					                });
					            },
					            

								onCancel : function(data, actions) {
									 return actions.order.capture().then(function(details) {
						                    // Show a success message to the buyer
						                    alert('Thanh toán thất bại!');
						                    actions.redirect();
						                });
								}
					
					        }).render('#paypal-button-container');
					     // Listen for changes to the radio buttons 
					     document.querySelectorAll('input[name=payId]') .forEach(function (el) { el.addEventListener('change', function (event) { 
					    	 // If PayPal is selected, show the PayPal button 
					    	 if (event.target.value === '2') { document.body.querySelector('#alternate-button-container') .style.display = 'none'; document.body.querySelector('#paypal-button-container') .style.display = 'block'; } 
					    	 // If alternate funding is selected, show a different button 
					    	 if (event.target.value === '1') { document.body.querySelector('#alternate-button-container') .style.display = 'block'; document.body.querySelector('#paypal-button-container') .style.display = 'none'; } }); }); 
					     // Hide non-PayPal button by default 
					     document.body.querySelector('#alternate-button-container') .style.display = 'none';
					    </script>
					   
                    <input type="submit" value="Đặt hàng" class="aa-browse-btn" onclick="return confirm('Đơn hàng đang được xử lý. Bạn muốn tiếp tục mua hàng?')" >                
                  </div>
                </div>
              </div>
            </div>
          </form>
         </div>
       </div>
       
     </div>
   </div>
 </section>
 <!-- / Cart view section -->

  <!-- footer -->  
  
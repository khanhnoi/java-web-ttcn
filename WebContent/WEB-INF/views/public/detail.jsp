<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@page import="vn.edu.vinaenter.utils.StringUtils"%>
 <%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<section id="aa-catg-head-banner">
   <img src="${contextPath }/resources/public/img/dd.jpg" alt="fashion img" style="width: 1920px; height: 300px;">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>T-Shirt</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>         
          <li><a href="${pageContext.request.contextPath}/all">Product</a></li>
          <li class="active"><a href="${pageContext.request.contextPath}/danh-muc/${cat.cname}-${cat.cid}.html">${cat.cname }</a></li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

  <!-- product category -->
  <section id="aa-product-details">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-product-details-area">
            <div class="aa-product-details-content">
              <div class="row">
                <!-- Modal view slider -->
                <div class="col-md-5 col-sm-5 col-xs-12">                              
                  <div class="aa-product-view-slider">                                
                    <div id="demo-1" class="simpleLens-gallery-container">
                      <div class="simpleLens-container">
                        <div class="simpleLens-big-image-container"><a data-lens-image="${contextPath }/fileUpload/${obj.picture}" class="simpleLens-lens-image">
                        <img src="${contextPath }/fileUpload/${obj.picture}" class="simpleLens-big-image" style="width: 250px; height: 300px;"></a></div>
                      </div>
                      <div class="simpleLens-thumbnails-container">
                          <a data-big-image="${contextPath }/fileUpload/${obj.picture}" data-lens-image="${contextPath }/fileUpload/${obj.picture}" class="simpleLens-thumbnail-wrapper" href="#">
                            <img src="${contextPath }/fileUpload/${obj.picture}" style="width: 100px; height: 100px;">
                          </a>                                    
                          <a data-big-image="${contextPath }/fileUpload/${obj.detailpicture1}" data-lens-image="${contextPath }/fileUpload/${obj.detailpicture1}" class="simpleLens-thumbnail-wrapper" href="#">
                            <img src="${contextPath }/fileUpload/${obj.detailpicture1}" style="width: 100px; height: 100px;">
                          </a>
                          <a data-big-image="${contextPath }/fileUpload/${obj.detailpicture2}" data-lens-image="${contextPath }/fileUpload/${obj.detailpicture2}" class="simpleLens-thumbnail-wrapper" href="#">
                            <img src="${contextPath }/fileUpload/${obj.detailpicture2}" style="width: 100px; height: 100px;">
                          </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Modal view content -->
                <c:url var="urlAdds" value="/cart/adds/${obj.id }"></c:url>
                <form action="${urlAdds }">
                <div class="col-md-7 col-sm-7 col-xs-12">
                  <div class="aa-product-view-content">
                    <h3>${obj.name }</h3>
                    <div class="aa-price-block">
                      <span class="aa-product-view-price">${obj.price } VNĐ</span>
                      <p class="aa-product-avilability">Tác giả: <span>${obj.author }</span></p>
                      <p>Còn: ${obj.amount } cuốn </p>
                    </div>
                    <p>${fn:substring(obj.detail,0,150) }...</p>
                    
                    <div class="aa-prod-quantity">
                    <c:if test="${not empty msg}">
                       <div class="alert alert-danger">
			                		<strong>${msg}</strong>
			                	</div>
			                	</c:if>
                      <input class="aa-cart-quantity" type="number" value="1" name="quantity">
                      
                      <!-- <select id="" name="quantity">
                      	
                          <option selected="1" value="1">1</option>
                          <option value="1">2</option>
                          <option value="2">3</option>
                          <option value="3">4</option>
                          <option value="4">5</option>
                          <option value="5">6</option>
                        </select> -->
                      <p class="aa-prod-category">
                        Danh mục: <a href="${pageContext.request.contextPath}/danh-muc/${cat.cname}-${cat.cid}.html">${cat.cname }</a>
                      </p>
                    </div>
                    <div class="aa-your-rating">
                     
                      <span id="actice-${obj.id}" >
                        <a href="javascript:void(0)" onclick="active(${obj.id});" data-toggle="tooltip" data-placement="top" title="Add to Wishlist">
                        <span class="fa fa-heart-o">${obj.love }</span></a>
                       </span>
                       <span></span>
                       <span id="acticeDL-${obj.id}" >
                       <span id="acticeL-${obj.id}" >
                        <a href="javascript:void(0)" onclick="activeL(${obj.id});" data-toggle="tooltip" data-placement="top" title="Compare">
                        <span class="fa fa-exchange">${obj.likes }</span></a>
                        </span>
                        
                        
                        <a href="javascript:void(0)" onclick="activeDL(${obj.id});" data-toggle2="tooltip" data-placement="top" >
                        <span class="fa fa-search"></span></a>    
                        </span>                       
                     
                   </div>
                    <div class="aa-prod-view-bottom">
                      <%-- <a class="aa-add-to-cart-btn" href="${contextPath }/cart/adds/${obj.id}">Add To Cart</a> --%>
                       <input class="aa-add-to-cart-btn" type="submit" value="Thêm vào giỏ hàng">
                      
                    </div>
                  </div>
                </div>
                </form>
              </div>
            </div>
            <div class="aa-product-details-bottom">
              <ul class="nav nav-tabs" id="myTab2">
                <li><a href="#description" data-toggle="tab">Description</a></li>
                <li><a href="#review" data-toggle="tab">Reviews</a></li>                
              </ul>

              <!-- Tab panes -->
              <div class="tab-content">
                <div class="tab-pane fade in active" id="description">
                  <p>${obj.detail }</p>
                  
                </div>
                <div class="tab-pane fade " id="review">
                <span id="acticeCmt-${obj.id}" >
                 <div class="aa-product-review-area">
                 
                   <h4>${cmtDAO.getItem(obj.id).size() } Reviews for ${obj.name }</h4>
                   <c:if test="${not empty listCmt }"> 
                   <ul class="aa-review-nav">
                   <c:forEach items="${listCmt }" var="objCmt">
                     <li>
                        <div class="media">
                          <div class="media-left">
                            <a href="#">
                            <c:choose>
                            	<c:when test="${objCmt.cmt_name eq 'admin' }">
                            		<img class="media-object" src="${contextPath }/resources/public/img/avt.jpg" alt="admin image">
                            	</c:when>
                            	<c:otherwise>
									   <img class="media-object" src="${contextPath }/resources/public/img/avtsm.png" alt="girl image">                         	
                            	</c:otherwise>
                            </c:choose>
                              
                            </a>
                          </div>
                          <div class="media-body">
                            <h4 class="media-heading"><strong>${objCmt.cmt_name}</strong></h4>
                            <div class="aa-product-rating">
                              
                            </div>
                            <p>${objCmt.content}.</p>
                          </div>
                        </div>
                      </li>
                      </c:forEach>
                   </ul>
                   </c:if>
                   <h4>Add a review</h4>
                   
                   <!-- review form -->
                   <form:errors path="obj.*" class="myErrors" ></form:errors>
                   <form action="" class="aa-review-form" method="post">
                      
                      <div class="form-group">
                        <label for="message">Your Review</label>
                        <textarea class="form-control" rows="3" id="content" name="content"></textarea>
                      </div>
                      <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Name" name="cmt_name">
                      </div>  
                      <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="example@gmail.com" name="email">
                      </div>
					<a href="javascript:void(0)" onclick="activeCmt(${obj.id},${obj.name});" >
					<button type="submit" class="btn btn-default aa-review-submit">Submit</button>
                      </a>
                   </form>
                 </div>
                 </span>
                </div>            
              </div>
            </div>
            <!-- Related product -->
            <div class="aa-product-related-item">
              <h3>Related Products</h3>
              <c:if test="${not empty listRelated }">
              <ul class="aa-product-catg aa-related-item-slider">
                <!-- start single product item -->
                <c:forEach items="${listRelated }" var="objRelated">
                <li>
                  <figure>
                    <a class="aa-product-img" href="#">
                    <img src="${contextPath }/fileUpload/${objRelated.picture}" alt="polo shirt img" style="width: 250px; height: 300px;"></a>
                    <a class="aa-add-card-btn"href="${contextPath }/cart/add/${objRelated.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                     <figcaption>
                      <c:url var="urlDetailRL"
						value="/chi-tiet/${StringUtils.makeSlug(objRelated.name)}-${objRelated.id}.html"></c:url>
                      <h4 class="aa-product-title"><a href="${urlDetailRL }">${objRelated.name }</a></h4>
                      <span class="aa-product-price">$${objRelated.price }</span>
                    </figcaption>
                  </figure>                     
                  <div class="aa-product-hvr-content">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                  </div>
                  <!-- product badge -->
                  
                </li>
                </c:forEach>
                                                                                        
              </ul>
              </c:if>
              <!-- quick view modal -->                  
              <div class="modal fade" id="quick-view-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">                      
                    <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <div class="row">
                        <!-- Modal view slider -->
                        <div class="col-md-6 col-sm-6 col-xs-12">                              
                          <div class="aa-product-view-slider">                                
                            <div class="simpleLens-gallery-container" id="demo-1">
                              <div class="simpleLens-container">
                                  <div class="simpleLens-big-image-container">
                                      <a class="simpleLens-lens-image" data-lens-image="img/view-slider/large/polo-shirt-1.png">
                                          <img src="img/view-slider/medium/polo-shirt-1.png" class="simpleLens-big-image">
                                      </a>
                                  </div>
                              </div>
                              <div class="simpleLens-thumbnails-container">
                                  <a href="#" class="simpleLens-thumbnail-wrapper"
                                     data-lens-image="img/view-slider/large/polo-shirt-1.png"
                                     data-big-image="img/view-slider/medium/polo-shirt-1.png">
                                      <img src="img/view-slider/thumbnail/polo-shirt-1.png">
                                  </a>                                    
                                  <a href="#" class="simpleLens-thumbnail-wrapper"
                                     data-lens-image="img/view-slider/large/polo-shirt-3.png"
                                     data-big-image="img/view-slider/medium/polo-shirt-3.png">
                                      <img src="img/view-slider/thumbnail/polo-shirt-3.png">
                                  </a>

                                  <a href="#" class="simpleLens-thumbnail-wrapper"
                                     data-lens-image="img/view-slider/large/polo-shirt-4.png"
                                     data-big-image="img/view-slider/medium/polo-shirt-4.png">
                                      <img src="img/view-slider/thumbnail/polo-shirt-4.png">
                                  </a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Modal view content -->
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="aa-product-view-content">
                            <h3>T-Shirt</h3>
                            <div class="aa-price-block">
                              <span class="aa-product-view-price">$34.99</span>
                              <p class="aa-product-avilability">Avilability: <span>In stock</span></p>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!</p>
                            <h4>Size</h4>
                            <div class="aa-prod-view-size">
                              <a href="#">S</a>
                              <a href="#">M</a>
                              <a href="#">L</a>
                              <a href="#">XL</a>
                            </div>
                            <div class="aa-prod-quantity">
                              <form action="">
                                <select name="" id="">
                                  <option value="0" selected="1">1</option>
                                  <option value="1">2</option>
                                  <option value="2">3</option>
                                  <option value="3">4</option>
                                  <option value="4">5</option>
                                  <option value="5">6</option>
                                </select>
                              </form>
                              <p class="aa-prod-category">
                                Category: <a href="#">Polo T-Shirt</a>
                              </p>
                            </div>
                            <div class="aa-prod-view-bottom">
                              <a href="#" class="aa-add-to-cart-btn"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                              <a href="#" class="aa-add-to-cart-btn">View Details</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>                        
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>
              <!-- / quick view modal -->   
            </div>  
          </div>
        </div>
      </div>
    </div>
  </section>
  
<script type="text/javascript">
      function active(id)
      {
       var url ="${pageContext.request.contextPath }/increLove";                    
       var tmp="#actice-"+id;
		console.log(id);
		
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
            	id : id    ,
            	
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
   
   <script type="text/javascript">
      function activeL(id)
      {
       var url ="${pageContext.request.contextPath }/increLike";                    
       var tmp="#acticeL-"+id;
		console.log(id);
		
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
            	id : id    ,
            	
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#acticeL-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
   
  <script type="text/javascript">
      function activeDL(id)
      {
       var url ="${pageContext.request.contextPath }/increDLike";                    
       var tmp="#acticeDL-"+id;
		console.log(id);
		
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
            	id : id    ,
            	
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#acticeDL-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
 <script type="text/javascript">
      function activeCmt(id,name)
      {
       var url ="${pageContext.request.contextPath }/chi-tiet/"+name+"-"+id+".html";                    
       var tmp="#acticeCmt-"+id;
		console.log(id);
		console.log(name);
    	$.ajax({
      		url:url,
      		type: 'POST',
      	    cache: false,
//       dataType: "html",
      		data: {
            	id : id    ,
            	name: name
     	 },
   		success: function(data) {
   			console.log(data);
        	tmp="#acticeCmt-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
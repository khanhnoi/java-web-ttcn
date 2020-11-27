<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@page import="vn.edu.vinaenter.utils.StringUtils"%>

<body>

<section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq">
        <div class="seq-screen">
          <ul class="seq-canvas">
          
           
            <!-- single slide item -->
            
            <!-- single slide item -->  
             <li>
              <div class="seq-model">
                <img data-seq src="${contextPath }/resources/public/img/dd.jpg" alt="Male Female slide img" style="width: 1920px; height: 700px;" />
              </div>
              <div class="seq-title">
                
                <a data-seq href="${pageContext.request.contextPath}/all" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
               <li>
              <div class="seq-model">
                <img data-seq src="${contextPath }/resources/public/img/lodoc2.jpg" alt="Male Female slide img"  />
              </div>
              <div class="seq-title">
                
                <a data-seq href="${pageContext.request.contextPath}/all" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>   
            </li>
               <li>
              <div class="seq-model">
                <img data-seq src="${contextPath }/resources/public/img/lodoc3.jpg" alt="Male Female slide img"  />
              </div>
              <div class="seq-title">
                
                <a data-seq href="${pageContext.request.contextPath}/all" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>           
          </ul>
        </div>
        <!-- slider navigation btn -->
        <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
          <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
          <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
        </fieldset>
      </div>
    </div>
  </section>
  <!-- / slider -->
  
  <!-- Products section -->
  
  <!-- / Products section -->
  <!-- banner section -->
  <section id="aa-banner">
    <div class="container">
      
    </div>
  </section>
  <!-- popular section -->
  <section id="aa-popular-category">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-popular-category-area">
              <!-- start prduct navigation -->
             <ul class="nav nav-tabs aa-products-tab">
                <li class="active"><a href="#popular" data-toggle="tab">Popular</a></li>
                <li><a href="#featured" data-toggle="tab">Featured</a></li>
                <li><a href="#latest" data-toggle="tab">Latest</a></li>                    
              </ul>
              <!-- Tab panes -->
              <div class="tab-content">
                <!-- Start men popular category -->
                <div class="tab-pane fade in active" id="popular">
                <c:if test="${not empty listPopular}">
                  <ul class="aa-product-catg aa-popular-slider">
                    <!-- start single product item -->
                    <c:forEach items="${listPopular}" var="objPopular">
                    <li>
                      <figure>
                        <a class="aa-product-img" href="#"><img src="${contextPath }/fileUpload/${objPopular.picture }" alt="polo shirt img" style="width: 250px; height: 300px;" ></a>
                        <a class="aa-add-card-btn"href="${contextPath }/cart/add/${objPopular.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                         <figcaption>
                         <c:url var="urlDetailPP"
						value="/chi-tiet/${StringUtils.makeSlug(objPopular.name)}-${objPopular.id}.html"></c:url>
                          <h4 class="aa-product-title"><a href="${urlDetailPP }">${objPopular.name }</a></h4>
                          <span class="aa-product-price">${objPopular.price }</span>
                        </figcaption>
                      </figure>                     
                      <div class="aa-product-hvr-content">
                      
                      <span id="actice-${objPopular.id}" >
                        <a href="javascript:void(0)" onclick="active(${objPopular.id});" data-toggle="tooltip" data-placement="top" title="Add to Wishlist">
                        <span class="fa fa-heart-o">${objPopular.love }</span></a>
                       </span>
                       <span id="acticeDL-${objPopular.id}" >
                       <span id="acticeL-${objPopular.id}" >
                        <a href="javascript:void(0)" onclick="activeL(${objPopular.id});" data-toggle="tooltip" data-placement="top" title="Compare">
                        <span class="fa fa-exchange">${objPopular.likes }</span></a>
                        </span>
                        
                        
                        <a href="javascript:void(0)" onclick="activeDL(${objPopular.id});" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal">
                        <span class="fa fa-search"></span></a>    
                        </span>                        
                      </div>
                      <!-- product badge -->
                      <span class="aa-badge aa-hot" href="#">HOT!</span>
                    </li>
                     </c:forEach>
                                                                                              
                  </ul>
                  </c:if>
                  <a class="aa-browse-btn" href="${pageContext.request.contextPath}/all">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                </div>
                <!-- / popular product category -->
                
                <!-- start featured product category -->
                <div class="tab-pane fade" id="featured">
                <c:if test="${not empty listFeatured }">
                 <ul class="aa-product-catg aa-featured-slider">
                    <!-- start single product item -->
                    <c:forEach items="${listFeatured }" var="objFeatured">
                    <li>
                      <figure>
                        <a class="aa-product-img" href="#"><img src="${contextPath }/fileUpload/${objFeatured.picture}" alt="polo shirt img" style="width: 250px; height: 300px;"></a>
                        <a class="aa-add-card-btn" href="${contextPath }/cart/add/${objFeatured.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                         <figcaption>
                         <c:url var="urlDetailF"
						value="/chi-tiet/${StringUtils.makeSlug(objFeatured.name)}-${objFeatured.id}.html"></c:url>
                          <h4 class="aa-product-title"><a href="${urlDetailF }">${objFeatured.name }</a></h4>
                          <span class="aa-product-price">${objFeatured.price }</span>
                        </figcaption>
                      </figure>                     
                      <div class="aa-product-hvr-content">
                        <span id="actice-${objFeatured.id}" >
                        <a href="javascript:void(0)" onclick="active(${objFeatured.id});" data-toggle="tooltip" data-placement="top" title="Add to Wishlist">
                        <span class="fa fa-heart-o">${objFeatured.love }</span></a>
                       </span>
                       <span id="acticeDL-${objFeatured.id}" >
                       <span id="acticeL-${objFeatured.id}" >
                        <a href="javascript:void(0)" onclick="activeL(${objFeatured.id});" data-toggle="tooltip" data-placement="top" title="Compare">
                        <span class="fa fa-exchange">${objFeatured.likes }</span></a>
                        </span>
                        
                        
                        <a href="javascript:void(0)" onclick="activeDL(${objFeatured.id});" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal">
                        <span class="fa fa-search"></span></a>    
                        </span>        
                      </div>
                      <!-- product badge -->
                      
                    </li>
                      </c:forEach>                                                                  
                  </ul>
                  </c:if>
                  <a class="aa-browse-btn" href="${pageContext.request.contextPath}/all">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                </div>
                <!-- / featured product category -->

                <!-- start latest product category -->
                <div class="tab-pane fade" id="latest">
                <c:if test="${not empty listNew }">
                  <ul class="aa-product-catg aa-latest-slider">
                    <!-- start single product item -->
                    <c:forEach items="${listNew }" var="objNew">
                    <li>
                      <figure>
                        <a class="aa-product-img" href="#"><img src="${contextPath }/fileUpload/${objNew.picture}" alt="polo shirt img" style="width: 250px; height: 300px;"></a>
                        <a class="aa-add-card-btn"href="${contextPath }/cart/add/${objNew.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                         <figcaption>
                         <c:url var="urlDetailN"
						value="/chi-tiet/${StringUtils.makeSlug(objNew.name)}-${objNew.id}.html"></c:url>
                          <h4 class="aa-product-title"><a href="${urlDetailN }">${objNew.name }</a></h4>
                          <span class="aa-product-price">${objNew.price } VNĐ</span>
                        </figcaption>
                      </figure>                     
                      <div class="aa-product-hvr-content">
                      
                        <span id="acticeN-${objNew.id}" >
                        <a href="javascript:void(0)" onclick="activeN(${objNew.id});" data-toggle="tooltip" data-placement="top" title="Add to Wishlist">
                        <span class="fa fa-heart-o">${objNew.love }</span></a>
                       </span>
                       <span id="acticeDLN-${objNew.id}" >
                       <span id="acticeLN-${objNew.id}" >
                        <a href="javascript:void(0)" onclick="activeLN(${objNew.id});" data-toggle="tooltip" data-placement="top" title="Compare">
                        <span class="fa fa-exchange">${objNew.likes }</span></a>
                        </span>
                        
                        
                        <a href="javascript:void(0)" onclick="activeDLN(${objNew.id});" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal">
                        <span class="fa fa-search"></span></a>    
                        </span>           
                      </div>
                      <!-- product badge -->
                      <span class="aa-badge aa-sale" href="#">NEW!</span>
                    </li>
                      </c:forEach>                                                                       
                  </ul>
                  </c:if>
                   <a class="aa-browse-btn" href="${pageContext.request.contextPath}/all">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                </div>
                <!-- / latest product category -->              
              </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
  </section>
  <!-- / popular section -->
  <!-- Support section -->
  <section id="aa-support">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-support-area">
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-truck"></span>
                <h4>FREE SHIPPING</h4>
                <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
              </div>
            </div>
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-clock-o"></span>
                <h4>30 DAYS MONEY BACK</h4>
                <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
              </div>
            </div>
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-phone"></span>
                <h4>SUPPORT 24/7</h4>
                <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Support section -->
  <!-- Testimonial -->
 
  <!-- / Testimonial -->

 
  <!-- / Latest Blog -->

  <!-- Client Brand -->
  <section id="aa-client-brand">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-client-brand-area">
            <ul class="aa-client-brand-slider">
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-java.png" alt="java img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-jquery.png" alt="jquery img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-html5.png" alt="html5 img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-css3.png" alt="css3 img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-wordpress.png" alt="wordPress img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-joomla.png" alt="joomla img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-java.png" alt="java img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-jquery.png" alt="jquery img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-html5.png" alt="html5 img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-css3.png" alt="css3 img"></a></li>
              <li><a href="#"><img src="${contextPath }/resources/public/img/client-brand-wordpress.png" alt="wordPress img"></a></li>
            </ul>
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
      function activeN(id)
      {
       var url ="${pageContext.request.contextPath }/increLove";                    
       var tmp="#acticeN-"+id;
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
        	tmp="#acticeN-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
    <script type="text/javascript">
      function activeLN(id)
      {
       var url ="${pageContext.request.contextPath }/increLike";                    
       var tmp="#acticeLN-"+id;
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
        	tmp="#acticeLN-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
   
  <script type="text/javascript">
      function activeDLN(id)
      {
       var url ="${pageContext.request.contextPath }/increDLike";                    
       var tmp="#acticeDLN-"+id;
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
        	tmp="#acticeDLN-"+id;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
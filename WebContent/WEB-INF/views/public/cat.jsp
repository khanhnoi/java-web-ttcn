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
        <h2>Fashion</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>         
          <li class="active">${cat.cname }</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

  <!-- product category -->
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
          <div class="aa-product-catg-content">
            <div class="aa-product-catg-head">
              <div class="aa-product-catg-head-left">
                
                
              </div>
              <div class="aa-product-catg-head-right">
                <a id="grid-catg" href="#"><span class="fa fa-th"></span></a>
                <a id="list-catg" href="#"><span class="fa fa-list"></span></a>
              </div>
            </div>
            <div class="aa-product-catg-body">
            <c:if test="${not empty listBook }">
              <ul class="aa-product-catg">
                <!-- start single product item -->
                <c:forEach items="${listBook }" var="objBook">
                <li>
                  <figure>
                    <a class="aa-product-img" href="#"><img src="${contextPath }/fileUpload/${objBook.picture}" alt="polo shirt img" style="width: 250px; height: 300px;"></a>
                    <a class="aa-add-card-btn"href="${contextPath }/cart/add/${objBook.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                    <figcaption>
                    <c:url var="urlDetail"
						value="/chi-tiet/${StringUtils.makeSlug(objBook.name)}-${objBook.id}.html"></c:url>
                      <h4 class="aa-product-title"><a href="${urlDetail }">${objBook.name }</a></h4>
                      <span class="aa-product-price">$${objBook.price }</span>
                      <p class="aa-product-descrip">${fn:substring(objBook.detail,0,150) }...</p>
                    </figcaption>
                  </figure>                         
                  <div class="aa-product-hvr-content">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                  </div>
                  <!-- product badge -->
                  <span class="aa-badge aa-sale" href="#">SALE!</span>
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
            <div class="aa-product-catg-pagination">
              <nav>
                <ul class="pagination">
                  <c:if test="${page>1 }">
                  <li>
                    <a href="${pageContext.request.contextPath }/danh-muc/${StringUtils.makeSlug(cat.cname)}-${cat.cid}.html/${page-1}" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
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
                  <li class="${active }"><a href="${pageContext.request.contextPath }/danh-muc/${StringUtils.makeSlug(cat.cname)}-${cat.cid}.html/${i}">${i }</a></li>
                 </c:forEach>
                 <c:if test="${page<sumPage }">
                  <li>
                    <a href="${pageContext.request.contextPath }/danh-muc/${StringUtils.makeSlug(cat.cname)}-${cat.cid}.html/${page+1}" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                  </c:if>
                </ul>
              </nav>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
          <aside class="aa-sidebar">
            <!-- single sidebar -->
            <div class="aa-sidebar-widget">
              <h3>Category</h3>
              <ul class="aa-catg-nav">
              <c:forEach items="${catDAO.getItemDad() }" var="objDad">
                <c:url var="urlDad" value="/danh-muc/${StringUtils.makeSlug(objDad.cname)}-${objDad.cid}.html"></c:url>
                <li><a href="${urlDad }">${objDad.cname }</a></li>
                </c:forEach>
              </ul>
            </div>
            <!-- single sidebar -->
            
            <!-- single sidebar -->
            <div class="aa-sidebar-widget">
              <h3>Top Rated Products</h3>
              <div class="aa-recently-views">
               <c:if test="${not empty bookDAO.getFeatured() }">
                <ul>
                <c:forEach items="${bookDAO.getFeatured() }" var="objTop">
                  <li>
                    <a href="#" class="aa-cartbox-img"><img alt="img" src="${contextPath }/fileUpload/${objTop.picture}" style="width: 100px; height: 120px;"></a>
                    <div class="aa-cartbox-info">
                      <h4><a href="#">${objTop.name }</a></h4>
                      <p>${objTop.price }VNĐ</p>
                    </div>                    
                  </li>
                    </c:forEach>                            
                </ul>
                </c:if>
              </div>                            
            </div>
          </aside>
        </div>
       
      </div>
    </div>
  </section>
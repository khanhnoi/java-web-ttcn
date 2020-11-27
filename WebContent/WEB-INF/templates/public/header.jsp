<%@page import="vn.edu.vinaenter.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@include file="/WEB-INF/templates/tablib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<body> 
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->	


  <!-- Start header section -->
  <header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-top-area">
              <!-- start header top left -->
              <div class="aa-header-top-left">
                <!-- start language -->
                <div class="aa-language">
                  <div class="dropdown">
                    <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                      <img src="${contextPath }/resources/public/img/flag/english.jpg" alt="english flag">ENGLISH
                      <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                      <li><a href="#"><img src="${contextPath }/resources/public/img/flag/french.jpg" alt="">VIETNAM</a></li>
                      <li><a href="#"><img src="${contextPath }/resources/public/img/flag/english.jpg" alt="">ENGLISH</a></li>
                    </ul>
                  </div>
                </div>
                <!-- / language -->

                <!-- start currency -->
                <div class="aa-currency">
                  <div class="dropdown">
                    <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                      <i class="fa fa-usd"></i>USD
                      <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                      <li><a href="#"><i class="fa fa-euro"></i>EURO</a></li>
                      <li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
                    </ul>
                  </div>
                </div>
                <!-- / currency -->
                <!-- start cellphone -->
                <div class="cellphone hidden-xs">
                  <p><span class="fa fa-phone"></span>0397-303-999</p>
                </div>
                <!-- / cellphone -->
              </div>
              <!-- / header top left -->
              <div class="aa-header-top-right">
                <ul class="aa-head-top-nav-right">
                  
                  
                  <li class="hidden-xs"><a href="${contextPath }/cart">My Cart</a></li>
                  <li class="hidden-xs"><a href="${contextPath }/checkout">Checkout</a></li>
                  <li><a href="${contextPath }/admin" >Login</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header top  -->

    <!-- start header bottom  -->
    <div class="aa-header-bottom">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-bottom-area">
              <!-- logo  -->
              <div class="aa-logo">
                <!-- Text based logo -->
                <a href="${contextPath }/">
                  <span class="fa fa-shopping-cart"></span>
                  <p>book<strong>Shop</strong> <span>Your Shopping Partner</span></p>
                </a>
                <!-- img based logo -->
                <!-- <a href="index.html"><img src="${contextPath }/resources/public/img/logo.jpg" alt="logo img"></a> -->
              </div>
              <!-- / logo  -->
               <!-- cart box -->
                
              <div class="aa-cartbox">
                <a class="aa-cart-link" href="#">
                  <span class="fa fa-shopping-basket"></span>
                  <span class="aa-cart-title">SHOPPING CART</span>
                  <c:choose>
                  	<c:when test="${sessionScope.myCartNum ne 0}">
                  		<span class="aa-cart-notify">${sessionScope.myCartNum}</span>
                  	</c:when>
                  	<c:otherwise>
                  		<span class="aa-cart-notify">0</span>
                  	</c:otherwise>
                  </c:choose>
                  <span class="aa-cart-notify">${sessionScope.myCartNum}</span>
                </a>
                <div class="aa-cartbox-summary">
                  <ul>
                  
                  <c:forEach items="${sessionScope.myCartItems }" var="objCart">
                  <span id="acticeR-${objCart.value.book.id}" >
                    <li>
                    <c:url var="urlDetailH"
						value="/chi-tiet/${StringUtils.makeSlug(objCart.value.book.name)}-${objCart.value.book.id}.html"></c:url>
                      <a class="aa-cartbox-img" href="${urlDetailH }"><img src="${contextPath }/fileUpload/${objCart.value.book.picture}" alt="img"></a>
                      <div class="aa-cartbox-info">
                        <h4><a href="${urlDetailH }">${objCart.value.book.name }</a></h4>
                        <p>${objCart.value.quantity } x $${objCart.value.book.price }</p>
                      </div>
                       <%-- <span id="acticeR-${objCart.value.book.id}" > --%>
                      <a href="javascript:void(0)" onclick="activeR(${objCart.value.book.id});"  class="aa-remove-product" onclick="return confirm('Ban co muon xoa sản phẩm này?')" ><span class="fa fa-times"></span></a>
                      </span>
                    </li>
                     </c:forEach>                  
                    <li>
                      <span class="aa-cartbox-total-title">
                        Total
                      </span>
                      <span class="aa-cartbox-total-price">
                        $${sessionScope.myCartTotal }
                      </span>
                    </li>
                  </ul>
                  <a class="aa-cartbox-checkout aa-primary-btn" href="${pageContext.request.contextPath }/checkout">Checkout</a>
                </div>
              </div>
              <!-- / cart box -->
              <!-- search box -->
              <div class="aa-search-box">
                <form action="${pageContext.request.contextPath}/search" method="post" >
                  <input type="text" name="search" id="" placeholder="Tìm kiếm">
                  <button type="submit"><span class="fa fa-searchW"></span></button>
                </form>
              </div>
              <!-- / search box -->             
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header bottom  -->
  </header>
  <!-- / header section -->
  <!-- menu -->
  <section id="menu">
    <div class="container">
      <div class="menu-area">
        <!-- Navbar -->
        <div class="navbar navbar-default" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>          
          </div>
          <div class="navbar-collapse collapse">
            <!-- Left nav -->
            <ul class="nav navbar-nav">
              <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
              
              <c:forEach items="${catDAO.getItemDad()}" var="objCatDad">
              <c:url var="urlCatDad" value="/danh-muc/${StringUtils.makeSlug(objCatDad.cname)}-${objCatDad.cid}.html"></c:url>
              <li><a href="${urlCatDad }">${objCatDad.cname}<span class="caret"></span></a>
              
              	<c:if test="${not empty catDAO.getCatY(objCatDad.cid) }">
                <ul class="dropdown-menu">  
                  <c:forEach items="${catDAO.getCatY(objCatDad.cid)}" var="objCatY1">
                  <c:url var="urlCatY1" value="/danh-muc/${StringUtils.makeSlug(objCatY1.cname)}-${objCatY1.cid}.html"></c:url>
                  <li><a href="${urlCatY1}">${objCatY1.cname}<span class="caret"></span></a>
                  
                  <c:if test="${not empty catDAO.getCatY(objCatY1.cid) }">
                    <ul class="dropdown-menu">
                    <c:forEach items="${catDAO.getCatY(objCatY1.cid)}" var="objCatY2">
                      <c:url var="urlCatY2" value="/danh-muc/${StringUtils.makeSlug(objCatY2.cname)}-${objCatY2.cid}.html"></c:url>
                      <li><a href="${urlCatY2}">${objCatY2.cname}<span class="caret"></span></a>
                      
                       <c:if test="${not empty catDAO.getCatY(objCatY2.cid) }">
                        <ul class="dropdown-menu">
                        <c:forEach items="${catDAO.getCatY(objCatY2.cid)}" var="objCatY3">
                        <c:url var="urlCatY3" value="/danh-muc/${StringUtils.makeSlug(objCatY3.cname)}-${objCatY3.cid}.html"></c:url>
                          <li><a href="${urlCatY3}">${objCatY3.cname}</a></li>
                          </c:forEach>           
                        </ul>
                        </c:if>
                      </li> 
                       </c:forEach>                 
                    </ul>
                    </c:if>
                  </li>
                  </c:forEach>
                </ul>
                </c:if>
              </li>
              </c:forEach>
              
              
              <li><a href="${pageContext.request.contextPath}/lien-he">Liên hệ</a></li>
              
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>       
    </div>
  </section>
  
 <script type="text/javascript">
      function activeR(productId)
      {
       var url ="${pageContext.request.contextPath }/cart/removeActive";                    
       var tmp="#acticeR-"+productId;
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
        	tmp="#acticeR-"+productId;
         	$(tmp).html(data);

      		},
      	error: function (){
				alert("Có lỗi xảy ra");
			}
    });
   }
   </script>
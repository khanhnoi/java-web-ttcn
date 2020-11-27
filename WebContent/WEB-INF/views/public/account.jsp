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
        <h2>Account Page</h2>
        <ol class="breadcrumb">
          <li><a href="index.html">Home</a></li>                   
          <li class="active">Account</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="aa-myaccount">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="aa-myaccount-area">         
            <div class="row">
              <div class="col-md-6">
                <div class="aa-myaccount-login">
                <p>${msg }</p>
                <h4>Login</h4>
                 <form action="${pageContext.request.contextPath}/authpl/account" class="aa-login-form" method="post">
                  <label for="">Username<span>*</span></label>
                   <input type="text" placeholder="Username or email" name="username">
                   <label for="">Password<span>*</span></label>
                    <input type="password" placeholder="Password" name="password">
                    <input type="submit" class="aa-browse-btn" value="Login">
                    <label class="rememberme" for="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
                    <p class="aa-lost-password"><a href="#">Lost your password?</a></p>
                  </form>
                </div>
              </div>
              <div class="col-md-6">
                <div class="aa-myaccount-register">                 
                 <h4>Register</h4>
                 <form action="" class="aa-login-form">
                    <label for="">Username or Email address<span>*</span></label>
                    <input type="text" placeholder="Username or email">
                    <label for="">Password<span>*</span></label>
                    <input type="password" placeholder="Password">
                    <button type="submit" class="aa-browse-btn">Register</button>                    
                  </form>
                </div>
              </div>
            </div>          
         </div>
       </div>
     </div>
   </div>
 </section>
 <!-- / Cart view section -->

  <!-- footer -->  
  
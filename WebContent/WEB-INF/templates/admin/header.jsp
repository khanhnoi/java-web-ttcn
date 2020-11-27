<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tablib.jsp" %>
    <%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    <security:authentication property="principal" var="principal" />
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
  	<div class="header">
	      <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="${pageContext.request.contextPath}/">
	                 	<img alt="" src="${pageContext.request.contextPath}/resources/admin/images/logorodbooks.png" style="width: 200px; height: 50px"/>
	                 </a></h1>
	              </div>
	           </div>
	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12"></div>
	              </div>
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	              
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                  <img alt="Image placeholder" src="${contextPath}/fileUpload/${account.avatar}" style="width: 30%;border-radius: 50%;" /> 
	                    <ul class="nav navbar-nav">
	                     
	                      <li class="dropdown">
	                     
	                     
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><security:authentication property="principal.username"/><b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                          <li>
	                          	<a href="${pageContext.request.contextPath}/admin/profile" class="dropdown-item">
                					<i class="ni ni-single-02"></i>
                					<span>My profile</span>
              						</a>
	                          
	                          </li>
	                          <li><a href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
	                        </ul>
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div> 
	     
	     
	     
	     
	</div>
<!-- /.header -->
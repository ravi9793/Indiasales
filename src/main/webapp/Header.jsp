<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
  <!-- Brand -->
  
   <!-- Links -->
 	
   
    
 <c:if test="${not empty sessionScope.currentUser}">
 		<a class="navbar-brand" href="#">Welcome ${sessionScope.currentUser.getEmail()}</a>
 		<a class="navbar-brand " href="Logout" Style="color:red; font-weight:bold;">Logout</a>
 	</c:if>

  <!-- Links -->
  <ul class="navbar-nav " Style="font-size:20px; background: #314D6">
    <li class="nav-item">
      <a class="nav-link" href="#">About us</a>
    </li>
    
  
     <!-- Dropdown -->
    
    <c:if test="${sessionScope.currentUser.getRole() == 'Admin'}">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        ImageBank
      </a>   
      
      <div class="dropdown-menu">
      
        <a class="dropdown-item" href="AddImageToBank.jsp">AddImageBankToDB</a>
        <a class="dropdown-item" href="ViewImageBank.jsp">ViewImageBank</a>
        
      </div>
      
      </c:if>

    <!-- Dropdown -->
    
    <c:if test="${sessionScope.currentUser.getRole() == 'Admin'}">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Category
      </a>
      
      <div class="dropdown-menu">
      
        <a class="dropdown-item" href="AddCategory.jsp">AddCategory</a>
        <a class="dropdown-item" href="viewCategory.jsp">ViewCategory</a>
        
      </div>
    </li>
   </c:if>
    
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="AddCategroy.jsp" id="navbardrop" data-toggle="dropdown">
        Product
      </a>
      <div class="dropdown-menu">
     <c:if test="${sessionScope.currentUser.getRole() == 'Admin'}">
        <a class="dropdown-item" href="AddProduct.jsp">AddProduct</a>
        </c:if>
        <a class="dropdown-item" href="viewProduct.jsp">ViewProduct</a>
        
      </div>
    </li>
    
    <!-- Dropdown -->
    <c:if test="${sessionScope.currentUser.getRole() == 'Admin'}">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        AddUser
      </a>
      
      <div class="dropdown-menu">
      
       <!--   <a class="dropdown-item" href="Adduser.jsp">AddUser</a>-->
        <a class="dropdown-item" href="viewUser.jsp">ViewUser</a>
        
      </div>
    </li>
    </c:if>
    
  </ul>
</nav>

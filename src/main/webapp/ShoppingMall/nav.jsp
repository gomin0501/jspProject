<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String sessionId=(String) session.getAttribute("sessionId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/style.css">
<script src="../js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background-color: #fdd5f2;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">MealKku</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="sticker.jsp">스티커</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="maskingTape.jsp">마스킹테이프</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="dakkuBoard.jsp">자랑하기</a>
        </li>
      </ul>
	  
	  <ul class="nav justify-content-end">    
	  <%
	  	if(sessionId==null){%>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="addMember.jsp">회원가입</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="login.jsp">로그인</a>
	    </li>
	  		
	  <%}else if(sessionId.equals("admin")){ %>
	  	<li class="nav-item" style="padding-top: 8px; font-weight:bold; color:blue;">[관리자 모드]</li>
	    
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="addProduct.jsp">상품등록</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="productList.jsp">상품목록</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="orderListTotal.jsp">주문내역</a>
	    </li>
	  	<li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="logout.jsp">로그아웃</a>
	    </li>
	  <%}else{%>
	  	<li class="nav-item" style="padding-top: 7px; color:white">[<%=sessionId %>님 환영합니다.]</li>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="logout.jsp">로그아웃</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="memberView.jsp?id=<%=sessionId %>">내 정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="cart.jsp?id=<%=sessionId %>">장바구니</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-secondary-emphasis" href="orderList.jsp?id=<%=sessionId %>">주문내역</a>
	    </li>
	  <%} %> 
	   </ul>
	  
    </div>
  </div>
</nav>
</body>
</html>
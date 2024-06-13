<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<div class="p-3 mb-2 display-3 text-center login">로그인</div>
	    	<%
	    		String error=request.getParameter("error");
	    		if(error!=null){
	    			out.println("<div class='alert alert-danger login-ele'>");
	    			out.println("아이디와 비밀번호를 확인해 주세요");
	    			out.println("</div>");
	    		}
	    	%>
	<form name="frm" method="post" action="loginProcess.jsp" class="position-relative">
	    <div class="loginfrm text-center">
	    	<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">아이디</label>
				<div class="col-sm-5">
					<input type="text" name="id" class="form-control text-bg-light p-2" placeholder="아이디를 입력하세요">
				</div>
			</div>
			<div class="mb-3 row d-flex justify-content-center">
				<label class="col-sm-2 p-2">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" name="password" class="form-control text-bg-light p-2" placeholder="비밀번호를 입력하세요">
				</div>
			</div>
	    	<div class="button-middle">
	    		<input type="submit" class="btn btn-join btn-fade" value="로그인">
    		</div>
    	</div>
    </form>
</section>
</body>
</html>
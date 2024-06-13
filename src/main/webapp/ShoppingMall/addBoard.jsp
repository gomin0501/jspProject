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
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%
	sessionId=(String) session.getAttribute("sessionId");
	String sessionName=(String) session.getAttribute("sessionName");
	if(sessionId==null){
		%>
		<script>
			alert("먼저 로그인 하세요");
			location.href="login.jsp";
		</script>
		<%
	}
%>
 <div class="p-3 mb-2 display-3 text-center join">글쓰기</div>
 <section>
	<div class="container">
		<form name="newWrite" class="form-horizontal" action="boardProcess.jsp"
		 method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
		 <input type="hidden" id="name" name="name" value="<%=sessionName %>">
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">아이디</label>
		 	<div class="col-sm-5">
		 		<input name="id" type="text" class="form-control" value="<%=sessionId %>">
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">비밀번호</label>
		 	<div class="col-sm-5">
		 		<input name="password" type="password" class="form-control"	placeholder="password">
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">제목</label>
		 	<div class="col-sm-5">
		 		<input name="subject" type="text" class="form-control"	placeholder="subject">
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">내용</label>
		 	<div class="col-sm-5">
		 		<textarea name="content" cols="100" rows="5" class="form-control"	placeholder="content"> </textarea>
		 		
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">이미지</label>
		 	<div class="col-sm-5">
		 		<input type="file" name="dakkuImage" class="form-control">
		 	</div>
		 </div>
		 <div class="d-grid gap-2 d-md-flex justify-content-md-center">
		 		<input type="submit" class="btn me-md-2 btn-join btn-fade" value="등록">
		 		<input type="reset" class="btn btn-secondary" value="취소">
		 </div>
		 </form>
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
<script src="boardForm.js"></script>
</html>
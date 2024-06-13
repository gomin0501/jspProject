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
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	int num=Integer.parseInt(request.getParameter("num"));
%>
<div class="p-3 mb-2 display-3 text-center" >
 	<h3 style="font-weight:bold;">게시글 수정</h3></div>
	<div class="container">
		<form name="newWrite" class="form-horizontal" action="boardUpdateProcess.jsp"
		 method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
		 
		 <%
		 	try{
		 		String sql="select id,password,subject,content,filename from dakkuboard where num=?";
		 		pstmt=conn.prepareStatement(sql);
		 		pstmt.setInt(1,num);
		 		rs=pstmt.executeQuery();
		 		
		 		if(rs.next()){
		 			String id=rs.getString(1);
		 			String password=rs.getString(2);
		 			String subject=rs.getString(3);
		 			String content=rs.getString(4);
		 			String filename=rs.getString(5);
		 			
		 			if(!id.equals(sessionId)){
		 				%>
		 				<script>
		 				alert("수정할 수 없습니다.");
		 				history.back();
		 				</script>
		 		<% } %>

		 <input type="hidden" id="name" name="name" value="<%=sessionName %>">
		 <input type="hidden" id="num" name="num" value="<%=num %>">
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">아이디</label>
		 	<div class="col-sm-5">
		 		<input name="id" type="text" class="form-control" value="<%=id %>">
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">비밀번호</label>
		 	<div class="col-sm-5">
		 		<input name="password" type="password" class="form-control"	placeholder="password" value="<%=password %>">
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">제목</label>
		 	<div class="col-sm-5">
		 		<input name="subject" type="text" class="form-control"	placeholder="subject" value="<%=subject %>">
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">내용</label>
		 	<div class="col-sm-5">
		 		<textarea name="content" cols="100" rows="5" class="form-control"	placeholder="content"><%=content %> </textarea>
		 		
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<label class="col-sm-2 p-2">이미지</label>
		 	<div class="col-sm-5">
		 		<input type="file" name="dakkuImage" class="form-control"><%=filename %>
		 	</div>
		 </div>
		 <div class="mb-3 row d-flex justify-content-center">
		 	<div class="d-grid gap-2 d-md-flex justify-content-center">
		 		<input type="submit" class="btn btn-join btn-fade" value="수정">
		 		<a href="boardDelete.jsp?num=<%=num %>" class="btn btn-secondary"
		 			onclick="if(!confirm('삭제할까요?')) return false;">삭제</a>
		 	</div>
		 </div>
		<%} 	
		}catch(Exception e){
		 		System.out.println("연결 오류");
		 		e.printStackTrace();
		 	}%>
		 </form>
		 <hr>
	</div>
</body>
<script src="boardForm.js"></script>
</html>
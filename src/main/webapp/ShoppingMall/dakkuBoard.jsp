<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀린다꾸</title>
</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
 <div class="p-3 mb-2 display-3 text-center join">자랑하기</div>
<div class="container">
<%@ include file="dbconn.jsp" %>
<%
	sessionId=(String) session.getAttribute("sessionId");
%>
<div style="padding-top: 50px">
		<table class="table table-hover"> 


	<tr class="index">
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
		<td></td>
	</tr>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
	String sql="select * from dakkuboard";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		int num=rs.getInt(1);
		String Id=rs.getString(2);
		String subject=rs.getString(5);
		String reg_time=rs.getString(8);
		int hit=rs.getInt(9);
%>
	<tr>
		<td><%=num %></td>
		<td><a href="boardView.jsp?num=<%=num %>"><%=subject %></a> </td>
		<td><%=Id %></td>
		<td><%=reg_time %></td>
		<td><%=hit %></td>
	</tr>
	<%	}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}%>
	</table>
		<div width="100%" align="right">
			<a class="btn btn-secondary" href="#" role="button" onclick="checkForm(); return false;">
				글쓰기</a>
		</div>
	</div>
	
</div><!-- container -->	
</section>
	<%@ include file="footer.jsp" %>
</body>
<script>function checkForm(){   
	location.href="addBoard.jsp"
}
</script>
</html>
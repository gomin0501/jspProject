<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String sessionId=(String) session.getAttribute("sessionId");

	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String productId=request.getParameter("productId");
	String sql="delete from dakkucart where memberid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,sessionId);
	pstmt.executeUpdate();
	
	response.sendRedirect("cart.jsp?id="+sessionId);
%>
</body>
</html>
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
	
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String productId=request.getParameter("productId");
	
	try{
		String sql="delete from dakkuproduct where productid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,productId);
			pstmt.executeUpdate();
			
			response.sendRedirect("productList.jsp");
			
		}catch(Exception e){
			System.out.println("productDelete 오류");
			e.printStackTrace();
	}
			
	
	
%>
<script>
	history.back();
</script>
</body>
</html>
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
	int num=Integer.parseInt(request.getParameter("num"));
	
	try{
		String sql="delete from dakkuboard where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			
			response.sendRedirect("dakkuBoard.jsp");
			
		}catch(Exception e){
			System.out.println("boardDelete 오류");
			e.printStackTrace();
	}
			
	
	
%>
<script>
	history.back();
</script>
</body>
</html>
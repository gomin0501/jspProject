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
	if(sessionId==null){
		%>
		<script>
			alert("먼저 로그인 하세요");
			location.href="login.jsp";
		</script>
	<%
	}

	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=Integer.parseInt(request.getParameter("num"));
	int boardNum=Integer.parseInt(request.getParameter("boardnum"));
	
	String sql="select id from reply where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String id=rs.getString(1);
		
		if(!id.equals(sessionId)){
			%>
			
			<script>
			alert("삭제할 수 없습니다.");
			history.back();
			</script>
		<%}else{
			sql="delete from reply where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			
		}
	}
			
	response.sendRedirect("boardView.jsp?num="+boardNum);
	
%>

</body>
</html>
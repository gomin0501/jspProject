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
	//로그인 구현
	//한글 패치
	request.setCharacterEncoding("utf-8");
	//로그인 폼 값 가져오기
	String id=request.getParameter("id");
	String ps=request.getParameter("password");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select id,name,password from dakkumember where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String userID=rs.getString(1);
			String userName=rs.getString(2);
			String userPs=rs.getString(3);
			if(ps.equals(userPs)){
				
					session.setAttribute("sessionName",userName);	
					session.setAttribute("sessionId",userID);
					%>
					<script>
					location.href="home.jsp";
					</script>
		<%
			}else{
				response.sendRedirect("login.jsp?error=1");
			}
		}else{
			response.sendRedirect("login.jsp?error=1");
		}
	}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
	}
%>
</body>
</html>
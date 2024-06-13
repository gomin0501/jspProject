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
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sessionId=(String) session.getAttribute("sessionId");
	//목록 삭제하기:delete from 테이블 이름 where 목록
	
	//넘어오는 데이터 id가 들어가기때문에 ?로 준다
try{
	String sql="delete from dakkumember where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,sessionId);
	pstmt.executeUpdate();
	//로그아웃 하기
	session.invalidate();

	response.sendRedirect("home.jsp");
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
%>

</body>
</html>
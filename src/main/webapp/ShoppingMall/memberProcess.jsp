
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
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	//form데이터 가져오기
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String ps=request.getParameter("password");
	String gender=request.getParameter("gender");
	String birth=request.getParameter("year")+request.getParameter("month")+request.getParameter("day");
	String email=request.getParameter("emailId")+"@"+request.getParameter("email");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	
	//sql문(database table)에 값 넣기
try{
	String sql="insert into dakkumember values(?,?,?,?,?,?,?,?,sysdate)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);//번호는 물음표 순서
	pstmt.setString(2,ps);
	pstmt.setString(3,name);
	pstmt.setString(4,gender);
	pstmt.setString(5,birth);
	pstmt.setString(6,email);
	pstmt.setString(7,phone);
	pstmt.setString(8,address);
	
	pstmt.executeUpdate();//실행
%>
<script>
	alert("회원 가입 완료!\n로그인 해 주세요");
	location.href="login.jsp"
</script>
<%	
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
%>
</body>
</html>
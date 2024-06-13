
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
	ResultSet rs=null;
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
	String sql="update dakkumember set password=?,name=?,gender=?,birth=?,mail=?,phone=?,address=?,timestamp=sysdate where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,ps);//번호는 물음표 순서
	pstmt.setString(2,name);
	pstmt.setString(3,gender);
	pstmt.setString(4,birth);
	pstmt.setString(5,email);
	pstmt.setString(6,phone);
	pstmt.setString(7,address);
	pstmt.setString(8,id);
	
	pstmt.executeUpdate();//실행
%>
<script>
	alert("수정이 완료되었습니다.");
	location.href="home.jsp"
</script>
<%	
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
%>
</body>
</html>
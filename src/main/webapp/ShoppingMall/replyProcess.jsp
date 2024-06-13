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
	String sessionId=(String)session.getAttribute("sessionId");
	System.out.println("name:"+sessionId);
	if(sessionId==null){
		%>
		<script>
			alert("먼저 로그인 하세요");
			history.back();
		</script>
		<%
	}
	request.setCharacterEncoding("UTF-8");

	PreparedStatement pstmt=null;
	ResultSet rs=null;
	//form데이터 가져오기
	String memo=request.getParameter("memo");
	int num=Integer.parseInt(request.getParameter("boardnum"));
	
	try{
		String sql="select count(*) from reply";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		int cnt=0;
		if(rs.next()){
			cnt=rs.getInt(1)+1;
		}else{
			cnt=0;
		}
		
		
		sql="insert into reply values(?,?,?,sysdate,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,cnt);
		pstmt.setString(2,sessionId);
		pstmt.setString(3,memo);
		pstmt.setInt(4,num);
	
	pstmt.executeUpdate();//실행

		
	}catch(Exception e){
		System.out.println("replyProcess 오류");
		e.printStackTrace();
	}
	response.sendRedirect("boardView.jsp?num="+num);
	
%>
</body>
</html>
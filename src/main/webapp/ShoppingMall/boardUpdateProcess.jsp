<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@page import = "java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String sessionName=(String) session.getAttribute("sessionName");
	String sessionId=(String) session.getAttribute("sessionId");
	
%>
<%
	try{
		request.setCharacterEncoding("UTF-8");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		String filename="";
		String realFolder="C:\\workspace2024\\MealinDakku\\src\\main\\webapp\\ShoppingMall\\upload";
		String encType="utf-8"; //인코딩 타입
		int maxSize=5*1024*1024; //최대 업로드될 파일의 크기5Mb
		System.out.println("real folder:"+realFolder);
		MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
		int num=Integer.parseInt(multi.getParameter("num")); 
		
		
		String id=multi.getParameter("id");
	System.out.println("id:"+sessionId);
		String name=multi.getParameter("name");
	System.out.println("name"+name);
		String password=multi.getParameter("password");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String ip_addr=request.getRemoteAddr();
	
		@SuppressWarnings("rawtypes")
		Enumeration files=multi.getFileNames();
		String fname=(String)files.nextElement();
		String fileName=multi.getFilesystemName(fname);
		
		String sql="select * from dakkuboard where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			if(fileName != null){
				sql="update dakkuboard set id=?,name=?,password=?,subject=?,content=?,filename=?,regist_day=sysdate,ip=? where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setString(2,name);
				pstmt.setString(3,password);
				pstmt.setString(4,subject);
				pstmt.setString(5,content);
				pstmt.setString(6,fileName);
				pstmt.setString(7,ip_addr);
				pstmt.setInt(8,num);
				
				pstmt.executeUpdate();
				
			}else{
				sql="update dakkuboard set id=?,name=?,password=?,subject=?,content=?,regist_day=sysdate,ip=? where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setString(2,name);
				pstmt.setString(3,password);
				pstmt.setString(4,subject);
				pstmt.setString(5,content);
				pstmt.setString(6,ip_addr);
				pstmt.setInt(7,num);
				
				pstmt.executeUpdate();
				
			}
		}
		
		response.sendRedirect("boardView.jsp?num="+num);
		
		
	}catch(Exception e){
		System.out.println("boardUpdateProcess 연결 오류");
		e.printStackTrace();
	}
	
%>
</body>
</html>
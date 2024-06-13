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
try{
	String filename="";
	String realFolder="C:\\workspace2024\\MealinDakku\\src\\main\\webapp\\ShoppingMall\\upload";
	String encType="utf-8"; //인코딩 타입
	int maxSize=5*1024*1024; //최대 업로드될 파일의 크기5Mb
	System.out.println("real folder:"+realFolder);
	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId=multi.getParameter("productId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String description=multi.getParameter("description");
	String author=multi.getParameter("author");
	String category=multi.getParameter("category");
	String unitsInstock=multi.getParameter("unitsInstock");
	String condition=multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	long stock;
	
	if(unitsInstock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInstock);
	@SuppressWarnings("rawtypes")
	Enumeration files=multi.getFileNames();
	String fname=(String)files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	PreparedStatement pstmt=null;
	String sql="insert into dakkuproduct values(?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,productId);
	pstmt.setString(2,name);
	pstmt.setInt(3,price);
	pstmt.setString(4,description);
	pstmt.setString(5,category);
	pstmt.setString(6,author);
	pstmt.setLong(7,stock);
	pstmt.setString(8,fileName);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("home.jsp");
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
	
%>
</body>
</html>
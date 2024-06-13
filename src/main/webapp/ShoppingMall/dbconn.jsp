<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>

<%
//app>사용자폴더>product>18.0.0>dbhomeXE>jdbc>lib>ojdbc8.jar 파일 복사해서 이클립스에 복사하기
	Connection conn=null;
try{
	String jdbcDriver="oracle.jdbc.OracleDriver";
	//jdbc : java database connectivity
	String jdbcurl="jdbc:oracle:thin:@//localhost:1521/xe";
	String user="c##dakku";
	String pass="1234";
	Class.forName(jdbcDriver);
	conn=DriverManager.getConnection(jdbcurl,user,pass);
	System.out.println("데이터베이스 연결 성공");
}catch(Exception e){
	System.out.println("데이터베이스 연결 실패");
	e.printStackTrace();
}
%>

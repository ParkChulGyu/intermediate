<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<h1>Java Web Application </h1>  
<h2>
<a href="<%=contextPath %>">Home</a> |
<a href="<%=contextPath %>/membermybatis/main-mapper">Member-Mybatis-Mapper</a> |
<a href="<%=contextPath %>/membermybatis/memberList-paging?pageNum=0">Member-Mybatis-memberList-paging</a> |

</h2>
<hr>
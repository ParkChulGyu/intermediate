<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top2.css">

</head>
<body>

<c:import url="topmenu.jsp" />
<h2><%=request.getRequestURI() %></h2>
<hr>
<h1>Spring Setup</h1>
<h2>


</h2>
</body>
</html>
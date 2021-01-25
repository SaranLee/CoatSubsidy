<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/11
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <c:set var="PATH" value="${pageContext.request.contextPath}" scope="application"/>
    <%--<jsp:forward page="WEB-INF/pages/login.jsp"/>--%>
    <jsp:forward page="WEB-INF/pages/vueTest.html"/>
  </body>
</html>

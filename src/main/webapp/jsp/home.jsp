<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="by.itclass.constants.AppConstants" %>
<%@ page import="by.itclass.constants.JspConstants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home page</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=JspConstants.MENU_JSP%>"/>
    <jsp:include page="/jsp/slider/slider.html"/>
    <c:if test="${not empty message}">
        <h2>${message}</h2>
    </c:if>
    <script src="/js/slider.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="by.itclass.constants.AppConstants" %>
<%@ page import="by.itclass.constants.JspConstants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login page</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=JspConstants.MENU_JSP%>"/>
    <img class="default-image" src="<%=JspConstants.BACKGROUND_IMAGE%>" alt="img">
    <div class="form-box">
        <h2>Login</h2>
        <form action="<%=AppConstants.LOGIN_CONTROLLER%>" method="post">
            <input name="<%=JspConstants.LOGIN_PARAM%>" placeholder="Login">
            <input type="password" name="<%=JspConstants.PASSWORD_PARAM%>" placeholder="Password">
            <input type="submit" value="Login">
        </form>
        <c:if test="${not empty message}">
            <h2 class="error" >${message}</h2>
        </c:if>
    </div>
</body>
</html>

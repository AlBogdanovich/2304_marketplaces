<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="by.itclass.constants.AppConstants" %>
<%@ page import="by.itclass.constants.JspConstants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav-ul">
    <c:choose>
        <c:when test="${empty user}">
            <li class="nav-li">
                <a href="<%=JspConstants.LOGIN_JSP%>">Login</a></li>
            <li class="nav-li">
                <a href="<%=JspConstants.REGISTRATION_JSP%>">Registration</a></li>
        </c:when>
        <c:otherwise>
            <li class="nav-li float-left">
                <a class="active" href="<%=JspConstants.HOME_JSP%>">Home</a></li>
            <li class="nav-li">
                <a href="<%=AppConstants.LOGOUT_CONTROLLER%>">Logout</a></li>
            <li class="nav-li float-left">
                <a href="<%=AppConstants.TV_STOCK%>">TV</a></li>
            <li class="nav-li float-left">
                <a href="<%=AppConstants.LAPTOP_STOCK%>">Laptop</a></li>
            <li class="nav-li">
                <a href="<%=JspConstants.CART_JSP%>">Cart</a></li>
            <li class="nav-li">
                <a href="<%=AppConstants.ORDERS_HISTORY_CONTROLLER%>">History</a></li>


        </c:otherwise>
    </c:choose>
</ul>


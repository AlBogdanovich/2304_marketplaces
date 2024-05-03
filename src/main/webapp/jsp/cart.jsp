<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="by.itclass.constants.AppConstants" %>
<%@ page import="by.itclass.constants.JspConstants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=JspConstants.MENU_JSP%>"/>
    <h2>Hello ${user.name} </h2>
    <c:choose>
        <c:when test="${not empty orderItems}">
            <h2>Your cart: </h2>
            <c:forEach var="item" items="${orderItems}">
                <div class="cart-item-container">
                    <img class="cart-img" src="/img/${item.itemType eq 1 ? 'tv' : 'laptop'}/${item.itemVendor}-${item.itemModel}.jpg" alt="img">
                    <h3 class="cart-text">${item.itemVendor} ${item.itemModel} by ${item.itemPrice} byn.</h3>
                    <form method="post" action="<%=AppConstants.CART_CONTROLLER%>">
                        <input type="hidden" name="<%=JspConstants.CART_ACTION_PARAM%>" value="change">
                        <input type="hidden" name="<%=JspConstants.ITEM_TYPE_PARAM%>" value="${item.itemType}">
                        <input type="hidden" name="<%=JspConstants.ITEM_ID_PARAM%>" value="${item.itemId}">
                        <div class="number-input">
                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
                            <input type="number" name="<%=JspConstants.QUANTITY_PARAM%>" value="${item.quantity}" min="1">
                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                        </div>
                    </form>
                    <form method="post" action="<%=AppConstants.CART_CONTROLLER%>">
                        <input type="hidden" name="<%=JspConstants.CART_ACTION_PARAM%>" value="remove">
                        <input type="hidden" name="<%=JspConstants.ITEM_TYPE_PARAM%>" value="${item.itemType}">
                        <input type="hidden" name="<%=JspConstants.ITEM_ID_PARAM%>" value="${item.itemId}">
                        <input type="submit" value="Remove from cart">
                    </form>
            </c:forEach>
            <div class="order-container">
                <form method="post" action="<%=AppConstants.ORDER_CONTROLLER%>">
                    <input name="<%=JspConstants.ADDRESS_PARAM%>" placeholder="Delivery Address" required>
                    <input type="submit" value="Submit order">
                </form>
                <c:if test="${not empty message}">
                    <h2 class="error">${message}</h2>
                </c:if>
            </div>
            </div>
        </c:when>
        <c:otherwise>
            <p>You have no items in the cart</p>
        </c:otherwise>
    </c:choose>
</body>
</html>

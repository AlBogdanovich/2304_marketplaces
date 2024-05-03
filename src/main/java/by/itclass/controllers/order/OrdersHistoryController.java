package by.itclass.controllers.order;

import by.itclass.controllers.order.abstraction.AbstractController;
import by.itclass.model.entities.User;
import by.itclass.model.services.OrderService;
import by.itclass.model.services.ServiceFactory;
import by.itclass.model.services.ServiceType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static by.itclass.constants.AppConstants.ORDERS_HISTORY_CONTROLLER;
import static by.itclass.constants.JspConstants.*;

@WebServlet(ORDERS_HISTORY_CONTROLLER)
public class OrdersHistoryController extends AbstractController {
    protected OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = (OrderService) ServiceFactory.getInstance(ServiceType.ORDER_SERVICE);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var session = req.getSession();
        var userId = ((User)session.getAttribute(USER_ATTR)).getId();
        var orders = orderService.getOrders(userId);
        req.setAttribute(ORDERS_ATTR, orders);
        forward(req, resp, ORDERS_JSP);
    }
}

package by.itclass.controllers.order;

import by.itclass.controllers.order.abstraction.AbstractController;
import by.itclass.controllers.order.abstraction.OrderAbstractController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static by.itclass.constants.AppConstants.PRINT_ORDER_CONTROLLER;
import static by.itclass.constants.JspConstants.*;

@WebServlet(PRINT_ORDER_CONTROLLER)
public class PrintOrderController extends OrderAbstractController {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var orderId = req.getParameter(ORDER_ID_ATTR);
        var receipt = orderService.buildReceipt(orderId);
        req.setAttribute(RECEIPT_ATTR, receipt);
        forward(req, resp, RECEIPT_JSP);
    }
}

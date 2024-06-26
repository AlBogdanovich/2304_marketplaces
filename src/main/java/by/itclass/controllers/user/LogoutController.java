package by.itclass.controllers.user;

import by.itclass.controllers.order.abstraction.AbstractController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static by.itclass.constants.AppConstants.LOGOUT_CONTROLLER;
import static by.itclass.constants.JspConstants.INDEX_JSP;

@WebServlet(LOGOUT_CONTROLLER)
public class LogoutController extends AbstractController {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var session = req.getSession();
        session.invalidate();
        redirect(resp, INDEX_JSP);
    }
}

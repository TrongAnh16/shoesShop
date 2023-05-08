package control;

import dao.DAO;
import entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginControlServlet", value = "/login")
public class LoginControlServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        DAO dao = new DAO();
        Account a = dao.login(username, password);
        if (a == null) {
            request.setAttribute("mess", "Wrong username or password");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

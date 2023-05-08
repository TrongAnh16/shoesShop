package control;

import dao.DAO;
import entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignUpControlServlet", value = "/signup")
public class SignUpControlServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
        if (!pass.equals(re_pass)) {
            response.sendRedirect("Login.jsp");
        }else {
            DAO dao = new DAO();
            Account a = dao.checkAccountExist(user);
            if (a == null) {
                // duoc signup
                dao.signup(user, pass);
                response.sendRedirect("home");
            }else {
                //day ve lai trang jsp
                response.sendRedirect("Login.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

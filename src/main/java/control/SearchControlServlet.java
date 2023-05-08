package control;

import dao.DAO;
import entity.Category;
import entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControlServlet", value = "/search")
public class SearchControlServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtSearch = request.getParameter("txt"); //giay chay bo
        DAO dao = new DAO();
        List<Product> list = dao.searchByName(txtSearch);
        List<Category> listC = dao.getAllCategory();
        Product last = dao.getLast();

        request.setAttribute("listP", list);
        request.setAttribute("listCC", listC);
        request.setAttribute("p", last);
        request.setAttribute("txtS", txtSearch);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

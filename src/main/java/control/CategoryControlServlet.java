package control;

import dao.DAO;
import entity.Category;
import entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryControlServlet", urlPatterns = "/category")
public class CategoryControlServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cateID = request.getParameter("cid");
        //da lay duoc category ve roi
        DAO dao = new DAO();
        List<Product> list = dao.getProductByCID(cateID);
        List<Category> listC = dao.getAllCategory();
        Product last = dao.getLast();

        request.setAttribute("listP", list);
        request.setAttribute("listCC", listC);
        request.setAttribute("p", last);
        request.setAttribute("tag", cateID);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

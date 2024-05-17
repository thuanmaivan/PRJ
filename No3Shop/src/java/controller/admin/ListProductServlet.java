package controller.admin;

import dao.*;
import model.*;
import java.util.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author havie
 */
@WebServlet(name = "ListProductServlet", urlPatterns = {"/listproduct"})
public class ListProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // lay ra danh sach san pham
        ProductsDAO pd = new ProductsDAO();
        List<Products> listP;
        listP = pd.getAllProducts();
        String page = request.getParameter("page");
        int p = 1;
        request.setAttribute("totalPage", (int)Math.ceil((double)listP.size() / 8.0));
        if(page != null) {
            try {
                p = Integer.parseInt(page);
                if(p <= 0) {
                    p = 1;
                }
                if(p > Math.ceil((double)listP.size() / 8.0)) { 
                    p = (int)Math.ceil((double)listP.size() / 8.0);
                }
            } catch(Exception e) {}
        }
        if(listP.size() > 8) {
            listP = listP.subList(0 + (8*(p-1)), (8  + (8*(p-1))) > listP.size() ? listP.size() : (8  + (8*(p-1))));
        }
        
        request.setAttribute("currPage", p);
        request.setAttribute("listP", listP);

        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);

        request.getRequestDispatcher("product-list.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // search san pham
        String txt = request.getParameter("txt");
        ProductsDAO pd = new ProductsDAO();
        List<Products> listP;
        listP = pd.searchProductByName(txt);
        String page = request.getParameter("page");
        int p = 1;
        request.setAttribute("totalPage", (int)Math.ceil((double)listP.size() / 8.0));
        if(page != null) {
            try {
                p = Integer.parseInt(page);
                if(p <= 0) {
                    p = 1;
                }
                if(p > Math.ceil((double)listP.size() / 8.0)) { 
                    p = (int)Math.ceil((double)listP.size() / 8.0);
                }
            } catch(Exception e) {}
        }
        if(listP.size() > 8) {
            listP = listP.subList(0 + (8*(p-1)), (8  + (8*(p-1))) > listP.size() ? listP.size() : (8  + (8*(p-1))));
        }
        
        request.setAttribute("currPage", p);
        request.setAttribute("listP", listP);
        
        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);

        request.getRequestDispatcher("product-list.jsp").forward(request, response);

    }
}

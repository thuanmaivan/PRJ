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


@WebServlet(name = "AddProductServlet", urlPatterns = {"/addproduct"})
public class AddProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     // lay thong tin cua san pham moi tu trang jsp
        String name = request.getParameter("name");
        String image = "img/product/" + request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        String des = request.getParameter("des");
        int category = Integer.parseInt(request.getParameter("category"));
        
        // them moi 1 san pham
        ProductsDAO pd = new ProductsDAO();
        pd.addProduct(new Products(name, des, price, image, category));

        // lay ra danh sach san pham
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
        
        request.getRequestDispatcher("product-list.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}

package controller.guest;

import dao.CategoriesDAO;
import dao.ProductsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Vector;
import model.Categories;
import model.Products;

@WebServlet(name = "ContentServlet", urlPatterns = {"/content"})

public class ContentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // lay ra list category
        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);

        // lay ra categoryID mà nguoi dùng muon xem
        String stringCateID = request.getParameter("CateID");

        // danh sach san pham
        ProductsDAO pd = new ProductsDAO();
        List<Products> listP;
        List<Products> listN = pd.getNewProducts();
        List<Products> listF = pd.getRandomProducts();
        //neu khong chon category cu the, tra ve danh sach tat ca san pham
        if (stringCateID == null) {
            listP = pd.getAllProducts();
            // neu chon 1 category, lay ra danh sach san pham thuoc ve category do
        } else {
            int cateID = Integer.parseInt(stringCateID);
            listP = pd.getProductsByCategoryID(cateID);
        }
        String page = request.getParameter("page");
        int p = 1;
        
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        if(from != null && from.isEmpty()) {
            from = null;
        }
        if(to != null && to.isEmpty()) {
            to = null;
        }
        if(from != null && to != null) {
            int f = Integer.parseInt(from);
            int t = Integer.parseInt(to);
            if(f > t) {
                request.setAttribute("mess", "Nhập sai!");
            } else {
                for (int i = 0; i < listP.size(); i++) {
                    if(!(listP.get(i).getPrice() >= f && listP.get(i).getPrice() <= t)) {
                        listP.remove(i);
                        i--;
                    }
                }
            }
        } else {
            if(from != null) {
                int f = Integer.parseInt(from);
                for (int i = 0; i < listP.size(); i++) {
                    if(!(listP.get(i).getPrice() >= f)) {
                        listP.remove(i);
                        i--;
                    }
                }
            }
            if(to != null) {
            int t = Integer.parseInt(to);
                for (int i = 0; i < listP.size(); i++) {
                    if(!(listP.get(i).getPrice() <= t)) {
                        listP.remove(i);
                        i--;
                    }
                }
            }
        }
        String sort = request.getParameter("sort");
        if(sort != null) {
            if(sort.equals("htl")) {
                for (int i = 0; i < listP.size(); i++) {
                    for (int j = i; j < listP.size(); j++) {
                        if(listP.get(i).getPrice() < listP.get(j).getPrice()) {
                            Products temp = listP.get(i);
                            listP.set(i, listP.get(j));
                            listP.set(j, temp);
                        }
                    }
                }
            } else if(sort.equals("lth")) {
                for (int i = 0; i < listP.size(); i++) {
                    for (int j = i; j < listP.size(); j++) {
                        if(listP.get(i).getPrice() > listP.get(j).getPrice()) {
                            Products temp = listP.get(i);
                            listP.set(i, listP.get(j));
                            listP.set(j, temp);
                        }
                    }
                }
            }
        }
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
        request.setAttribute("listN", listN);
        request.setAttribute("listF", listF);
        request.setAttribute("isContent", true);
        //request.setAttribute("tag", stringCateID);    ${tag == CateID ? "active":""
        request.getRequestDispatcher("content.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // lay ra ky tu ma nguoi dung search
        String txt = request.getParameter("txt");

        // lay ra list category
        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);

        //lay ra nhung san pham co tên chua ký tu mà nguoi dùng muon search
        ProductsDAO pd = new ProductsDAO();
        List<Products> listP = pd.searchProductByName(txt);
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

        request.getRequestDispatcher("content.jsp").forward(request, response);

    }

}

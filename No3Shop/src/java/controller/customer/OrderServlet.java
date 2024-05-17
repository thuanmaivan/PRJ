/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

import dao.CategoriesDAO;
import dao.OrderItemsDAO;
import dao.OrdersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Categories;
import model.OrderItems;
import model.Orders;
import model.Users;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="OrderServlet", urlPatterns={"/order"})
public class OrderServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String odid = request.getParameter("odid");
        if(odid == null) {
        OrdersDAO od = new OrdersDAO();
        Vector<Orders> listO = new Vector<>();
        Users u = (Users)request.getSession().getAttribute("user");
        if(u == null) {
            response.sendRedirect("login.jsp");
            return;
        }
            int uid = u.getID();
            listO = od.getOrderByUserID(uid);

        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);
        request.setAttribute("listO", listO);
        request.getRequestDispatcher("order-history.jsp").forward(request, response);
        } else {
        int odidi = Integer.parseInt(odid);
        OrderItemsDAO oid = new OrderItemsDAO();
        Vector<OrderItems> detail = oid.getOdDetailByOdId(odidi);
        request.setAttribute("detail", detail);
        
        OrdersDAO od = new OrdersDAO();
        Orders o = od.getOrderByOdId(odidi);
        request.setAttribute("o", o);
        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);

        request.getRequestDispatcher("bill-details.jsp").forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

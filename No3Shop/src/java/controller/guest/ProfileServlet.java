/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.guest;

import dao.CategoriesDAO;
import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Categories;
import model.Users;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="ProfileServlet", urlPatterns={"/profile"})
public class ProfileServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Users u = (Users)request.getSession().getAttribute("user");
        if(u == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        String old = request.getParameter("oldpass");
        String newPass = request.getParameter("newpass");
        Users u = (Users)request.getSession().getAttribute("user");
        if(u == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        if(!old.equals(u.getPassword())) {
            request.setAttribute("mess", "Password did not match!");
        } else {
            UsersDAO ud = new UsersDAO();
            ud.changePass(u.getID(), newPass);
            request.setAttribute("mess", "Change password successfully!");
        }
        CategoriesDAO cd = new CategoriesDAO();
        Vector<Categories> listC = cd.getCategories();
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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

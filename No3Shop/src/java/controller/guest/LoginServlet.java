package controller.guest;

import dao.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // lay ra input email, password cua nguoi dung
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // dang nhap
        UsersDAO ud = new UsersDAO();
        Users u = ud.Login(username, password);

        // neu tai khoan chua ton tai
        if (u == null) {
            request.setAttribute("mess", "Wrong email or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (u.getRole() == 2) { // neu tai khoan ton tai, tao session -> tra ve home (servlet)
            HttpSession session = request.getSession();
            session.setAttribute("user", u);
            response.sendRedirect("content");
        } else if (u.getRole() == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("user", u);
            response.sendRedirect("admin-index.jsp");
        }

    }

}

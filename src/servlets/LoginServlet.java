package servlets;

import beans.User;
import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        User user = userDao.getUserByUsernameAndPassword(username, password);
        if (user != null) {
            response.sendRedirect("UserDetailServlet1?id=" + user.getId());
        } else {
            request.setAttribute("errorMessage", "用户名或密码错误");
            request.getRequestDispatcher("errorlogin.jsp").forward(request, response);
        }
    }
}

package servlets;

import beans.User;
import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User(username,password);
        // 根据用户名查询数据库中是否已经存在该用户
        User existUser = userDao.finduser(username);
        if (existUser != null) {
            // 如果存在，给用户一个错误提示
            request.setAttribute("message", "用户名重复");
            request.getRequestDispatcher("errorreg.jsp").forward(request,response);
        } else {
            // 如果不存在，插入用户数据
            userDao.insert(user);
            // 跳转到成功页面
            response.sendRedirect("succeedreg.jsp");
        }
    }
}

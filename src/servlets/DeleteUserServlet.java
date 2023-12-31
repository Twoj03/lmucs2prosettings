package servlets;

import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取用户id
        int id = Integer.parseInt(request.getParameter("id"));
        // 创建UserDao对象
        UserDao userDao = new UserDao();
        // 调用deleteUserById方法
        userDao.deleteUserById(id);
        // 重定向到登录页面
        response.sendRedirect("login.jsp");
    }
}

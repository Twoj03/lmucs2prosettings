package servlets;

import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdatePasswordServlet", value = "/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取用户名、旧密码和新密码
        String username = request.getParameter("username");
        String oldPassword = request.getParameter("old-password");
        String newPassword = request.getParameter("new-password");

        // 创建UserDao对象
        UserDao userDao = new UserDao();

        // 验证用户名和旧密码
        if (userDao.validateUser(username, oldPassword)) {
            // 如果验证通过，更新密码
            userDao.updatePassword(username, newPassword);
            // 重定向到登录页面
            response.sendRedirect("succeedupdatepassword.jsp");
        } else {
            // 如果验证失败，重定向到错误页面
            response.sendRedirect("errorupdatepassword.jsp");
        }
    }
}

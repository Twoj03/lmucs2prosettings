package servlets;

import beans.User;
import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDetailServlet2", value = "/UserDetailServlet2")
public class UserDetailServlet2 extends HttpServlet {
    UserDao userDao=new UserDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        User user= userDao.find(id);
        request.setAttribute("g",user);
        // 修改这里，跳转到UserListServlet1
        request.getRequestDispatcher("/UserListServlet1").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}

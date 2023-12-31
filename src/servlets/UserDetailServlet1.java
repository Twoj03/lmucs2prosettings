package servlets;

import beans.User;
import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDetailServlet1", value = "/UserDetailServlet1")
public class UserDetailServlet1 extends HttpServlet {
    UserDao userDao=new UserDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        User user= userDao.find(id);
        request.setAttribute("g",user);
        request.getRequestDispatcher("playpage1.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}

package servlets;

import beans.User;
import dao.UserDao;
import utils.Page;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "UserListServlet", value = "/UserListServlet")
public class UserListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize=20;
        int pageIndex=1;
        Object pageSizeStr=request.getParameter("pageSize");
        Object pageIndexStr=request.getParameter("pageIndex");
        if(pageSizeStr!=null)
            pageSize=Integer.parseInt(pageSizeStr.toString());
        if(pageIndexStr!=null)
            pageIndex=Integer.parseInt(pageIndexStr.toString());
        UserDao dao=new UserDao();
        Page<User> userLst=dao.findAllByPage(pageIndex,pageSize);
//注意此处是用request域传递对象，对应的JSP页面使用requestScope对象获取userFromDBByPage属性值
        request.setAttribute("userFromDBByPage", userLst);
        RequestDispatcher dispatcher=request.getRequestDispatcher("playerlist.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}





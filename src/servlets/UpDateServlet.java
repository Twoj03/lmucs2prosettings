package servlets;

import beans.User;
import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpDateServlet", value = "/UpDateServlet")
public class UpDateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应的字符编码
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 获取表单数据
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String signature = request.getParameter("signature");
        String a1 = request.getParameter("a1");
        String a2 = request.getParameter("a2");
        String a3 = request.getParameter("a3");
        String a4 = request.getParameter("a4");
        String a5 = request.getParameter("a5");
        String a6 = request.getParameter("a6");
        String b1 = request.getParameter("b1");
        String b2 = request.getParameter("b2");
        String b3 = request.getParameter("b3");
        String c1 = request.getParameter("c1");
        String c2 = request.getParameter("c2");
        String c3 = request.getParameter("c3");
        String c4 = request.getParameter("c4");
        String c5 = request.getParameter("c5");
        String c6 = request.getParameter("c6");
        String c7 = request.getParameter("c7");
        String c8 = request.getParameter("c8");
        String c9 = request.getParameter("c9");
        String c10 = request.getParameter("c10");
        String c11 = request.getParameter("c11");
        String c12 = request.getParameter("c12");
        String c13 = request.getParameter("c13");
        String c14 = request.getParameter("c14");
        String c15 = request.getParameter("c15");
        String c16 = request.getParameter("c16");
        String c17 = request.getParameter("c17");
        String d1 = request.getParameter("d1");
        String d2 = request.getParameter("d2");
        String d3 = request.getParameter("d3");
        String d4 = request.getParameter("d4");
        String steamurl = request.getParameter("steamurl");
        // 创建一个新的User对象
        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setUsername(username);
        user.setAddress(address);
        user.setSignature(signature);
        user.setA1(a1);
        user.setA2(a2);
        user.setA3(a3);
        user.setA4(a4);
        user.setA5(a5);
        user.setA6(a6);
        user.setB1(b1);
        user.setB2(b2);
        user.setB3(b3);
        user.setC1(c1);
        user.setC2(c2);
        user.setC3(c3);
        user.setC4(c4);
        user.setC5(c5);
        user.setC6(c6);
        user.setC7(c7);
        user.setC8(c8);
        user.setC9(c9);
        user.setC10(c10);
        user.setC11(c11);
        user.setC12(c12);
        user.setC13(c13);
        user.setC14(c14);
        user.setC15(c15);
        user.setC16(c16);
        user.setC17(c17);
        user.setD1(d1);
        user.setD2(d2);
        user.setD3(d3);
        user.setD4(d4);
        user.setSteamurl(steamurl);
        // 更新用户信息
        UserDao userDao = new UserDao();
        userDao.updateUser(user);
        String redirectURL = "UserDetailServlet1?id=" + id;
        response.sendRedirect(redirectURL);
    }
}

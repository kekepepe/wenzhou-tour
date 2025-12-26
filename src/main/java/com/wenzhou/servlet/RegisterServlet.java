package com.wenzhou.servlet;

import com.wenzhou.dao.UserDAO;
import com.wenzhou.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 注册Servlet (Register Servlet)
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String realName = req.getParameter("realName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String imagePath = req.getParameter("imagePath"); // Temporary text input

        // 简单的后端验证
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            req.setAttribute("error", "用户名和密码不能为空 (Username/Password required)");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setImagePath(imagePath != null && !imagePath.isEmpty() ? imagePath : "images/default_user.png");

        if (userDAO.registerUser(user)) {
            req.setAttribute("msg", "注册成功，请登录 (Registration Success)");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "注册失败，用户名已存在 (Registration Failed)");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}

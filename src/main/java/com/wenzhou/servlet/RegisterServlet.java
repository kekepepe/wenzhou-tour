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
 * 注册控制层 (Register Servlet)
 * 处理用户注册请求
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 设置编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        // 2. 获取参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String realName = req.getParameter("realName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String imagePath = req.getParameter("imagePath"); // 暂时的文本输入

        // 3. 后端验证
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            req.setAttribute("error", "注册失败：用户名和密码不能为空！(Username/Password required)");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        // 4. 封装对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        // 如果没有图片，使用默认图片
        user.setImagePath((imagePath != null && !imagePath.trim().isEmpty()) ? imagePath : "images/default_user.png");

        // 5. 调用DAO
        boolean success = userDAO.registerUser(user);

        // 6. 处理结果
        if (success) {
            // 注册成功，跳转到登录页，并提示
            req.setAttribute("msg", "恭喜，注册成功！请登录。(Registration Success)");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            // 注册失败（通常是用户名重复），回显错误
            req.setAttribute("error", "注册失败：用户名可能已存在，或系统错误。(Registration Failed)");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

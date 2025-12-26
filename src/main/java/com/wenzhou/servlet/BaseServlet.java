package com.wenzhou.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 基础Servlet，使用反射实现方法分发 (Base Servlet for method dispatching)
 * 请求URL示例: /food?method=list
 */
public abstract class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        // 获取请求的方法名 (Get method name from parameter)
        String methodName = req.getParameter("method");
        if (methodName == null || methodName.trim().isEmpty()) {
            methodName = "list"; // 默认方法
        }

        try {
            // 使用反射调用对应的方法 (Use reflection to call method)
            Method method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            String result = (String) method.invoke(this, req, resp);

            // 根据返回值处理跳转
            if (result != null && !result.trim().isEmpty()) {
                if (result.startsWith("redirect:")) {
                    // 重定向
                    resp.sendRedirect(req.getContextPath() + result.substring(9));
                } else {
                    // 转发
                    req.getRequestDispatcher(result).forward(req, resp);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Method dispatch failed: " + methodName, e);
        }
    }
}

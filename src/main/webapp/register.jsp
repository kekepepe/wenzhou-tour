<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="zh-CN">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>用户注册 (Register) - Wenzhou Tour</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #e9ecef;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .register-container {
                width: 100%;
                max-width: 500px;
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }

            .form-header {
                text-align: center;
                margin-bottom: 25px;
                color: #0d6efd;
            }
        </style>
    </head>

    <body>

        <div class="register-container">
            <h3 class="form-header">用户注册 (User Register)</h3>

            <!-- 错误提示 -->
            <% if (request.getAttribute("error") !=null) { %>
                <div class="alert alert-danger text-center" role="alert">
                    <%= request.getAttribute("error") %>
                </div>
                <% } %>

                    <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
                        <!-- 用户名 -->
                        <div class="mb-3">
                            <label for="username" class="form-label">用户名 (Username) <span
                                    class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名"
                                required>
                        </div>

                        <!-- 密码 -->
                        <div class="mb-3">
                            <label for="password" class="form-label">密码 (Password) <span
                                    class="text-danger">*</span></label>
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="请输入密码" required>
                        </div>

                        <!-- 真实姓名 -->
                        <div class="mb-3">
                            <label for="realName" class="form-label">真实姓名 (Real Name)</label>
                            <input type="text" class="form-control" id="realName" name="realName" placeholder="例如：张三">
                        </div>

                        <!-- 邮箱 -->
                        <div class="mb-3">
                            <label for="email" class="form-label">电子邮箱 (Email)</label>
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="name@example.com">
                        </div>

                        <!-- 电话 -->
                        <div class="mb-3">
                            <label for="phone" class="form-label">联系电话 (Phone)</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入手机号">
                        </div>

                        <!-- 地址 -->
                        <div class="mb-3">
                            <label for="address" class="form-label">家庭地址 (Address)</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="请输入地址">
                        </div>

                        <!-- 头像路径 (暂用文本框) -->
                        <div class="mb-3">
                            <label for="imagePath" class="form-label">头像路径 (Avator Path - Optional)</label>
                            <input type="text" class="form-control" id="imagePath" name="imagePath"
                                value="images/user_default.png">
                        </div>

                        <!-- 提交按钮 -->
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">立即注册 (Register)</button>
                            <a href="${pageContext.request.contextPath}/index.jsp"
                                class="btn btn-link text-center">已有账号？去登录 (Go Login)</a>
                        </div>
                    </form>
        </div>

        <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>
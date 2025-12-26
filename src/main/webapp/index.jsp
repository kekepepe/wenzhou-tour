<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="zh-CN">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>温州旅游网 - 登录 (Login)</title>
        <!-- Bootstrap 5 -->
        <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .login-card {
                background: white;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                width: 100%;
                max-width: 400px;
            }

            .login-header {
                text-align: center;
                margin-bottom: 30px;
                color: #333;
            }

            .login-header h2 {
                font-weight: bold;
                color: #0d6efd;
            }
        </style>
    </head>

    <body>

        <div class="login-card">
            <div class="login-header">
                <h2>温州旅游 (Wenzhou Tour)</h2>
                <p class="text-muted">欢迎回来，请登录</p>
            </div>

            <% if (request.getAttribute("error") !=null) { %>
                <div class="alert alert-danger text-center">
                    <%= request.getAttribute("error") %>
                </div>
                <% } %>
                    <% if (request.getAttribute("msg") !=null) { %>
                        <div class="alert alert-success text-center">
                            <%= request.getAttribute("msg") %>
                        </div>
                        <% } %>

                            <form action="${pageContext.request.contextPath}/login" method="post">
                                <div class="mb-3">
                                    <label class="form-label">用户名 (Username)</label>
                                    <input type="text" name="username" class="form-control" required
                                        placeholder="admin / user">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">密码 (Password)</label>
                                    <input type="password" name="password" class="form-control" required>
                                </div>
                                <div class="d-grid gap-2 mb-3">
                                    <button type="submit" class="btn btn-primary btn-lg">登录 (Login)</button>
                                </div>
                                <div class="text-center">
                                    <a href="${pageContext.request.contextPath}/register.jsp"
                                        class="text-decoration-none">没有账号？去注册 (Register)</a>
                                </div>
                            </form>
        </div>

    </body>

    </html>
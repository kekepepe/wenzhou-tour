<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="zh-CN">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>用户注册 (User Registration)</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                padding-top: 50px;
            }

            .register-card {
                max-width: 600px;
                margin: 0 auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body>

        <div class="container">
            <div class="card register-card">
                <div class="card-header bg-primary text-white text-center">
                    <h3>用户注册 (User Registration)</h3>
                </div>
                <div class="card-body">
                    <!-- Error Message -->
                    <% if (request.getAttribute("error") !=null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                        <% } %>

                            <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
                                <div class="mb-3">
                                    <label class="form-label">用户名 (Username)*</label>
                                    <input type="text" class="form-control" name="username" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">密码 (Password)*</label>
                                    <input type="password" class="form-control" name="password" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">真实姓名 (Real Name)</label>
                                    <input type="text" class="form-control" name="realName">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">邮箱 (Email)</label>
                                    <input type="email" class="form-control" name="email">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">电话 (Phone)</label>
                                    <input type="text" class="form-control" name="phone">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">地址 (Address)</label>
                                    <input type="text" class="form-control" name="address">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">头像路径/URL (Photo Path)</label>
                                    <input type="text" class="form-control" name="imagePath"
                                        placeholder="images/default_user.png">
                                    <div class="form-text">暂用文本输入 (Text input for now)</div>
                                </div>

                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-primary">提交注册 (Register)</button>
                                    <a href="${pageContext.request.contextPath}/index.jsp"
                                        class="btn btn-outline-secondary">返回登录 (Back to Login)</a>
                                </div>
                            </form>
                </div>
                <div class="card-footer text-muted text-center">
                    基于Java的Web开发期末大作业
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.1/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>
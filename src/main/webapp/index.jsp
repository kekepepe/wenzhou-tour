<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Wenzhou Tour - Login</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>

            <jsp:include page="/common/header.jsp" />

            <div class="main-container">
                <!-- On the landing page, we might not want the sidebar, or we want a login form centered.
             Requirement says "Landing Page: Welcome page with a Login form".
             Requirement also says "Home Page Layout: 3 Vertical Sections".
             I will interpret Index as a standalone login/welcome, and Home as the main dashboard.
        -->
                <div class="content" style="display: flex; justify-content: center; align-items: center; width: 100%;">
                    <div class="login-box" style="width: 400px; margin-top: 50px;">
                        <h2 style="text-align: center; margin-bottom: 20px;">欢迎来到温州旅游网</h2>

                        <c:if test="${not empty error}">
                            <div style="color: red; margin-bottom: 10px; text-align: center;">${error}</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="form-group">
                                <label>用户名 (Username):</label>
                                <input type="text" name="username" required>
                            </div>
                            <div class="form-group">
                                <label>密码 (Password):</label>
                                <input type="password" name="password" required>
                            </div>
                            <button type="submit" class="btn" style="width: 100%;">登录 (Login)</button>
                        </form>
                    </div>
                </div>
            </div>

            <jsp:include page="/common/footer.jsp" />

        </body>

        </html>
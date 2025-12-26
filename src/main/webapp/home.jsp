<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <% // 简单的登录检查 if(session.getAttribute("user")==null) { response.sendRedirect(request.getContextPath()
            + "/index.jsp" ); return; } %>
            <!DOCTYPE html>
            <html lang="zh-CN">

            <head>
                <meta charset="UTF-8">
                <title>Wenzhou Tour - Home</title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            </head>

            <body>

                <jsp:include page="/common/header.jsp" />

                <div class="main-container">

                    <jsp:include page="/common/menu.jsp" />

                    <div class="content">
                        <h2>欢迎来到温州旅游信息管理系统</h2>
                        <p>Welcome to Wenzhou Tourism Management System.</p>
                        <p>请点击左侧菜单浏览各个模块。</p>
                        <p>Please select a module from the left menu.</p>

                        <c:if test="${not empty sessionScope.user}">
                            <div style="margin-top: 20px; padding: 20px; background: #eee; border-radius: 5px;">
                                <h3>当前用户信息 (Current User Info)</h3>
                                <p>用户名: ${sessionScope.user.username}</p>
                                <p>角色: ${sessionScope.user.role}</p>
                                <p>邮箱: ${sessionScope.user.email}</p>
                            </div>
                        </c:if>

                    </div>
                </div>

                <jsp:include page="/common/footer.jsp" />

            </body>

            </html>
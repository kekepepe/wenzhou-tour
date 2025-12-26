<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:if test="${user.role != 'admin'}">
            <% response.sendRedirect(request.getContextPath() + "/home.jsp" ); %>
        </c:if>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>景点管理 (Manage Scenic)</title>
            <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
                rel="stylesheet">
        </head>

        <body class="p-4 bg-light">
            <div class="container bg-white p-4 rounded shadow">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3>🏔 景点后台管理 (Scenic Management)</h3>
                    <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-secondary">返回首页 (Back)</a>
                </div>
                <div class="alert alert-info">
                    提示：作为管理员，您可以在 <a href="${pageContext.request.contextPath}/attraction?method=list">景点列表页</a>
                    直接看到删除/编辑按钮。
                </div>
            </div>
        </body>

        </html>
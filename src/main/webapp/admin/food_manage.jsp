<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%-- Check Admin Role --%>
            <c:if test="${user.role != 'admin'}">
                <% response.sendRedirect(request.getContextPath() + "/home.jsp" ); %>
            </c:if>

            <!DOCTYPE html>
            <html lang="zh-CN">

            <head>
                <meta charset="UTF-8">
                <title>美食管理 (Manage Food)</title>
                <!-- Reuse Sidebar Logic or Include? For simplicity, full page with clear back button -->
                <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
                    rel="stylesheet">
            </head>

            <body class="p-4 bg-light">

                <div class="container bg-white p-4 rounded shadow">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3>🍱 美食后台管理 (Food Management)</h3>
                        <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-secondary">返回首页 (Back)</a>
                    </div>

                    <!-- Add Generic Form could be here, or simplified list for now -->
                    <p class="text-muted">请前往前端页面进行添加操作，或者在此处扩展表格。</p>

                    <!-- Currently reusing the content list logic, typically an admin wants a CRUD table -->
                    <!-- Since we rely on Servlet Dispatching, we need to request the list first.
             This JSP should ideally be the TARGET of a Servlet call like /admin/food?method=list
             But for this task, let's keep it simple: Link to the main list but with admin powers enabled.
        -->
                    <div class="alert alert-info">
                        提示：作为管理员，您可以在 <a href="${pageContext.request.contextPath}/food?method=list">美食列表页</a>
                        直接看到删除/编辑按钮。
                        <br>
                        (Tip: As admin, you can see Delete buttons directly on the <a
                            href="${pageContext.request.contextPath}/food?method=list">Food List Page</a>)
                    </div>

                </div>

            </body>

            </html>
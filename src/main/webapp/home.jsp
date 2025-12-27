<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Check login
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
            <!DOCTYPE html>
            <html lang="zh-CN">

            <head>
                <meta charset="UTF-8">
                <title>后台首页 - 温州旅游</title>
                <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
                    rel="stylesheet">
                <style>
                    body {
                        display: flex;
                        flex-direction: column;
                        min-height: 100vh;
                    }

                    /* Top Header */
                    .header {
                        height: 80px;
                        background-color: #0d6efd;
                        color: white;
                        display: flex;
                        align-items: center;
                        padding: 0 20px;
                        justify-content: space-between;
                    }

                    .logo {
                        font-size: 24px;
                        font-weight: bold;
                    }

                    /* Main Layout */
                    .main-container {
                        flex: 1;
                        display: flex;
                    }

                    /* Sidebar */
                    .sidebar {
                        width: 250px;
                        background-color: #343a40;
                        color: white;
                        padding-top: 20px;
                        min-height: calc(100vh - 80px - 60px);
                    }

                    .sidebar a {
                        display: block;
                        padding: 15px 20px;
                        color: #adb5bd;
                        text-decoration: none;
                    }

                    .sidebar a:hover,
                    .sidebar a.active {
                        background-color: #495057;
                        color: white;
                    }

                    /* Content */
                    .content {
                        flex: 1;
                        padding: 30px;
                        background-color: #f8f9fa;
                    }

                    /* Footer */
                    .footer {
                        height: 60px;
                        background-color: #e9ecef;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        color: #6c757d;
                    }
                </style>
            </head>

            <body>

                <!-- 1. Top Header -->
                <div class="header">
                    <div class="logo">CJLU 温州旅游系统</div>
                    <div>
                        Welcome, ${user.realName != null ? user.realName : user.username}
                        <span class="badge bg-warning text-dark">${user.role}</span>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm ms-2">退出
                            (Logout)</a>
                    </div>
                </div>

                <div class="main-container">
                    <!-- 2. Left Sidebar -->
                    <div class="sidebar">
                        <div class="text-center mb-4">
                            <img src="${user.imagePath != null ? user.imagePath : 'images/default_user.png'}"
                                class="rounded-circle" width="80" height="80"
                                style="object-fit:cover; border:2px solid white;">
                            <div class="mt-2 text-white">${user.username}</div>
                        </div>
                        <a href="home.jsp" class="active">🏠 个人介绍 (Profile)</a>
                        <a href="${pageContext.request.contextPath}/food?method=list">🍜 美食 (Food)</a>
                        <a href="${pageContext.request.contextPath}/attraction?method=list">🏔 景点 (Scenic)</a>
                        <a href="${pageContext.request.contextPath}/culture?method=list">🎭 文化 (Culture)</a>
                        <a href="#">💬 留言板 (Messages)</a>
                        <c:if test="${user.role == 'admin'}">
                            <div class="border-top my-2 mx-3 border-secondary"></div>
                            <div class="px-3 text-secondary small text-uppercase mb-1">Management</div>
                            <a href="${pageContext.request.contextPath}/admin/food_manage.jsp">⚙️ 美食管理 (Manage Food)</a>
                            <a href="${pageContext.request.contextPath}/admin/scenic_manage.jsp">⚙️ 景点管理 (Manage
                                Scenic)</a>
                            <a href="${pageContext.request.contextPath}/admin/culture_manage.jsp">⚙️ 文化管理 (Manage
                                Culture)</a>
                        </c:if>
                    </div>

                    <!-- 3. Right Content Area -->
                    <div class="content">
                        <div class="card shadow-sm">
                            <div class="card-header bg-white">
                                <h4>个人信息 (My Profile)</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 text-center">
                                        <img src="${user.imagePath}" class="img-fluid rounded mb-3"
                                            style="max-height:200px;">
                                    </div>
                                    <div class="col-md-8">
                                        <p><strong>用户名 (Username):</strong> ${user.username}</p>
                                        <p><strong>真实姓名 (Real Name):</strong> ${user.realName}</p>
                                        <p><strong>角色 (Role):</strong> ${user.role}</p>
                                        <p><strong>电话 (Phone):</strong> ${user.phone}</p>
                                        <p><strong>邮箱 (Email):</strong> ${user.email}</p>
                                        <p><strong>地址 (Address):</strong> ${user.address}</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="alert alert-info mt-4">
                            <h5>系统公告 (Announcements)</h5>
                            <p>欢迎来到温州旅游展示系统！这里汇集了温州的美食、美景和深厚的文化底蕴。</p>
                        </div>
                    </div>
                </div>

                <!-- 4. Footer -->
                <div class="footer">
                    &copy; 2025 CJLU Student Project | ID: 2200303212 | Name: Kepeng | Email: kepeng@example.com
                </div>

            </body>

            </html>
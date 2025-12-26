<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="logo-area">
        <!-- Placeholder for Logo if available, otherwise just text -->
        <!-- <img src="${pageContext.request.contextPath}/images/logo.png" alt="ZJU-LI Logo" class="logo"> -->
        <h1>ZJU-LI (计量大学) - 基于Java的Web开发期末大作业</h1>
    </div>
    <div class="user-info">
        <c:if test="${not empty sessionScope.user}">
            <span>Welcome, ${sessionScope.user.username} !</span>
            <a href="${pageContext.request.contextPath}/logout" style="color: white; margin-left: 10px;">Logout</a>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <a href="${pageContext.request.contextPath}/index.jsp" style="color: white;">Login</a>
        </c:if>
    </div>
</header>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="sidebar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/home.jsp">首页 (Home)</a></li>
            <li><a href="${pageContext.request.contextPath}/food/list">温州美食 (Food)</a></li>
            <li><a href="${pageContext.request.contextPath}/attractions/list">温州景点 (Attractions)</a></li>
            <li><a href="${pageContext.request.contextPath}/culture/list">温州文化 (Culture)</a></li>
            <li><a href="${pageContext.request.contextPath}/user/profile">个人中心 (Profile)</a></li>
            <c:if test="${sessionScope.user.role == 'admin'}">
                <li><a href="${pageContext.request.contextPath}/admin/users">用户管理 (User Mgmt)</a></li>
            </c:if>
        </ul>
    </div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>温州美食 (Wenzhou Food)</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                }

                th,
                td {
                    padding: 10px;
                    border: 1px solid #ddd;
                    text-align: left;
                }

                th {
                    background-color: #f2f2f2;
                }

                .action-bar {
                    margin-bottom: 20px;
                    display: flex;
                    justify-content: space-between;
                }

                .food-img {
                    width: 80px;
                    height: 60px;
                    object-fit: cover;
                }
            </style>
        </head>

        <body>
            <jsp:include page="/common/header.jsp" />
            <div class="main-container">
                <jsp:include page="/common/menu.jsp" />
                <div class="content">
                    <h2>温州美食 (Wenzhou Food)</h2>

                    <div class="action-bar">
                        <form action="${pageContext.request.contextPath}/food" method="get">
                            <input type="hidden" name="method" value="list">
                            <input type="text" name="keyword" placeholder="搜索美食 (Search)...">
                            <button type="submit" class="btn">搜索 (Search)</button>
                        </form>
                        <button class="btn" onclick="document.getElementById('addForm').style.display='block'">添加美食 (Add
                            Food)</button>
                    </div>

                    <!-- Add/Edit Form (Hidden by default, simple toggle for demo) -->
                    <div id="addForm"
                        style="display:none; background:#f9f9f9; padding:20px; margin-bottom:20px; border:1px solid #ddd;">
                        <h3>添加/编辑美食</h3>
                        <form action="${pageContext.request.contextPath}/food" method="post">
                            <input type="hidden" name="method" value="save">
                            <input type="hidden" name="id" value=""> <!-- Empty for add -->
                            <div class="form-group"><label>名称 (Name):</label><input type="text" name="name" required>
                            </div>
                            <div class="form-group"><label>描述 (Desc):</label><input type="text" name="description">
                            </div>
                            <div class="form-group"><label>历史 (History):</label><input type="text" name="history"></div>
                            <div class="form-group"><label>口味 (Taste):</label><input type="text" name="taste"></div>
                            <div class="form-group"><label>图片路径 (Image Path):</label><input type="text" name="imagePath"
                                    value="images/food_default.jpg"></div>
                            <div class="form-group"><label>推荐地点 (Place):</label><input type="text"
                                    name="recommendPlace"></div>
                            <button type="submit" class="btn">保存 (Save)</button>
                            <button type="button" class="btn" style="background:#888;"
                                onclick="document.getElementById('addForm').style.display='none'">取消 (Cancel)</button>
                        </form>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>图片 (Image)</th>
                                <th>名称 (Name)</th>
                                <th>描述 (Description)</th>
                                <th>口味 (Taste)</th>
                                <th>操作 (Actions)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="f">
                                <tr>
                                    <td>${f.id}</td>
                                    <td><img src="${pageContext.request.contextPath}/${f.imagePath}" class="food-img"
                                            alt="${f.name}"></td>
                                    <td>${f.name}</td>
                                    <td>${f.description}</td>
                                    <td>${f.taste}</td>
                                    <td>
                                        <!-- Edit could be implemented by populating the form via JS or a separate page. For simplicity, we just have delete here. -->
                                        <a href="${pageContext.request.contextPath}/food?method=delete&id=${f.id}"
                                            onclick="return confirm('确认删除? (Confirm Delete?)')">删除 (Delete)</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <jsp:include page="/common/footer.jsp" />
        </body>

        </html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>温州文化 (Wenzhou Culture)</title>
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

                .img-thumb {
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
                    <h2>温州文化 (Wenzhou Culture)</h2>

                    <div class="action-bar">
                        <form action="${pageContext.request.contextPath}/culture" method="get">
                            <input type="hidden" name="method" value="list">
                            <input type="text" name="keyword" placeholder="搜索文化...">
                            <button type="submit" class="btn">搜索 (Search)</button>
                        </form>
                        <button class="btn" onclick="document.getElementById('addForm').style.display='block'">添加文化
                            (Add)</button>
                    </div>

                    <div id="addForm"
                        style="display:none; background:#f9f9f9; padding:20px; margin-bottom:20px; border:1px solid #ddd;">
                        <h3>添加/编辑文化</h3>
                        <form action="${pageContext.request.contextPath}/culture" method="post">
                            <input type="hidden" name="method" value="save">
                            <div class="form-group"><label>名称 (Name):</label><input type="text" name="name" required>
                            </div>
                            <div class="form-group"><label>类型 (Type):</label><input type="text" name="type"></div>
                            <div class="form-group"><label>描述 (Desc):</label><input type="text" name="description">
                            </div>
                            <div class="form-group"><label>历史 (History):</label><input type="text" name="history"></div>
                            <div class="form-group"><label>状态 (Status):</label><input type="text" name="status"
                                    value="Active"></div>
                            <div class="form-group"><label>图片 (Image):</label><input type="text" name="imagePath"
                                    value="images/culture_default.jpg"></div>
                            <button type="submit" class="btn">保存 (Save)</button>
                            <button type="button" class="btn" style="background:#888;"
                                onclick="document.getElementById('addForm').style.display='none'">取消</button>
                        </form>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>图片</th>
                                <th>名称</th>
                                <th>类型</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="c">
                                <tr>
                                    <td>${c.id}</td>
                                    <td><img src="${pageContext.request.contextPath}/${c.imagePath}" class="img-thumb">
                                    </td>
                                    <td>${c.name}</td>
                                    <td>${c.type}</td>
                                    <td>${c.status}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/culture?method=delete&id=${c.id}"
                                            onclick="return confirm('Confirm Delete?')">Delete</a>
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
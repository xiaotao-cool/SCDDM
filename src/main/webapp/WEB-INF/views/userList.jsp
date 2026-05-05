<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
            font-family: "Microsoft YaHei", sans-serif;
        }
        .container {
            max-width: 1200px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,.1);
        }
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            font-size: 20px;
            font-weight: 600;
            padding: 20px;
        }
        .btn {
            border-radius: 8px;
        }
        .back-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            border-radius: 50px;
        }
    </style>
</head>

<body>

<!-- 返回首页 -->
<a href="${pageContext.request.contextPath}/index"
   class="btn btn-secondary back-btn">
    <i class="bi bi-arrow-left"></i> 返回首页
</a>

<div class="container">
    <div class="card">

        <!-- 标题 + 新增按钮 -->
        <div class="card-header d-flex justify-content-between align-items-center">
            <span><i class="bi bi-people"></i> 用户管理</span>

            <!-- 只有 ADMIN 能看到 -->
            <sec:authorize access="hasRole('ADMIN')">
                <a href="${pageContext.request.contextPath}/user/addPage"
                   class="btn btn-light btn-sm">
                    <i class="bi bi-plus-circle"></i> 新增用户
                </a>
            </sec:authorize>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="thead-light">
                    <tr>
                        <th>用户名</th>
                        <th>角色</th>
                        <th>部门</th>
                        <th>状态</th>
                        <th style="width: 120px;">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:choose>
                        <c:when test="${empty list}">
                            <tr>
                                <td colspan="5" class="text-muted py-4">
                                    <i class="bi bi-inbox"></i> 暂无用户数据
                                </td>
                            </tr>
                        </c:when>

                        <c:otherwise>
                            <c:forEach items="${list}" var="u">
                                <tr>
                                    <td>${u.username}</td>

                                    <td>
                                        <span class="badge badge-info">
                                                ${u.role}
                                        </span>
                                    </td>

                                    <td>${u.department}</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${u.enabled == 1}">
                                                <span class="badge badge-success">启用</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-secondary">禁用</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <!-- 操作列 -->
                                    <td>
                                        <!-- 只有 ADMIN 能看到删除 -->
                                        <sec:authorize access="hasRole('ADMIN')">
                                            <a href="${pageContext.request.contextPath}/user/delete/${u.id}"
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('确认删除该用户？');">
                                                <i class="bi bi-trash"></i> 删除
                                            </a>
                                        </sec:authorize>

                                        <!-- 普通用户显示 -->
                                        <sec:authorize access="!hasRole('ADMIN')">
                                            <span class="text-muted">无权限</span>
                                        </sec:authorize>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>


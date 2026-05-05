<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>维修记录</title>

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
        .container { max-width: 1200px; }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,.1);
        }
        .card-header {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: #fff;
            font-size: 20px;
            font-weight: 600;
        }
        .badge {
            padding: 6px 14px;
            border-radius: 6px;
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

<!-- 返回 -->
<a href="${pageContext.request.contextPath}/index" class="btn btn-secondary back-btn">
    <i class="bi bi-arrow-left"></i> 返回首页
</a>

<div class="container">
    <div class="card">
        <div class="card-header">
            <i class="bi bi-tools"></i> 设备维修记录
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover text-center">
                <thead class="thead-light">
                <tr>
                    <th>设备ID</th>
                    <th>维修原因</th>
                    <th>维修人员</th>
                    <th>费用</th>
                    <th>状态</th>
                    <th style="width:120px">操作</th>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="6" class="text-muted py-4">
                                <i class="bi bi-inbox"></i> 暂无维修记录
                            </td>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach items="${list}" var="m">
                            <tr>
                                <td>${m.deviceId}</td>
                                <td class="text-left">${m.reason}</td>
                                <td>${m.maintainer}</td>
                                <td>${m.cost}</td>
                                <td>
                                    <span class="badge badge-info">${m.status}</span>
                                </td>

                                <!-- ===== 操作列 ===== -->
                                <td>
                                    <!-- 管理员 -->
                                    <sec:authorize access="hasRole('ADMIN')">
                                        <form action="${pageContext.request.contextPath}/maintenance/delete"
                                              method="post"
                                              style="display:inline;"
                                              onsubmit="return confirm('确定删除该维修记录吗？');">
                                            <input type="hidden" name="id" value="${m.id}">
                                            <button class="btn btn-danger btn-sm">
                                                <i class="bi bi-trash"></i> 删除
                                            </button>
                                        </form>
                                    </sec:authorize>

                                    <!-- 普通用户 -->
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>


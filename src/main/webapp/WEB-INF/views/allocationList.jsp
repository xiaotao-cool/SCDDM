<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>设备调配申请管理</title>

    <!-- Bootstrap 4.6.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
            font-family: "Microsoft YaHei", sans-serif;
        }
        .container {
            max-width: 1400px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,.1);
        }
        .card-header {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: #fff;
            font-size: 20px;
            font-weight: 600;
        }
        .badge {
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 14px;
        }
        .btn-sm {
            padding: 6px 14px;
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
        <div class="card-header d-flex justify-content-between align-items-center">
            <span><i class="bi bi-arrow-left-right"></i> 设备调配申请列表</span>
            <a href="${pageContext.request.contextPath}/allocation/applyPage"
               class="btn btn-light btn-sm">
                <i class="bi bi-plus-circle"></i> 新增调配申请
            </a>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover text-center">
                <thead class="thead-light">
                <tr>
                    <th>申请编号</th>
                    <th>设备ID</th>
                    <th>调出部门</th>
                    <th>调入部门</th>
                    <th>申请原因</th>
                    <th>申请时间</th>
                    <th>状态</th>
                    <th style="width:220px">操作</th>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="8" class="text-muted py-4">
                                <i class="bi bi-inbox"></i> 暂无调配申请记录
                            </td>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach items="${list}" var="a">
                            <tr>
                                <td>${a.id}</td>
                                <td>${a.deviceId}</td>
                                <td>${a.fromDept}</td>
                                <td>${a.toDept}</td>
                                <td class="text-left">${a.reason}</td>
                                <td>${a.applyTime}</td>

                                <!-- ===== 状态 ===== -->
                                <td>
                                    <c:choose>
                                        <c:when test="${a.status == '待审批'}">
                                            <span class="badge badge-warning">待审批</span>
                                        </c:when>
                                        <c:when test="${a.status == '已同意'}">
                                            <span class="badge badge-success">已同意</span>
                                        </c:when>
                                        <c:when test="${a.status == '已拒绝'}">
                                            <span class="badge badge-danger">已拒绝</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-secondary">${a.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <!-- ===== 操作 ===== -->
                                <td>

                                    <!-- 管理员 -->
                                    <sec:authorize access="hasRole('ADMIN')">

                                        <c:if test="${a.status == '待审批'}">
                                            <!-- 同意 -->
                                            <form action="${pageContext.request.contextPath}/allocation/approve"
                                                  method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${a.id}">
                                                <input type="hidden" name="pass" value="true">
                                                <button class="btn btn-success btn-sm">
                                                    <i class="bi bi-check"></i>
                                                </button>
                                            </form>

                                            <!-- 拒绝 -->
                                            <form action="${pageContext.request.contextPath}/allocation/approve"
                                                  method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${a.id}">
                                                <input type="hidden" name="pass" value="false">
                                                <button class="btn btn-danger btn-sm ml-1">
                                                    <i class="bi bi-x"></i>
                                                </button>
                                            </form>
                                        </c:if>

                                        <!-- 删除 -->
                                        <form action="${pageContext.request.contextPath}/allocation/delete"
                                              method="post"
                                              style="display:inline;"
                                              onsubmit="return confirm('确定删除该申请吗？');">
                                            <input type="hidden" name="id" value="${a.id}">
                                            <button class="btn btn-outline-danger btn-sm ml-1">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </form>

                                    </sec:authorize>

                                    <!-- 普通用户 -->
                                    <sec:authorize access="!hasRole('ADMIN')">
                                        <span class="text-muted">无可操作</span>
                                    </sec:authorize>

                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <div class="card-footer text-center text-muted bg-light">
            软件学院设备管理系统 · 设备调配管理模块
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>库存盘点记录</title>

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
        .container { max-width: 1400px; }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,.1);
        }
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
        <div class="card-header d-flex justify-content-between align-items-center">
            <span><i class="bi bi-clipboard-data"></i> 库存盘点记录</span>
            <a href="${pageContext.request.contextPath}/inventory/checkPage"
               class="btn btn-light btn-sm">
                <i class="bi bi-plus-circle"></i> 新增盘点
            </a>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover text-center">
                <thead class="thead-light">
                <tr>
                    <th>设备ID</th>
                    <th>系统库存</th>
                    <th>实际库存</th>
                    <th>差异</th>
                    <th>结果</th>
                    <th>盘点人</th>
                    <th>时间</th>
                    <th style="width:120px">操作</th>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="8" class="text-muted py-4">
                                <i class="bi bi-inbox"></i> 暂无盘点记录
                            </td>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach items="${list}" var="i">
                            <tr>
                                <td>${i.deviceId}</td>
                                <td>${i.systemQty}</td>
                                <td>${i.actualQty}</td>
                                <td>${i.diffQty}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${i.result == '盘盈'}">
                                            <span class="badge badge-success">盘盈</span>
                                        </c:when>
                                        <c:when test="${i.result == '盘亏'}">
                                            <span class="badge badge-danger">盘亏</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-secondary">正常</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${i.checker}</td>
                                <td>${i.checkTime}</td>

                                <!-- ===== 操作（只有 ADMIN） ===== -->
                                <td>
                                    <sec:authorize access="hasRole('ADMIN')">
                                        <form action="${pageContext.request.contextPath}/inventory/delete"
                                              method="post"
                                              onsubmit="return confirm('确定删除该盘点记录吗？');"
                                              style="display:inline;">
                                            <input type="hidden" name="id" value="${i.id}">
                                            <button class="btn btn-outline-danger btn-sm">
                                                <i class="bi bi-trash"></i> 删除
                                            </button>
                                        </form>
                                    </sec:authorize>

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

        <div class="card-footer text-center text-muted bg-light">
            软件学院设备管理系统 · 库存盘点模块
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

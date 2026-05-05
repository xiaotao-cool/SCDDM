<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>报废审批</title>
    
    <!-- Bootstrap 4.6.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px 0;
            font-family: 'Microsoft YaHei', sans-serif;
        }
        
        .container {
            max-width: 1200px;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .card-header {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            color: white;
            padding: 20px 25px;
            border: none;
            font-size: 20px;
            font-weight: 600;
        }
        
        .card-body {
            padding: 25px;
            background: white;
        }
        
        .table {
            margin-bottom: 0;
        }
        
        .table thead th {
            background: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            font-weight: 600;
            color: #495057;
            padding: 15px;
        }
        
        .table tbody td {
            padding: 15px;
            vertical-align: middle;
        }
        
        .table tbody tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s;
        }
        
        .btn {
            border-radius: 8px;
            padding: 8px 20px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .btn-sm {
            padding: 6px 15px;
            font-size: 14px;
        }
        
        .back-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
            border-radius: 50px;
            padding: 12px 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<!-- 返回按钮 -->
<a href="${pageContext.request.contextPath}/index" class="btn btn-secondary back-btn">
    <i class="bi bi-arrow-left"></i> 返回首页
</a>

<div class="container">
    <div class="card">
        <div class="card-header">
            <i class="bi bi-clipboard-check"></i> 报废审批列表
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="thead-light">
                    <tr>
                        <th>设备ID</th>
                        <th>原因</th>
                        <th>申请时间</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${scraps}" var="s">
                        <tr>
                            <td>${s.deviceId}</td>
                            <td class="text-left">${s.reason}</td>
                            <td>${s.applyTime}</td>
                            <td>
                                <span class="badge badge-info">${s.approveStatus}</span>
                            </td>
                            <td>
                                <!-- 仅管理员可见 -->
                                <sec:authorize access="hasRole('ADMIN')">

                                    <!-- 审批 -->
                                    <c:if test="${s.approveStatus == '审批中'}">
                                        <form action="${pageContext.request.contextPath}/scrap/approve"
                                              method="post" style="display:inline;">
                                            <input type="hidden" name="scrapId" value="${s.id}"/>
                                            <button type="submit" class="btn btn-success btn-sm">
                                                <i class="bi bi-check-circle"></i> 通过
                                            </button>
                                        </form>
                                    </c:if>

                                    <!-- 删除 -->
                                    <form action="${pageContext.request.contextPath}/scrap/delete"
                                          method="post"
                                          style="display:inline;"
                                          onsubmit="return confirm('确定要删除该报废申请吗？');">
                                        <input type="hidden" name="id" value="${s.id}"/>
                                        <button type="submit" class="btn btn-danger btn-sm">
                                            <i class="bi bi-trash"></i> 删除
                                        </button>
                                    </form>

                                </sec:authorize>

                                <!-- 非管理员显示 -->
                                <sec:authorize access="!hasRole('ADMIN')">
                                    <span class="text-muted">无权限</span>
                                </sec:authorize>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty scraps}">
                        <tr>
                            <td colspan="5" class="text-muted py-4">
                                <i class="bi bi-inbox"></i> 暂无报废申请记录
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

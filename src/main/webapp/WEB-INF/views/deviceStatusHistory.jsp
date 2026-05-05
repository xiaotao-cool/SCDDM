<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>状态变更历史</title>
    
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
            max-width: 1000px;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .card-header {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
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
        
        .badge {
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
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
<a href="${pageContext.request.contextPath}/device/status?deviceId=${deviceId}" class="btn btn-secondary back-btn">
    <i class="bi bi-arrow-left"></i> 返回状态管理
</a>

<div class="container">
    <div class="card">
        <div class="card-header">
            <i class="bi bi-clock-history"></i> 设备状态变更历史
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="thead-light">
                    <tr>
                        <th>原状态</th>
                        <th>新状态</th>
                        <th>操作人</th>
                        <th>变更时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${logs}" var="log">
                        <tr>
                            <td><span class="badge badge-secondary">${log.oldStatus}</span></td>
                            <td><span class="badge badge-info">${log.newStatus}</span></td>
                            <td>${log.operator}</td>
                            <td>${log.changeTime}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty logs}">
                        <tr>
                            <td colspan="4" class="text-muted py-4">
                                <i class="bi bi-inbox"></i> 暂无状态变更记录
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

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>设备列表</title>
    
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
            max-width: 1400px;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px 25px;
            border: none;
            font-size: 20px;
            font-weight: 600;
        }
        
        .card-header .btn {
            border-radius: 8px;
            padding: 8px 20px;
            font-weight: 500;
            transition: transform 0.2s;
        }
        
        .card-header .btn:hover {
            transform: translateY(-2px);
        }
        
        .card-body {
            padding: 25px;
            background: white;
        }
        
        .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 10px 15px;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .btn {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
        }
        
        .btn-success {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            border: none;
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
        <!-- 标题栏 -->
        <div class="card-header d-flex justify-content-between align-items-center">
            <span><i class="bi bi-list-ul"></i> 设备列表</span>
            <a href="${pageContext.request.contextPath}/devices/add" class="btn btn-light btn-sm">
                <i class="bi bi-plus-circle"></i> 新增设备
            </a>
        </div>

        <div class="card-body">
            <!-- 查询区域 -->
            <form action="${pageContext.request.contextPath}/devices/list" method="get" class="mb-4">
                <div class="form-row">
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="name" 
                               placeholder="设备名称" value="${param.name}">
                    </div>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="model" 
                               placeholder="型号" value="${param.model}">
                    </div>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="status" 
                               placeholder="状态" value="${param.status}">
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary btn-block">
                            <i class="bi bi-search"></i> 查询
                        </button>
                        <a href="${pageContext.request.contextPath}/devices/list" 
                           class="btn btn-secondary btn-block mt-2">
                            <i class="bi bi-arrow-clockwise"></i> 重置
                        </a>
                        <a class="btn btn-success btn-block mt-2"
                           href="${pageContext.request.contextPath}/devices/export?name=${param.name}&model=${param.model}&status=${param.status}">
                            <i class="bi bi-file-earmark-excel"></i> 导出 Excel
                        </a>
                    </div>
                </div>
            </form>

            <!-- 表格区域 -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="thead-light">
                    <tr>
                        <th>设备名称</th>
                        <th>型号</th>
                        <th>规格</th>
                        <th>购置日期</th>
                        <th>供应商</th>
                        <th>状态</th>
                        <th width="180">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <jsp:useBean id="devices" scope="request" type="java.util.List"/>
                    <c:forEach var="device" items="${devices}">
                        <tr>
                            <td>${device.name}</td>
                            <td>${device.model}</td>
                            <td>${device.specification}</td>
                            <td>
                                <fmt:formatDate value="${device.purchaseDate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>${device.supplier}</td>
                            <td>
                                <span class="badge badge-info">${device.status}</span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/devices/edit/${device.id}"
                                   class="btn btn-primary btn-sm">
                                    <i class="bi bi-gear"></i> 管理
                                </a>
                                <a href="${pageContext.request.contextPath}/devices/delete/${device.id}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('确定要删除该设备吗？')">
                                    <i class="bi bi-trash"></i> 删除
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty devices}">
                        <tr>
                            <td colspan="7" class="text-muted py-4">
                                <i class="bi bi-inbox"></i> 暂无设备数据
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

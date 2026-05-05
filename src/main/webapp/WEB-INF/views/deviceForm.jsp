<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>设备信息维护</title>
    
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
            max-width: 900px;
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
            font-size: 22px;
            font-weight: 600;
            text-align: center;
        }
        
        .card-body {
            padding: 30px;
            background: white;
        }
        
        .form-group label {
            font-weight: 500;
            color: #333;
            margin-bottom: 8px;
        }
        
        .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 12px 15px;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .btn {
            border-radius: 8px;
            padding: 12px 25px;
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
        
        .btn-info {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            border: none;
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            border: none;
            color: white;
        }
        
        .btn-danger {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            border: none;
            color: white;
        }
        
        .divider {
            border-top: 2px dashed #dee2e6;
            margin: 30px 0;
        }
        
        .btn-area .btn {
            min-width: 150px;
            margin: 8px;
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
<a href="${pageContext.request.contextPath}/devices/list" class="btn btn-secondary back-btn">
    <i class="bi bi-arrow-left"></i> 返回列表
</a>

<div class="container">
    <div class="card">
        <div class="card-header">
            <i class="bi bi-gear"></i> 设备信息维护
        </div>

        <div class="card-body">
            <!-- 表单 -->
            <form action="${pageContext.request.contextPath}/devices/${empty device.id ? 'add' : 'edit'}" method="post">
                <c:if test="${not empty device.id}">
                    <input type="hidden" name="id" value="${device.id}"/>
                </c:if>

                <div class="form-group">
                    <label><i class="bi bi-tag"></i> 设备名称</label>
                    <input type="text" class="form-control" name="name" 
                           value="${device.name}" required>
                </div>

                <div class="form-group">
                    <label><i class="bi bi-box"></i> 型号</label>
                    <input type="text" class="form-control" name="model" 
                           value="${device.model}">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-rulers"></i> 规格</label>
                    <input type="text" class="form-control" name="specification" 
                           value="${device.specification}">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-calendar"></i> 购置日期</label>
                    <input type="date" class="form-control" name="purchaseDate"
                           value="<fmt:formatDate value='${device.purchaseDate}' pattern='yyyy-MM-dd'/>">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-shop"></i> 供应商</label>
                    <input type="text" class="form-control" name="supplier" 
                           value="${device.supplier}">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-info-circle"></i> 设备状态</label>
                    <select class="form-control" name="status">
                        <option value="在用" ${device.status=='在用'?'selected':''}>在用</option>
                        <option value="闲置" ${device.status=='闲置'?'selected':''}>闲置</option>
                        <option value="维修中" ${device.status=='维修中'?'selected':''}>维修中</option>
                        <option value="报废" ${device.status=='报废'?'selected':''}>报废</option>
                    </select>
                </div>

                <!-- 保存 & 返回 -->
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-check-circle"></i> 保存修改
                    </button>
                    <a href="${pageContext.request.contextPath}/devices/list"
                       class="btn btn-secondary btn-lg ml-3">
                        <i class="bi bi-x-circle"></i> 取消
                    </a>
                </div>
            </form>

            <!-- 分隔线 -->
            <div class="divider"></div>

            <!-- 功能模块入口 -->
            <c:if test="${not empty device.id}">
                <div class="text-center btn-area">
                    <a href="${pageContext.request.contextPath}/device/status?deviceId=${device.id}"
                       class="btn btn-info">
                        <i class="bi bi-activity"></i> 状态管理
                    </a>

                    <a href="${pageContext.request.contextPath}/maintenance/add?deviceId=${device.id}"
                       class="btn btn-warning">
                        <i class="bi bi-tools"></i> 维修管理
                    </a>

                    <a href="${pageContext.request.contextPath}/scrap/apply?deviceId=${device.id}"
                       class="btn btn-danger"
                       onclick="return confirm('确定要进行报废申请吗？')">
                        <i class="bi bi-trash"></i> 报废管理
                    </a>
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

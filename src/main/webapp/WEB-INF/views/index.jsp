<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统首页</title>
    
    <!-- Bootstrap 4.6.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Microsoft YaHei', sans-serif;
        }
        
        .navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .navbar-brand {
            font-weight: 600;
            font-size: 20px;
            color: white !important;
        }
        
        .container {
            padding: 40px 20px;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            transition: all 0.3s;
            height: 100%;
            background: white;
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
        }
        
        .card-body {
            padding: 30px;
            text-align: center;
        }
        
        .card-title {
            font-size: 22px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }
        
        .card-text {
            color: #666;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .card-icon {
            font-size: 48px;
            margin-bottom: 15px;
            display: block;
        }
        
        .btn {
            border-radius: 8px;
            padding: 10px 25px;
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
        
        .btn-success {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            border: none;
        }
        
        .logout-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
        }
        
        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            color: white;
        }
    </style>
</head>
<body>

<!-- 顶部导航 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="bi bi-box-seam"></i> 设备管理系统
        </a>
        <div class="ml-auto">
            <a href="${pageContext.request.contextPath}/login" class="btn logout-btn btn-sm">
                <i class="bi bi-box-arrow-right"></i> 退出登录
            </a>
        </div>
    </div>
</nav>

<!-- 主体内容 -->
<div class="container">
    <div class="row">
        <!-- 设备管理 -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="card-body">
                    <i class="bi bi-laptop card-icon text-primary"></i>
                    <h5 class="card-title">设备管理</h5>
                    <p class="card-text">设备信息维护与管理</p>
                    <a href="${pageContext.request.contextPath}/devices/list" class="btn btn-primary btn-sm">
                        <i class="bi bi-arrow-right"></i> 进入
                    </a>
                </div>
            </div>
        </div>

        <!-- 用户管理 -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="card-body">
                    <i class="bi bi-people card-icon text-info"></i>
                    <h5 class="card-title">用户管理</h5>
                    <p class="card-text">用户信息添加与管理</p>
                    <a href="${pageContext.request.contextPath}/user/list" class="btn btn-info btn-sm">
                        <i class="bi bi-arrow-right"></i> 进入
                    </a>
                </div>
            </div>
        </div>

        <!-- 维修管理 -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="card-body">
                    <i class="bi bi-tools card-icon text-warning"></i>
                    <h5 class="card-title">维修管理</h5>
                    <p class="card-text">设备维修记录管理</p>
                    <a href="${pageContext.request.contextPath}/maintenance/list" class="btn btn-warning btn-sm">
                        <i class="bi bi-arrow-right"></i> 进入
                    </a>
                </div>
            </div>
        </div>

        <!-- 库存盘点 -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="card-body">
                    <i class="bi bi-clipboard-data card-icon text-success"></i>
                    <h5 class="card-title">库存盘点</h5>
                    <p class="card-text">库存核对与管理</p>
                    <a href="${pageContext.request.contextPath}/inventory/list" class="btn btn-success btn-sm">
                        <i class="bi bi-arrow-right"></i> 进入
                    </a>
                </div>
            </div>
        </div>

        <!-- 调配管理 -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="card-body">
                    <i class="bi bi-arrow-left-right card-icon" style="color: #11998e;"></i>
                    <h5 class="card-title">调配管理</h5>
                    <p class="card-text">设备调配申请管理</p>
                    <a href="${pageContext.request.contextPath}/allocation/list" class="btn btn-info btn-sm">
                        <i class="bi bi-arrow-right"></i> 进入
                    </a>
                </div>
            </div>
        </div>

        <!-- 报废管理 -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="card-body">
                    <i class="bi bi-trash card-icon text-danger"></i>
                    <h5 class="card-title">报废管理</h5>
                    <p class="card-text">设备报废审批管理</p>
                    <a href="${pageContext.request.contextPath}/scrap/list" class="btn btn-danger btn-sm">
                        <i class="bi bi-arrow-right"></i> 进入
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

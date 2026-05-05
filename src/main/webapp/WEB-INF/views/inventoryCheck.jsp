<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>库存盘点</title>
    
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
            max-width: 700px;
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
        
        .card-body {
            padding: 30px;
            background: white;
        }
        
        .card-footer {
            background: #f8f9fa;
            padding: 15px;
            text-align: center;
            color: #6c757d;
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
<a href="${pageContext.request.contextPath}/inventory/list" class="btn btn-secondary back-btn">
    <i class="bi bi-arrow-left"></i> 返回列表
</a>

<div class="container">
    <div class="card">
        <div class="card-header">
            <i class="bi bi-clipboard-check"></i> 设备库存盘点
        </div>

        <div class="card-body">
            <form action="${pageContext.request.contextPath}/inventory/check" method="post">
                <div class="form-group">
                    <label><i class="bi bi-tag"></i> 设备ID</label>
                    <input type="number" name="deviceId" class="form-control" required 
                           placeholder="请输入设备ID">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-database"></i> 系统库存数量</label>
                    <input type="number" name="systemQty" class="form-control" required 
                           placeholder="请输入系统库存数量">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-check-circle"></i> 实际盘点数量</label>
                    <input type="number" name="actualQty" class="form-control" required 
                           placeholder="请输入实际盘点数量">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-person"></i> 盘点人员</label>
                    <input type="text" name="checker" class="form-control" required 
                           placeholder="请输入盘点人员姓名">
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-check-circle"></i> 提交盘点
                    </button>
                    <a href="${pageContext.request.contextPath}/inventory/list"
                       class="btn btn-secondary btn-lg ml-3">
                        <i class="bi bi-x-circle"></i> 取消
                    </a>
                </div>
            </form>
        </div>

        <div class="card-footer">
            系统将自动计算盘盈盘亏
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

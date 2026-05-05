<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>设备报废申请</title>
    
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
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
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
            border-color: #fa709a;
            box-shadow: 0 0 0 0.2rem rgba(250, 112, 154, 0.25);
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
        
        .btn-danger {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            border: none;
            color: white;
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
<a href="${pageContext.request.contextPath}/devices/edit/${deviceId}" class="btn btn-secondary back-btn">
    <i class="bi bi-arrow-left"></i> 返回设备管理
</a>

<div class="container">
    <div class="card">
        <div class="card-header">
            <i class="bi bi-trash"></i> 设备报废申请
        </div>

        <div class="card-body">
            <form action="${pageContext.request.contextPath}/scrap/apply" method="post">
                <input type="hidden" name="deviceId" value="${deviceId}"/>

                <div class="form-group">
                    <label><i class="bi bi-file-text"></i> 报废原因</label>
                    <textarea name="reason" class="form-control" rows="5" 
                              placeholder="请详细说明设备报废的原因" required></textarea>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-danger btn-lg">
                        <i class="bi bi-check-circle"></i> 提交申请
                    </button>
                    <a href="${pageContext.request.contextPath}/devices/edit/${deviceId}"
                       class="btn btn-secondary btn-lg ml-3">
                        <i class="bi bi-x-circle"></i> 取消
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

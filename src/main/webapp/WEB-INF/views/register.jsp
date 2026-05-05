<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
    
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
            min-height: 100vh;
            background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Microsoft YaHei', sans-serif;
            padding: 20px;
        }
        
        .register-container {
            width: 100%;
            max-width: 500px;
        }
        
        .register-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        
        .card-header-custom {
            background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .card-header-custom h4 {
            margin: 0;
            font-weight: 600;
            font-size: 22px;
        }
        
        .card-body {
            padding: 30px;
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
            border-color: #66a6ff;
            box-shadow: 0 0 0 0.2rem rgba(102, 166, 255, 0.25);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: 500;
            transition: transform 0.2s;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 166, 255, 0.4);
        }
        
        .btn-secondary {
            border-radius: 8px;
            padding: 12px;
            font-weight: 500;
        }
        
        .btn-link {
            color: #66a6ff;
            text-decoration: none;
        }
        
        .btn-link:hover {
            color: #89f7fe;
            text-decoration: underline;
        }
        
        hr {
            margin: 20px 0;
        }
    </style>
</head>
<body>

<div class="register-container">
    <div class="register-card">
        <div class="card-header-custom">
            <h4><i class="bi bi-person-plus"></i> 用户注册</h4>
        </div>

        <div class="card-body">
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">
                    <i class="bi bi-exclamation-triangle"></i> ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <label><i class="bi bi-person"></i> 用户名</label>
                    <input type="text" name="username" class="form-control" 
                           placeholder="请输入用户名" required autofocus>
                </div>

                <div class="form-group">
                    <label><i class="bi bi-lock"></i> 密码</label>
                    <input type="password" name="password" class="form-control" 
                           placeholder="请输入密码" required>
                </div>

                <div class="form-group">
                    <label><i class="bi bi-building"></i> 所属部门</label>
                    <input type="text" name="department" class="form-control" 
                           placeholder="如：信息部 / 设备科">
                </div>

                <div class="form-group">
                    <label><i class="bi bi-person-badge"></i> 角色</label>
                    <select name="role" class="form-control">
                        <option value="普通用户">普通用户</option>
                        <option value="设备管理员">设备管理员</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block mb-3">
                    <i class="bi bi-check-circle"></i> 注册
                </button>
            </form>

            <hr>

            <div class="text-center">
                <a href="${pageContext.request.contextPath}/login" class="btn-link">
                    <i class="bi bi-arrow-left"></i> 已有账号？返回登录
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

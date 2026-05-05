<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>设备管理系统登录</title>
    
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
            height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Microsoft YaHei', sans-serif;
        }
        
        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 20px;
        }
        
        .login-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        
        .card-header-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .card-header-custom h4 {
            margin: 0;
            font-weight: 600;
            font-size: 24px;
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
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: 500;
            transition: transform 0.2s;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-link {
            color: #667eea;
            text-decoration: none;
        }
        
        .btn-link:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .card-footer-custom {
            background: #f8f9fa;
            padding: 15px;
            text-align: center;
            color: #6c757d;
            font-size: 14px;
        }
        
        .alert {
            border-radius: 8px;
            border: none;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-card">
        <div class="card-header-custom">
            <h4><i class="bi bi-box-seam"></i> 设备管理系统</h4>
        </div>

        <div class="card-body">
            <c:if test="${param.error != null}">
                <div class="alert alert-danger text-center">
                    <i class="bi bi-exclamation-triangle"></i> 用户名或密码错误
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/doLogin" method="post">
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

                <button type="submit" class="btn btn-primary btn-block mb-3">
                    <i class="bi bi-box-arrow-in-right"></i> 登录
                </button>

                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/register" class="btn-link">
                        <i class="bi bi-person-plus"></i> 没有账号？立即注册
                    </a>
                </div>
            </form>
        </div>

        <div class="card-footer-custom">
            软件学院设备管理系统
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/22
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>修改密码</title>

    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-image: url("img/wallhaven-7pmg8e_1920x1080.png");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: #0072ff;
            border: none;
            border-radius: 10px;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }


        .btn-back {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #fff;
            color: #0072ff;
            font-size: 24px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }

        .btn-back:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 576px) {
            .col-md-6 {
                width: 100%;
            }
        }
    </style>

    <script>
        function validateForm() {
            var newPassword = document.getElementById('new-password').value;
            var confirmPassword = document.getElementById('confirm-password').value;
            if (newPassword != confirmPassword) {
                alert("新密码和确认密码不一致！");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-body">
                    <h3 class="card-title text-center">修改密码</h3>
                    <form action="UpdatePasswordServlet" method="post" onsubmit="return validateForm()">
                        <div class="mb-3">
                            <label for="user-name" class="form-label">用户名</label>
                            <input type="text" class="form-control" id="user-name" name="username" placeholder="请输入用户名" required>
                        </div>
                        <div class="mb-3">
                            <label for="old-password" class="form-label">旧密码</label>
                            <input type="password" class="form-control" id="old-password" name="old-password" placeholder="请输入旧密码" required>
                        </div>
                        <div class="mb-3">
                            <label for="new-password" class="form-label">新密码</label>
                            <input type="password" class="form-control" id="new-password" name="new-password" placeholder="请输入新密码" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirm-password" class="form-label">确认密码</label>
                            <input type="password" class="form-control" id="confirm-password" name="confirm-password" placeholder="请再次输入新密码" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">修改密码</button>
                    </form>
                    <div class="d-flex justify-content-between mt-3">
                        <a href="#"></a>
                        <a href="login.jsp">返回登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<a href="javascript:history.back (-1)" class="btn-back">←</a>

</body>

</html>

<%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/21
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>登录</title>

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
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-body">
                    <h3 class="card-title text-center">登录</h3>
                    <form method="post" action="LoginServlet">
                        <div class="mb-3">
                            <label for="username" class="form-label">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">密码</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">登录</button>
                    </form>
                    <div class="d-flex justify-content-between mt-3">
                        <a href="changepassword.jsp">忘记密码？</a>
                        <a href="registered.jsp">注册账号</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <a href="index.jsp" class="btn-back">←</a>
</body>

</html>

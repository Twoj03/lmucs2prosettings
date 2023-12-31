<%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/27
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>修改密码失败</title>

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

        @media (max-width: 576px) {
            .col-md-6 {
                width: 100%;
            }
        }

        /* 添加以下的样式 */
        /* 模态框（背景） */
        .modal {
            display: none; /* 默认隐藏 */
            position: fixed; /* 保持在位置 */
            z-index: 1; /* 在顶层 */
            left: 0;
            top: 0;
            width: 100%; /* 全宽 */
            height: 100%; /* 全高 */
            overflow: auto; /* 如果需要滚动条 */
            background-color: rgb(0, 0, 0); /* 黑色背景 */
            background-color: rgba(0, 0, 0, 0.4); /* 黑色背景，透明度 */
        }

        /* 模态框内容 */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% 从顶部和居中 */
            padding: 20px;
            border: 1px solid #888;
            width: 10%; /* 宽度 */
        }

        /* 关闭按钮 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }


    </style>
</head>

<body>
<!-- 触发/打开模态框的按钮 -->
<button id="myBtn" style="display: none;">打开模态框</button>

<!-- 模态框 -->
<div id="myModal" class="modal">

    <!-- 模态框内容 -->
    <div class="modal-content">
        <!-- <span class="close">×</span> -->
        <p>旧密码错误</p>
        <button class="btn-primary" onclick="window.location.href='changepassword.jsp'">返回注册</button>
    </div>

</div>

<script>
    // 获取模态框
    var modal = document.getElementById("myModal");

    // 获取打开模态框的按钮
    var btn = document.getElementById("myBtn");

    // 当页面加载时，打开模态框
    window.onload = function () {
        modal.style.display = "block";
    }
</script>
</body>

</html>


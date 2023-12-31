<%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/24
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>prosettings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            /*background-image: url('img/wallhaven-7pmg8e_1920x1080.png');*/
        }
    </style>
</head>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="https://www.csgo.com.cn/">CS2</a>
        </div>
        <ul class="nav navbar-nav">
            <!-- <li class="active"><a href="#">主页</a></li> -->
            <li><a href="index.jsp">主页</a></li>
            <li><a href="UserListServlet">玩家</a></li>
            <li><a href="https://shimo.im/docs/e1Azd0nerMC6XYqW/">支持</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="login.jsp">登录</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-8">

            <h2>欢迎来到CS2游戏设置收集网站</h2>
            <p>这是一个收集用户CS2游戏设置的网站，你可以在这里查看其他用户的设置，或者分享你自己的设置。我们希望通过这个网站，让CS2玩家能够找到适合自己的游戏设置，提高游戏体验和竞技水平。</p>
            <p>如果你想查看其他用户的设置，你可以点击下面的按钮，进入玩家设置列表。</p>
            <p><a href="UserListServlet" class="btn btn-primary">玩家列表</a>
        </div>
    </div>
</div>
</body>

<jsp:include page="foot.jsp"/>

</html>



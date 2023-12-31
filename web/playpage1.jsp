<%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/25
  Time: 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${g.username}个人主页</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/player1.css">
    <script src="js/copy.js"></script>
    <style>
        .myButtonContainer {
            position: absolute;
            right: 0;
            top: 20%;
            transform: translateY(-50%);
            margin-top: -90px;
        }
        /* 新的CSS类 */
        .black-text {
            color: black;
        }
    </style>
    <script type="text/javascript">
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>

    <script>
        function openNewWindowAndCloseCurrent() {
            // 在新窗口中打开页面
            var newWindow = window.open('newlogin.jsp');

            // 当新窗口加载完成后，关闭当前窗口
            newWindow.onload = function() {
                window.close();
            }
        }
    </script>
</head>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="https://www.csgo.com.cn/">CS2</a>
        </div>
        <ul class="nav navbar-nav">
            <!-- <li class="active"><a href="#">主页</a></li> -->
            <li><a href="UserDetailServlet3?id=${g.id}">主页</a></li>
            <li><a href="UserDetailServlet2?id=${g.id}">玩家</a></li>
            <li><a href="https://shimo.im/docs/e1Azd0nerMC6XYqW/">支持</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="UserDetailServlet1?id=${g.id}">${g.username}</a></li>
        </ul>
    </div>
</nav>

<div class="myContainer">
    <div class="myHeader">
            <img src="${g.headimg}" alt="头像" class="avatar" style="width: 200px;height: 200px">
        <div class="myName">${g.username}</div>
        <div class="myButtonContainer">
            <!-- 下拉菜单 -->
            <div class="dropdown">
                <!-- 齿轮按钮 -->
                <button class="btn dropdown-toggle" type="button" data-toggle="dropdown">
                    <span class="black-text">操作</span>  <!-- 修改这里 -->
                </button>
                <!-- 下拉菜单内容 -->
                <ul class="dropdown-menu">
                    <li><a href="UserDetailServlet4?id=${g.id}">修改设置</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#deleteModal">删除账号</a></li>
                    <li><a onclick="openNewWindowAndCloseCurrent()">退出登录</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Add the following table -->
    <table class="myTable">
        <tr>
            <th>ID:</th>
            <td>${g.id}</td>
        </tr>
        <tr>
            <th>邮箱:</th>
            <td>暂不支持绑定</td>
        </tr>
        <tr>
            <th>手机号:</th>
            <td>暂不支持绑定</td>
        </tr>
    </table>
</div>

<!-- 模态框 -->
<div id="deleteModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- 模态框内容 -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除账号</h4>
            </div>
            <div class="modal-body">
                <p>你确定要删除账号吗？这个操作无法撤销。</p>
            </div>
            <div class="modal-footer">
                <!-- 确认删除按钮，提交表单 -->
                <form action="DeleteUserServlet" method="post">
                    <input type="hidden" name="id" value="${g.id}">
                    <button type="submit" class="btn btn-danger">删除</button>
                </form>
                <!-- 取消按钮，关闭模态框 -->
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>

    </div>
</div>















</body>

</html>





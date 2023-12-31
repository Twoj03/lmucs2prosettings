<%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/25
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="css/playerlist.css" rel="stylesheet">
    <!-- 引入bootstrap 3.3.7的css文件 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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



<div class="row">
    <c:forEach items="${requestScope.userFromDBByPage.rows}" var="user">
        <div class="column">
            <a href="${pageContext.request.contextPath}/UserDetailServlet?id=${user.id}">
                <div class="card">
                    <img src="${user.headimg}" alt="Avatar" style="width:100%">
                    <div class="containerr">
                        <h4><b>${user.username}</b></h4>
                    </div>
                </div>
            </a>
        </div>
    </c:forEach>
</div>

<!-- 使用bootstrap的分页组件 -->
<div class="text-center"> <!-- 使用text-center类使分页居中 -->
    <ul class="pagination">
        <!-- 使用c:if标签判断是否有上一页 -->
        <c:if test="${requestScope.userFromDBByPage.page > 1}">
            <!-- 使用c:url标签生成带参数的url -->
            <li><a href="<c:url value='UserListServlet?pageIndex=${requestScope.userFromDBByPage.page - 1}'/>">«</a></li>
        </c:if>
        <!-- 使用c:forEach标签遍历分页的起始页和结束页 -->
        <c:forEach begin="${requestScope.userFromDBByPage.start}" end="${requestScope.userFromDBByPage.end}" var="i">
            <!-- 使用c:choose标签判断当前页是否等于遍历的页码 -->
            <c:choose>
                <c:when test="${requestScope.userFromDBByPage.page == i}">
                    <!-- 如果是当前页，使用active类使其高亮 -->
                    <li class="active"><a href="<c:url value='UserListServlet?pageIndex=${i}'/>">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <!-- 如果不是当前页，正常显示 -->
                    <li><a href="<c:url value='UserListServlet?pageIndex=${i}'/>">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <!-- 使用c:if标签判断是否有下一页 -->
        <c:if test="${requestScope.userFromDBByPage.page < requestScope.userFromDBByPage.pageTotal}">
            <li><a href="<c:url value='UserListServlet?pageIndex=${requestScope.userFromDBByPage.page + 1}'/>">»</a></li>
        </c:if>
    </ul>
</div>

</body>
<jsp:include page="foot.jsp"/>
</html>


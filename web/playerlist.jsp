<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="css/playerlist.css" rel="stylesheet">
    <!-- 引入bootstrap 3.3.7的css文件 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<jsp:include page="head.jsp"/>
<body>

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








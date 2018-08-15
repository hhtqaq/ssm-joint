<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/13
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <tr>
                    <td>id</td>
                    <td>姓名</td>
                    <td>密码</td>
                    <td>编辑</td>
                    <td>删除</td>
                </tr>
                <c:forEach items="${pageInfo.list}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>
                            <button class="btn btn-primary">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-danger">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <div class="col-md-6">当前记录数${pageInfo.total}</div>
        <div class="col-md-6 col-md-offset-8">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/listUser?currentpage=${pageInfo.firstPage}">首页</a>
                    </li>
                    <%--上一页--%>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li><a href="${pageContext.request.contextPath}/listUser?currentpage=${pageInfo.prePage}"
                               aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pagenum">
                        <c:if test="${pagenum==pageInfo.pageNum}">
                            <li class="active"><a
                                    href="${pageContext.request.contextPath}/listUser?currentpage=${pagenum}">${pagenum}</a>
                            </li>
                        </c:if>
                        <c:if test="${pagenum!=pageInfo.pageNum}">
                            <li>
                                <a href="${pageContext.request.contextPath}/listUser?currentpage=${pagenum}">${pagenum}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/listUser?currentpage=${pageInfo.nextPage}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/listUser?currentpage=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>

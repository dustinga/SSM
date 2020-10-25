<%--
  Created by IntelliJ IDEA.
  User: liumingjing
  Date: 2020/09/27
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%----%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.7.2.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <!--搭建显示页面-->
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <!--按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <!--显示表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <C:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </C:forEach>
                </table>
            </div>
        </div>
        <!--显示分页信息-->
        <div class="row">
            <div class="col-md-6">
                当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
                        <C:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        </C:if>
                        <C:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <li <C:if test="${page_Num == pageInfo.pageNum }">class="active"</C:if>>
                                <a <C:if test="${page_Num == pageInfo.pageNum }">href="#"</C:if>
                                   <C:if test="${page_Num != pageInfo.pageNum }">href="${APP_PATH }/emps?pn=${page_Num}"</C:if>
                                >${page_Num }</a></li>
                        </C:forEach>
                        <C:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        </C:if>
                        <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>


</body>
</html>
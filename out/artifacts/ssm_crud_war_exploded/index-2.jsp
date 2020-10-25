<%--
  Created by IntelliJ IDEA.
  User: liumingjing
  Date: 2020/09/20
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/emps"></jsp:forward>
<html>
  <head>
    <title>$Title$</title>
    <%
      pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.7.2.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

  </head>
  <body>
  <button type="button" class="btn btn-warning">Warning</button>
  </body>
</html>

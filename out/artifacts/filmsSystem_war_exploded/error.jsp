<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/12
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="S" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
input
<form action="test/dateTest" method="post">
    时间:<input type="datetime-local" name="dateTime">
    <input type="submit" value="提交">
</form>
</body>
</html>

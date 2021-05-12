<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/5
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+
            ":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<base href="<%=basePath%>">
welcome!<s:property value="userName"/>
</body>
</html>

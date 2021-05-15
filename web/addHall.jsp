<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/5
  Time: 19:57
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
    <title>添加放映厅</title>
    <link rel="stylesheet" href="<%=basePath%>/css/addCinema.css">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

<%--    <STYLE type="text/css">--%>
<%--        .errorMessage {--%>
<%--            color: #FF3300;--%>
<%--            display: inline-block;--%>
<%--            list-style-type: none;--%>
<%--            margin: 0px;--%>
<%--            padding: 3px;--%>
<%--        }--%>
<%--    </STYLE>--%>
</head>
<body >
    <base href="<%=basePath%>">
    <div class="main_box">
        <div class="label">
            <p style="font-family: 'Times New Roman';">添加放映厅</p>
        </div>
        <div class="fos">
            <s:form action="addHall" method="post" theme="simple">
                <label >放映厅编号:</label><s:textfield name="hallNum" label="放映厅编号" class="inputs"/><span class="formFieldError"> <s:fielderror class="error"><s:param>user.userName</s:param></s:fielderror></span><br>
                <label >放映厅行数:</label><s:textfield name="hallRow" label="放映厅行数" class="inputs"/><span class="formFieldError"><s:fielderror class="error"><s:param>user.userPassword</s:param></s:fielderror></span><br>
                <label >放映厅列数:</label><s:textfield name="hallCol" label="放映厅列数" class="inputs"/><span class="formFieldError"><s:fielderror class="error"><s:param>user.userPassword</s:param></s:fielderror></span><br>
                 <s:submit value="添加" class="submit"/>
            </s:form>
        </div>
    </div>
    <script type="text/javascript">
        var loginStatus="<%=session.getAttribute("addHallState")%>";
        console.log(loginStatus)
        var a=new String("exist");
        if (a==loginStatus) {
            alert("放映厅编号已存在请修改!");
        }
    </script>
<%--        <form action="${pageContext.request.contextPath}/userAction/login" method="post">--%>
<%--            姓名:<input type="text" name="UserName"/><br>--%>
<%--            年龄:<input type="text" name="UserPassword"/><br>--%>
<%--            <input type="submit" value="登录"/>--%>
<%--        </form>--%>
</body>
</html>
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
    <title>登录</title>
    <link rel="stylesheet" href="<%=basePath%>/css/login.css">
    <title>注册</title>
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
            <p style="font-family: 'Times New Roman';">欢迎登陆</p>
        </div>
        <div class="fos">
            <s:form action="userAction/login" method="post" theme="simple">
                <label >用户名:</label><s:textfield name="userName" label="用户名" class="inputs"/><span class="formFieldError"> <s:fielderror class="error"><s:param>user.userName</s:param></s:fielderror></span><br>
                <label >密码:</label><s:password name="userPassword" label="密码" class="inputs"/><span class="formFieldError"><s:fielderror class="error"><s:param>user.userPassword</s:param></s:fielderror></span><br>
                 <s:submit value="登录" class="submit"/>
            </s:form>
        </div>
    </div>
    <script type="text/javascript">
        console.log("sss");
        var loginStatus="<%=session.getAttribute("loginStatus")%>";
        var a=new String("fail");
        if (a==loginStatus) {
            alert("用户名或密码错误!");
        }

    </script>
<%--        <form action="${pageContext.request.contextPath}/userAction/login" method="post">--%>
<%--            姓名:<input type="text" name="UserName"/><br>--%>
<%--            年龄:<input type="text" name="UserPassword"/><br>--%>
<%--            <input type="submit" value="登录"/>--%>
<%--        </form>--%>
</body>
</html>
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
    <title>注册</title>
    <link rel="stylesheet" href="<%=basePath%>/css/register.css">
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
<body>
    <base href="<%=basePath%>">
    <div class="main_box">
        <div class="label">
            <p style="font-family: 'Times New Roman';">注册</p>
        </div>
        <div class="fos">
            <s:form action="userAction/register" method="post" theme="simple">
                <label>用户名:</label> <span class="formFieldError"><s:textfield name="UserName" label="用户名" class="inputs"/><s:fielderror class="error"><s:param>userName</s:param></s:fielderror></span> <br>
                <label>手机号:</label> <s:textfield name="UserPhone" label="手机号" class="inputs"/><span class="formFieldError"><s:fielderror class="error"><s:param>userPhone</s:param></s:fielderror></span> <br>
                <label>密码:</label> <s:password name="UserPassword" label="密码" class="inputs"/><span class="formFieldError"><s:fielderror class="error"><s:param>userPassword</s:param></s:fielderror></span> <br>
                <label>确认密码:<</label> <s:password name="reUserPassword" label="确认密码" class="inputs"/><s:fielderror class="error"><span class="formFieldError"><s:param>reUserPassword</s:param></s:fielderror></span> ><br>
                <label>年龄:</label> <s:textfield name="UserAge" label="年龄" class="inputs"/><br>
                <label>地区:</label> <s:textfield name="UserArea" label="地区" class="inputs"/><br>
                <label>喜爱类型:</label> <s:textfield name="UserPreferences" label="喜爱类型" class="inputs"/><br>
                <label>性别:</label> <s:radio name="UserSex" list="{'男','女'}" value="'男'" label="性别" class="inputs" cssStyle="margin-right: 5px;width: 30px;"/><br>
                <s:submit value="注册" class="submit"/>
            </s:form>
        </div>
    </div>
    <%--        <form action="${pageContext.requeUserPhonest.contextPath}/userAction/register" method="post">--%>
    <%--            用户名:<input type="text" name="UserName"/><br>--%>
    <%--            性别:<label><input type="radio" name="UserSex">男</label>--%>
    <%--                <label><input type="radio" name="UserSex">女</label><br>--%>
    <%--            电话号码:<input type="text" name="UserPhone"/><br>--%>
    <%--            密码:<input type="text" name="UserPassword"/><br>--%>
    <%--            重复密码:<input type="text" name="UserPassword"/><br>--%>
    <%--            年龄:<input type="text" name="UserAge"/><br>--%>
    <%--            地区:<input type="text" name="UserArea">--%>
    <%--            喜爱类型:<input type="text" name="UserPreferences">--%>
    <%--            <input type="submit" value="注册"/>--%>
    <%--        </form>--%>
    <script type="text/javascript">
        console.log("sss");
        var loginStatus="<%=session.getAttribute("registerStatus")%>";
        var a=new String("fail");
        if (a==loginStatus) {
            alert("用户名已存在!");
        }
    </script>

</body>
</html>

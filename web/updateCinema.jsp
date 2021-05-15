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
    <link rel="stylesheet" href="<%=basePath%>/css/addCinema.css">
    <title>注册</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script type="text/javascript">
        window.onload=function () {
            var name="<%=request.getParameter("cinemaName")%>";
            var address="<%=request.getParameter("cinemaAddress")%>";
            var phone="<%=request.getParameter("cinemaphone")%>";
            var id="<%=request.getParameter("cinemaId")%>";
            var s1=document.getElementById("s1");
            var s2=document.getElementById("s2");
            var s3=document.getElementById("s3");
            var ID=document.getElementById("ID");
            console.log(id);
            s1.value=name;
            s2.value=address;
            s3.value=phone;
            ID.value=id;
        }
    </script>
</head>
<body >
    <base href="<%=basePath%>">
    <div class="main_box">
        <div class="label">
            <p style="font-family: 'Times New Roman';">欢迎登陆</p>
        </div>
        <div class="fos">
            <s:form action="updateCinema" method="post" theme="simple" id="passform">
                <s:hidden name="cinemaId" id="ID"/>
                <label >影院名称:</label><s:textfield placeholder='<%=request.getParameter("cinemaName")%>' name="cinemaName" label="影院名称" class="inputs" id="s1"/><span class="formFieldError"> <s:fielderror class="error"><s:param>user.userName</s:param></s:fielderror></span><br>
                <label >影院地址:</label><s:textfield placeholder='<%=request.getParameter("cinemaAddress")%>' name="cinemaAddress" label="影院地址" class="inputs" id="s2"/><span class="formFieldError"><s:fielderror class="error"><s:param>user.userPassword</s:param></s:fielderror></span><br>
                <label >联系方式:</label><s:textfield placeholder='<%=request.getParameter("cinemaphone")%>' name="cinemaphone" label="联系方式" class="inputs" id="s3"/><span class="formFieldError"><s:fielderror class="error"><s:param>user.userPassword</s:param></s:fielderror></span><br>
                 <s:submit value="提交修改" class="submit"/>
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
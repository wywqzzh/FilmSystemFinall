<%@ page import="beans.Cinema" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/5
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page isELIgnored="false" %>--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+
            ":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>$Title$</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%=basePath%>/css/showCinema.css">
</head>
<body>
    <div class="top">
        <h1 class="logo" >
            <a href="" style="background-repeat: no-repeat"></a>
        </h1>
    </div>
    <div class="nav">
        <div class="webName" title="青柠网">青柠网
        </div>
        <div class="search">
            <div style="clear:both;"></div>
            <form action="" style="width: 100%;height: 100%">
                <input type="text" placeholder="影院名称/地址" name="input" id="" value="" />
                <button><i>搜索</i></button>
            </form>
        </div>
        <div class="nav-links">
            <div style="clear:both;"></div>
            <ul>
                <div style="clear:both;"></div>
                <li><a href="" style="color: #584029;width: 15%">首页</a> </li>
                <li><a href="${pageContext.request.contextPath}/cinemaAction/showCinema" style="color: #f37f00;width: 15%">电影院</a> </li>
                <li><a href="" style="color: #e85409;width: 15%">即将上映</a> </li>
                <li><a href="" style="color: #1c9ba2;width: 15%">我的订票</a> </li>
                <li><a href="" style="color: #3fa2af;width: 15%">个人中心</a> </li>
            </ul>
        </div>
        <div class="logOrwel">
            <% String userName=(String)session.getAttribute("userName");
                if(userName==null || "".equals(userName)){%>
            <a href="${pageContext.request.contextPath}/userAction/toLoginPage.action" style="color: #a8dbcd">登录</a>
            <a href="${pageContext.request.contextPath}/userAction/toRegisterPage.action" style="color:#45893f ">注册</a>
            <%}else {
            %>
            <a href="" style="color: #a8dbcd;margin-top: 4%;width: 55%;margin-right: 20%">${sessionScope.userName}ssssssssssssss</a>
            <a href="${pageContext.request.contextPath}/userAction/logout" style="color:#45893f;width: 25% ">注销</a>
            <%}%>
            <%--        <c:choose>--%>
            <%--          <c:when test="${sessionScope.userName==null}">--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toLoginPage.action" style="color: #a8dbcd">登录</a>--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toRegisterPage.action" style="color:#45893f ">注册</a>--%>
            <%--          </c:when>--%>
            <%--          <c:otherwise >--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toLoginPage.action" style="color: #a8dbcd">welcome!${sessionScope.userName}</a>--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toRegisterPage.action" style="color:#45893f ">注销</a>--%>
            <%--          </c:otherwise>--%>
            <%--        </c:choose>--%>
            <%--          <c:if test="${sessionScope.userName}!=null">--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toLoginPage.action" style="color: #a8dbcd">登录</a>--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toRegisterPage.action" style="color:#45893f ">注册</a>--%>
            <%--          <c:else>--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toLoginPage.action" style="color: #a8dbcd">welcome!${sessionScope.userName}</a>--%>
            <%--            <a href="${pageContext.request.contextPath}/userAction/toRegisterPage.action" style="color:#45893f ">注销</a>--%>
            <%--          </c:else>--%>
        </div>
    </div>
    <div class="cinema">
        <div class="men">
            <div class="n1">
                <span>影院名称</span>
            </div>
            <div class="n2">
                <span>影院地址</span>
            </div>
            <div class="n3">
                <span>联系方式</span>
            </div>
        </div>
        <%  List<Cinema> cinemas=(List<Cinema>)session.getAttribute("cinemas");
            int x=0;
            for(Cinema cinema:cinemas) {
                x+=1;
                if(x%2==0){%>
                    <div class="mess" style="background-color: #f7f7f7">
                        <a class="n1">&nbsp;<%=cinema.getCinemaName()%></a>
                        <a class="n2">&nbsp;<%=cinema.getCinemaAddress()%></a>
                        <a class=n3"">&nbsp;<%=cinema.getCinemaphone()%></a>
                    </div>
                <%}else{%>
                    <div class="mess" style="background-color: #ffffff">
                        <a class="n1">&nbsp;<%=cinema.getCinemaName()%></a>
                        <a class="n2">&nbsp;<%=cinema.getCinemaAddress()%></a>
                        <a class="n3">&nbsp;<%=cinema.getCinemaphone()%></a>
                    </div>
                <%}
            }%>
    </div>

</body>
</html>
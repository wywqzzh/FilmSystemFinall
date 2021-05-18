<%@ page import="java.util.List" %>
<%@ page import="beans.Film" %>
<%@ page import="beans.Filearrangementmessage" %>
<%@ page import="beans.Cinema" %><%--
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
    <link rel="stylesheet" href="<%=basePath%>/css/buyticket.css">
    <script type="text/javascript">
        window.onload=function () {
            var arranges = document.getElementById("userMessage").getElementsByClassName("mess");
            for(var i=0;i<arranges.length;i++)
            {
                var a=arranges[i].getElementsByTagName("a")[0];
                a.onclick=function () {
                    var parent=this.parentNode.parentNode;
                    var arrangeId=parent.getElementsByTagName("span")[0].innerHTML;
                    var form=document.getElementById("toSeat");
                    form.arrangeId.value=arrangeId;
                    form.submit();
                }
            }
        }
    </script>
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
        <form action="filmAction/searchFilm" style="width: 100%;height: 100%">
            <input type="text" placeholder="云崖之上、秘密访客..." name="searchInput" id="" value="" />
            <button><i>搜索</i></button>
        </form>
    </div>
    <div class="nav-links">
        <div style="clear:both;"></div>
        <ul>
            <div style="clear:both;"></div>
            <li><a href="test/home" style="color: #584029;width: 15%">首页</a> </li>
            <li><a href="filmAction/willFilm" style="color: #e85409;width: 15%">即将上映</a> </li>
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
        <a href="" style="color: #a8dbcd;margin-top: 4%;width: 55%;margin-right: 20%">${sessionScope.userName}</a>
        <a href="${pageContext.request.contextPath}/userAction/logout" style="color:#45893f;width: 25% ">注销</a>
        <%}%>
    </div>
</div>

<form action="filmAction/choiseSeat" method="post" id="toSeat">
    <input type="hidden" name="arrangeId">
</form>
<div class="film">
<div class="men">
    <div class="n1" style="width: 15%"><span>电影名</span></div>
    <div class="n2" style="width: 15%"><span>影院</span></div>
    <div class="n2" style="width: 25%"><span>影院地址</span></div>
    <div class="n2" style="width: 15%"><span>放映厅</span></div>
    <div class="n2" style="width: 15%"><span>票价</span></div>
    <div class="n2" style="width: 14.6%;border:0;"></div>
</div>
<div class="userMessage" id="userMessage">
    <%  List<Filearrangementmessage> arranges=(List<Filearrangementmessage>)session.getAttribute("arranges");
        List<Cinema> cinemas= (List<Cinema>) session.getAttribute("cinemas");
        Film film= (Film) session.getAttribute("film");
        for(int i=0;i<arranges.size();i++) {
            Filearrangementmessage arrange=arranges.get(i);
            Cinema cinema=cinemas.get(i);
            if(i%2==0){%>
        <div class="mess" style="background-color: #f7f7f7">
            <span hidden><%=arrange.getArrangeId()%></span>
            <div class="n1" style="width: 15%"><span><%=film.getFilmName()%></span></div>
            <div class="n1" style="width: 15%"><span><%=cinema.getCinemaName()%></span></div>
            <div class="n1" style="width: 25%"><span><%=cinema.getCinemaAddress()%></span></div>
            <div class="n1" style="width: 15%"><span><%=arrange.getHallNum()%></span></div>
            <div class="n1" style="width: 15%"><span><%=arrange.getPrice()%></span></div>
            <div class="n1" style="width: 15%"><a>购票</a></div>
        </div>
    <%}else{%>
        <div class="mess" style="background-color: #ffffff">
            <span hidden><%=arrange.getArrangeId()%></span>
            <div class="n1" style="width: 15%"><span><%=film.getFilmName()%></span></div>
            <div class="n1" style="width: 15%"><span><%=cinema.getCinemaName()%></span></div>
            <div class="n1" style="width: 25%"><span><%=cinema.getCinemaAddress()%></span></div>
            <div class="n1" style="width: 15%"><span><%=arrange.getHallNum()%></span></div>
            <div class="n1" style="width: 15%"><span><%=arrange.getPrice()%></span></div>
            <div class="n1" style="width: 15%"><a>购票</a></div>
        </div>
    <%}
    }%>
</div
</div>
</body>
</html>
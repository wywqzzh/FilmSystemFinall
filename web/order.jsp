<%@ page import="java.util.List" %>
<%@ page import="javafx.util.Pair" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="beans.*" %><%--
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
    <link rel="stylesheet" href="<%=basePath%>/css/order.css">
    <script type="text/javascript">
        window.onload=function () {
            var Row=document.getElementById("row");
            var Col=document.getElementById("col");
            <% Hall hall=(Hall) session.getAttribute("hall");
                Filearrangementmessage arrange=(Filearrangementmessage) session.getAttribute("arrange");
            %>
            var cost=document.getElementById("cost");
            cost.value=<%=arrange.getPrice()%>
            var hallRow=<%=hall.getHallRow()%>
            var hallCol=<%=hall.getHallCol()%>
            for(var i=0;i<hallRow;i++){
                var op=document.createElement("option");
                op.text=i+1;
                Row.append(op);
            }
            for(var i=0;i<hallCol;i++){
                var op=document.createElement("option");
                op.text=i+1;
                Col.append(op);
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
<% Order order= (Order) session.getAttribute("order");
    Film film= (Film) session.getAttribute("film");
    Cinema cinema= (Cinema) session.getAttribute("cinema");
    Seat seat= (Seat) session.getAttribute("choiceSeat");
    %>
<div class="context">
    <div class="order">
        <div class="tiao">
            <span>订单编号:<%=order.getOrderId()%></span>
        </div>
        <div class="tiao">
            <span>订单时间:<%=order.getOrderDate()%></span>
        </div>
        <div class="tiao">
            <span>订单金额:<%=order.getCost()%></span>
        </div>
        <div class="tiao">
            <span>订单状态:未支付</span>
        </div>
        <div class="tiao">
            <span><%=film.getFilmName()%></span>
        </div>
        <div class="tiao">
            <span><%=cinema.getCinemaName()%>&nbsp;<%=arrange.getHallNum()%>号厅&nbsp;<%=seat.getRow()%>排<%=seat.getCol()%>列</span>
        </div>
        <div class="zhifu">
            <div style="width: 30%;height: 100%;background-image: url(/images/zhifu.jpg);background-position: center;background-repeat: no-repeat;background-size: 80% 100%;float: left"></div>
            <div><a class="myButton" style="width: 18%;float: left;height: 20%">支付</a></div>
            <div><a class="myButton" style="width: 18%;float: left;height: 20%;margin-top: 5%" href="filmAction/cancleOrder">取消订单</a></div>
        </div>
    </div>
</div>
</body>
</html>
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
    <link rel="stylesheet" href="<%=basePath%>/css/seat.css">
    <script type="text/javascript">
        window.onload=function () {
            var seatHave="<%=session.getAttribute("seatHave")%>";
            if(seatHave=="yes"){
                alert("该位置已被预定!");
            }
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
<div class="film">
    <%List<Seat> seats= (List<Seat>) session.getAttribute("seats");
     Map<Pair<Integer,Integer>, Boolean> iSseat= (Map<Pair<Integer, Integer>, Boolean>) session.getAttribute("iSseat");


     int colWidth= (int) Math.floor(100.0/hall.getHallCol());
     int rowHeight= (int) Math.floor(100.0/hall.getHallRow());
     System.out.println(iSseat);
    %>
    <div class="colShow">
        <%for(int i=0;i<hall.getHallCol();i++){%>

            <div class="col" style="width: <%=colWidth%>%;line-height: 100%"><span style="width: 100%;width: 100%;line-height: 100%"><%=i+1%></span></div>
        <%}%>
    </div>
    <div class="rowSHow">
        <%for(int i=0;i<hall.getHallRow();i++){%>
            <div class="row" style="height: <%=rowHeight%>%;line-height: 100%"><span style="width: 100%;width: 100%;line-height: 100%"><%=i+1%></span></div>
        <%}%>
    </div>
    <div class="seats" >
        <%for(int i=0;i<hall.getHallRow();i++){%>
            <div style="height: <%=rowHeight%>%;width: 100%">
                <%for(int j=0;j<hall.getHallCol();j++){
                    if(iSseat.get(new Pair<Integer,Integer>(i+1,j+1))==null){%>
                    <div style="float:left;height: 100%;width: <%=colWidth%>%;background-image: url(/images/seat/empty.png);background-size: 40% 40%;background-repeat: no-repeat;background-position: top"><span></span></div>
                <%}else{%>
                    <div style="float:left;height: 100%;width: <%=colWidth%>%;background-image: url(/images/seat/have.png);background-size: 40% 40%;background-repeat: no-repeat;background-position: top"><span></span></div>
                    <%}
                }%>
            </div>
        <%}%>
    </div>
    <div class="colShow">
    <form action="filmAction/addSeat" method="post">
        <input type="hidden" name="cost" id="cost">
        请选择座位行:<select name="row" id="row">

                  </select>
        请选择座位列:<select name="col" id="col">

                  </select>
        <input type="submit" class="myButton" value="确认">
    </form>
    </div>
</div>
</body>
</html>
<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Cinema" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/13
  Time: 18:54
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
    <link rel="stylesheet" href="<%=basePath%>/css/manage.css">
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript">
        window.onload=function () {
            var cinemas = document.getElementById("userMessage").getElementsByClassName("mess");
                for(var i=0;i<cinemas.length;i++){

                    var a1=cinemas[i].getElementsByTagName("a")[0];
                    a1.onclick=function () {
                        var parent=this.parentNode.parentNode;
                        var cinemaId=parent.getElementsByTagName("span")[0].innerHTML;
                        var cinemaName=parent.getElementsByClassName("n1")[0].getElementsByTagName("span")[0].innerHTML;
                        var cinemaAddress=parent.getElementsByClassName("n1")[1].getElementsByTagName("span")[0].innerHTML;
                        var cinemaPhone=parent.getElementsByClassName("n1")[2].getElementsByTagName("span")[0].innerHTML;

                        var form=document.getElementById("passForm");

                        form.cinemaId.value=cinemaId;
                        form.cinemaName.value=cinemaName;
                        form.cinemaAddress.value=cinemaAddress;
                        form.cinemaphone.value=cinemaPhone;
                        form.submit();
                    }
                    var a2=cinemas[i].getElementsByTagName("a")[1];
                    a2.onclick=function () {
                        var parent=this.parentNode.parentNode;
                        var cinemaId=parent.getElementsByTagName("span")[0].innerHTML;
                    }
                }
        }
    </script>
</head>
<body>
    <div class="nav">
        <div class="title">
            <h3>青柠电影系统应用管理</h3>
        </div>
    </div>
    <div class="manage">
        <div class="n1">
           <a href="manageAction/manageUser"> <h3 style="background-color: #f7f7f7">用户管理</h3></a>
        </div>
        <div class="n1">
            <a href="manageAction/manageCinema"><h3 style="background-color: #ffffff">影院管理</h3></a>
        </div>
        <div class="n1">
            <a><h3 style="background-color: #f7f7f7">影评管理</h3></a>
        </div>
    </div>
    <div class="show">
        <div class="dsearch">
            <div class="search">
                <div style="clear:both;"></div>
                <form action="manageAction/searchUser" style="width: 100%;height: 100%">
                    <input type="text" placeholder="请输入用户名" name="input" id="" value="" />
                    <button><i>搜索</i></button>
                </form>
            </div>
        </div>

        <div class="men">
            <div class="n1" style="width: 20%"><span>影院名称</span></div>
            <div class="n2" style="width: 35%;"><span>影院地址</span></div>
            <div class="n2" style="width:15%;"><span>联系电话</span></div>
            <div class="n2" style="width: 12.6%;"></div>
            <div class="n2" style="width: 5.6%;border:0;"></div>
        </div>
        <form  method="post" action="manageAction/updateCinemaPage" id ="passForm">
            <input id = "CcinemaId" type = "hidden" name="cinemaId">
            <input id = "cinemaName" type = "hidden" name="cinemaName">
            <input id = "cinemaAddress" type = "hidden" name="cinemaAddress">
            <input id = "cinemaphone" type = "hidden" name="cinemaphone">
        </form>
        <form  method="post" action="manageAction/updateCinemaPage" id ="showHall">
            <input id = "CcinemaId" type = "hidden" name="cinemaId">
        </form>
        <div class="userMessage" id="userMessage">
            <%  List<Cinema> cinemas=(List<Cinema>)session.getAttribute("manageCinemas");
                int x=0;
                for(Cinema cinema:cinemas) {
                    x+=1;
                    if(x%2==0){%>

            <div class="mess" style="background-color: #f7f7f7">
                <span hidden><%=cinema.getCinemaId()%></span>
                <div class="n1" style="width: 21%"><span><%=cinema.getCinemaName()%></span></div>
                <div class="n1" style="width: 36%"><span><%=cinema.getCinemaAddress()%></span></div>
                <div class="n1" style="width: 15.6%"><span><%=cinema.getCinemaphone()%></span></div>
                <div class="n1" style="width: 13.6%"><a>修改信息</a></div>
                <div class="n1" style="width: 13.6%"><a>查看放映厅</a></div>
            </div>
            <%}else{%>
            <div class="mess" style="background-color: #ffffff">
                <span hidden><%=cinema.getCinemaId()%></span>
                <div class="n1" style="width: 21%"><span><%=cinema.getCinemaName()%></span></div>
                <div class="n1" style="width: 36%"><span><%=cinema.getCinemaAddress()%></span></div>
                <div class="n1" style="width: 15.6%"><span><%=cinema.getCinemaphone()%></span></div>
                <div class="n1" style="width: 13.6%"><a>修改信息</a></div>
                <div class="n1" style="width: 13.6%"><a>查看放映厅</a></div>
            </div>
            <%}
            }%>
            <div style="width: 100%;margin-top: 2%;text-align: center"><a href="manageAction/toAddCinemaPage" class="myButton">增加影院</a></div>
        </div>

    </div>
</body>
</html>

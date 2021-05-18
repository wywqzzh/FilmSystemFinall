<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Film" %>
<%@ page import="beans.Review" %><%--
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
    <link rel="stylesheet" href="<%=basePath%>/css/managereview.css">
<%--    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
    <script type="text/javascript">
        window.onload=function () {
            var Reviews = document.getElementById("userMessage").getElementsByClassName("mess");
            console.log(Reviews.length);
            for(var i=0;i<Reviews.length;i++){
                console.log(Reviews[i]);
                var a1=Reviews[i].getElementsByTagName("a")[0];
                console.log(a1);
                a1.onclick=function () {
                    var parent=this.parentNode.parentNode;
                    var userName=parent.getElementsByClassName("n1")[0].getElementsByTagName("span")[0].innerHTML;
                    var filmId=parent.getElementsByTagName("span")[0].innerHTML;
                    var form=document.getElementById("deleteReview");
                    form.userName.value=userName;
                    form.filmId.value=filmId;
                    console.log(filmId);
                    console.log(userName);
                    form.submit();
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
        <a href= "manageAction/manageCinema"><h3 style="background-color: #ffffff">影院管理</h3></a>
    </div>
    <div class="n1">
        <a  href="manageAction/manageReview"><h3 style="background-color: #f7f7f7">影评管理</h3></a>
    </div>
    <div class="n1">
        <a href="manageAction/getInitarrange"><h3 style="background-color: #ffffff">排片管理</h3></a>
    </div>
</div>
<div class="show">

    <div class="men">
        <div class="n1"><span>用户名</span></div>
        <div class="n2"><span>电影名</span></div>
        <div class="n2"><span>评分</span></div>
        <div class="n2"><span>评论</span></div>
        <div class="n2" style="width: 19.6%;border:0;"></div>
    </div>
    <form  method="post" action="manageAction/deleteReview" id ="deleteReview">
        <input id = "userName" type = "hidden" name="userName">
        <input id ="filmId" type="hidden" name="filmId">
    </form>
    <div class="userMessage" id="userMessage">
        <%  List<Film> films= (List<Film>) session.getAttribute("films");
            List<Review> reviews= (List<Review>) session.getAttribute("reviews");
            for(int i=0;i<reviews.size();i++) {
                if(i%2==0){%>
        <div class="mess" style="background-color: #f7f7f7">
            <span hidden><%=films.get(i).getFilmId()%></span>
            <div class="n1" ><span><%=reviews.get(i).getUserName()%></span></div>
            <div class="n1" ><span><%=films.get(i).getFilmName()%></span></div>
            <div class="n1" ><span><%=reviews.get(i).getFilmRating()%></span></div>
            <div class="n1" style="overflow: auto;text-align: left"><span><%=reviews.get(i).getFilmReview()%></span></div>
            <div class="n1" style="width: 15%;"><a>删除</a></div>
        </div>
        <%}else{%>
        <div class="mess" style="background-color: #ffffff">
            <span hidden><%=films.get(i).getFilmId()%></span>
            <div class="n1" ><span><%=reviews.get(i).getUserName()%></span></div>
            <div class="n1" ><span><%=films.get(i).getFilmName()%></span></div>
            <div class="n1" ><span><%=reviews.get(i).getFilmRating()%></span></div>
            <div class="n1" style="overflow: auto;text-align: left"><span><%=reviews.get(i).getFilmReview()%></span></div>
            <div class="n1" style="width: 15%;"><a>删除</a></div>
        </div>
        <%}
        }%>
    </div>
</div>
</body>
</html>

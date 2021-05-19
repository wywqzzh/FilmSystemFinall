<%@ page import="java.util.List" %>
<%@ page import="beans.Film" %><%--
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
    <link rel="stylesheet" href="<%=basePath%>/css/index.css">
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
          <li><a href="filmAction/myOrder" style="color: #1c9ba2;width: 15%">我的订票</a> </li>
          <li><a href="filmAction/myCollection" style="color: #3fa2af;width: 15%">我的收藏</a> </li>
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
      <div style="clear:both;"></div>
        <div class="context">
          <div class="hd">
            <h2 style="line-height: 250%;width: 85%">正在热映</h2>
            <h5 style="line-height: 500%;width: 15%;text-align: center"><a href="filmAction/hotFilm">更多</a></h5>
          </div>
          <% List<Film> films= (List<Film>) session.getAttribute("films");%>
          <div class="bd">
            <ul style="width: 100%;height: 100%">
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(<%=films.get(0).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=films.get(0).getFilmId()%>"></a></li>
                  <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=films.get(0).getFilmId()%>"><%=films.get(0).getFilmName()%></a></li>
                  <li class="li3"><a>评分:<%=films.get(0).getFilmRating()%></a></li>
                  <li class="li4"><a class="myButton" href="filmAction/buyTicket?filmId=<%=films.get(0).getFilmId()%>">购票</a></li>
                </ul>
              </li>
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(<%=films.get(1).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=1&filmId=<%=films.get(1).getFilmId()%>"></a></li>
                  <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=1&filmId=<%=films.get(1).getFilmId()%>"><%=films.get(1).getFilmName()%></a></li>
                  <li class="li3"><a>评分:<%=films.get(1).getFilmRating()%></a></li>
                  <li class="li4"><a class="myButton" href="filmAction/buyTicket?filmId=<%=films.get(1).getFilmId()%>">购票</a></li>
                </ul>
              </li>
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(<%=films.get(2).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=2&filmId=<%=films.get(2).getFilmId()%>"></a></li>
                  <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=2&filmId=<%=films.get(2).getFilmId()%>"><%=films.get(2).getFilmName()%></a></li>
                  <li class="li3"><a>评分:<%=films.get(2).getFilmRating()%></a></li>
                  <li class="li4"><a class="myButton" href="filmAction/buyTicket?filmId=<%=films.get(2).getFilmId()%>">购票</a></li>
                </ul>
              </li>
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(<%=films.get(3).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=3&filmId=<%=films.get(3).getFilmId()%>"></a></li>
                  <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=3&filmId=<%=films.get(3).getFilmId()%>"><%=films.get(3).getFilmName()%></a></li>
                  <li class="li3"><a>评分:<%=films.get(3).getFilmRating()%></a></li>
                  <li class="li4"><a class="myButton" href="filmAction/buyTicket?filmId=<%=films.get(3).getFilmId()%>">购票</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
        <div class="context">
        <div class="hd">
          <h2 style="line-height: 250%">推荐</h2>
        </div>
          <% List<Film> Rfilms=(List<Film>) session.getAttribute("Rfilms");
            if(Rfilms!=null){%>
                <div class="bd">
                  <ul style="width: 100%;height: 100%">
                    <li>
                      <ul >
                        <li class="li1"><a style="background-image:url(<%=Rfilms.get(0).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(0).getFilmId()%>"></a></li>
                        <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(0).getFilmId()%>"><%=Rfilms.get(0).getFilmName()%></a></li>
                        <li class="li3"><a>评分:<%=Rfilms.get(0).getFilmRating()%></a></li>
                      </ul>
                    </li>
                    <li>
                      <ul >
                        <li class="li1"><a style="background-image:url(<%=Rfilms.get(1).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(1).getFilmId()%>"></a></li>
                        <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(1).getFilmId()%>"><%=Rfilms.get(1).getFilmName()%></a></li>
                        <li class="li3"><a>评分:<%=Rfilms.get(1).getFilmRating()%></a></li>
                      </ul>
                    </li>
                    <li>
                      <ul >
                        <li class="li1"><a style="background-image:url(<%=Rfilms.get(2).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(2).getFilmId()%>"></a></li>
                        <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(2).getFilmId()%>"><%=Rfilms.get(2).getFilmName()%></a></li>
                        <li class="li3"><a>评分:<%=Rfilms.get(2).getFilmRating()%></a></li>
                      </ul>
                    </li>
                    <li>
                      <ul >
                        <li class="li1"><a style="background-image:url(<%=Rfilms.get(3).getFilmImgUrl()%>);" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(3).getFilmId()%>"></a></li>
                        <li class="li2"><a class="a2" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=0&filmId=<%=Rfilms.get(3).getFilmId()%>"><%=Rfilms.get(3).getFilmName()%></a></li>
                        <li class="li3"><a>评分:<%=Rfilms.get(3).getFilmRating()%></a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
                </div>
            <%}else{%>
      <div style="margin-left: 45%;margin-top: 25%;"><h2><a href="login.jsp" style="display: block;color: #1c9ba2">请登录</a></h2></div>
      <%}%>
    </div>
    </div>
    <base href="<%=basePath%>">

<%--    <a href="${pageContext.request.contextPath}/userAction/toLoginPage.action">登录</a>--%>
<%--    <a href="${pageContext.request.contextPath}/userAction/toRegisterPage.action">注册</a>--%>
  </body>
</html>
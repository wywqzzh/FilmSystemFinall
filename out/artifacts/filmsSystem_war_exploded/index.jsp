<%--
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
        <form action="" style="width: 100%;height: 100%">
          <input type="text" placeholder="云崖之上、秘密访客..." name="input" id="" value="" />
          <button><i>搜索</i></button>
        </form>
      </div>
      <div class="nav-links">
        <div style="clear:both;"></div>
        <ul>
          <div style="clear:both;"></div>
          <li><a href="test/toerror" style="color: #584029;width: 15%">首页</a> </li>
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
    <div class="film">
      <div style="clear:both;"></div>
        <div class="context">
          <div class="hd">
            <h2 style="line-height: 250%">正在热映</h2>
          </div>
          <div class="bd">
            <ul style="width: 100%;height: 100%">
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                  <li class="li2"><a class="a2">霸王别姬</a></li>
                  <li class="li3"><a>评分:4.5</a></li>
                  <li class="li4"><a class="myButton">购票</a></li>
                </ul>
              </li>
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                  <li class="li2"><a class="a2">霸王别姬</a></li>
                  <li class="li3"><a>评分:4.5</a></li>
                  <li class="li4"><a class="myButton">购票</a></li>
                </ul>
              </li>
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                  <li class="li2"><a class="a2">霸王别姬</a></li>
                  <li class="li3"><a>评分:4.5</a></li>
                  <li class="li4"><a class="myButton">购票</a></li>
                </ul>
              </li>
              <li>
                <ul >
                  <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                  <li class="li2"><a class="a2">霸王别姬</a></li>
                  <li class="li3"><a>评分:4.5</a></li>
                  <li class="li4"><a class="myButton">购票</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
        <div class="context">
        <div class="hd">
          <h2 style="line-height: 250%">推荐</h2>
        </div>
        <div class="bd">
          <ul style="width: 100%;height: 100%">
            <li>
              <ul >
                <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                <li class="li2"><a class="a2">霸王别姬</a></li>
                <li class="li3"><a>评分:4.5</a></li>
                <li class="li4"><a class="myButton">购票</a></li>
              </ul>
            </li>
            <li>
              <ul >
                <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                <li class="li2"><a class="a2">霸王别姬</a></li>
                <li class="li3"><a>评分:4.5</a></li>
                <li class="li4"><a class="myButton">购票</a></li>
              </ul>
            </li>
            <li>
              <ul >
                <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                <li class="li2"><a class="a2">霸王别姬</a></li>
                <li class="li3"><a>评分:4.5</a></li>
                <li class="li4"><a class="myButton">购票</a></li>
              </ul>
            </li>
            <li>
              <ul >
                <li class="li1"><a style="background-image:url(/images/filmImage/霸王别姬.jpg);" class="a1"></a></li>
                <li class="li2"><a class="a2">霸王别姬</a></li>
                <li class="li3"><a>评分:4.5</a></li>
                <li class="li4"><a class="myButton">购票</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
    </div>
    <base href="<%=basePath%>">

<%--    <a href="${pageContext.request.contextPath}/userAction/toLoginPage.action">登录</a>--%>
<%--    <a href="${pageContext.request.contextPath}/userAction/toRegisterPage.action">注册</a>--%>
  </body>
</html>
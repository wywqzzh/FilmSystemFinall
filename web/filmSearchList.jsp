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
    <link rel="stylesheet" href="<%=basePath%>/css/filmsearchlist.css">
</head>
<body>
<div class="top">
    <h1 class="logo" >
        <a href="" style="background-repeat: no-repeat"></a>
    </h1>
</div>
<div class="nav">
    <div class="webName" title="青柠网">青柠网</div>
    <div class="search">
        <div style="clear:both;"></div>
        <form action="filmAction/searchFilm" style="width: 100%;height: 100%">
            <input type="text" placeholder="云崖之上、秘密访客..." name="searchInput" id="" value="" />
            <button><i>搜索</i></button>
        </form>
    </div>
</div>
<div class="films">
    <% List<Film> films= (List<Film>) session.getAttribute("films");
        if(films!=null){
            for(int i=0;i<films.size();i++) {
                Film film=films.get(i);
    %>
                <div class="film">
<%--                    <a href="${pageContext.request.contextPath }/infoController/getProductInfo?productIdStr=<%=image.getProductId() %>"><%=product.getName() %></a>--%>
                    <span hidden><%=film.getFilmId()%></span>
                    <div class="img"><a style="background-image: url(<%=film.getFilmImgUrl()%>)" class="a1" href="${pageContext.request.contextPath }/filmAction/FilmToDetail?index=<%=i%>&filmId=<%=film.getFilmId()%>"></a> </div>
                    <div class="title" ><a><h4><%=film.getFilmName()%></h4></a></div>
                    <div class="rate"><span><h4>评分:<%=film.getFilmRating()%>(<%=film.getFilmNumberRatings()%>人评价)</h4></span></div>
                    <div class="country" ><span><h4><%=film.getFilmArea()%></h4></span></div>
                    <div class="Type" ><span><h4><%=film.getFilmType()%></h4></span></div>
                    <div class="director" ><span><h4>导演:<%=film.getFilmDirector()%></h4></span></div>
                    <div class="actors" ><span><h4>主演:<%=film.getFilmActors()%></h4></span></div>
                </div>
          <%  }
        }%>

</div>

</body>
</html>
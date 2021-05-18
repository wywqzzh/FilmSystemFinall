<%@ page import="java.util.List" %>
<%@ page import="beans.Film" %>
<%@ page import="beans.Favorite" %><%--
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
    <link rel="stylesheet" href="<%=basePath%>/css/filmdetail.css">
    <script type="text/javascript">
        window.onload=function () {
            var result="<%=session.getAttribute("addReviewState")%>";
            if(result=="nop"){
                alert("观看后才能评论!");
            }else if(result=="exist"){
                alert("您已经评论过!")
            }else if(result=="success"){
                <%session.removeAttribute("addReviewState");%>
                alert("评论成功!");
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
<%--    <% List<Film> films= (List<Film>) session.getAttribute("films");--%>
<%--       String indexs= request.getParameter("index");--%>
<%--       int index = 0;--%>
<%--       if(indexs!=null) {--%>
<%--           index=Integer.parseInt(indexs);--%>
<%--       }else {--%>
<%--           index= (int) request.getSession().getAttribute("index");--%>
<%--       }--%>
<%--        --%>
<%--       String filmId=request.getParameter("filmId");--%>
<%--       if(filmId==null) filmId= (String) request.getSession().getAttribute("filmId");--%>
<%--       request.getSession().setAttribute("index",index);--%>
<%--       request.getSession().setAttribute("filmId",filmId);--%>
<%--       Film film=films.get(index);--%>
    <%
        Film film= (Film) session.getAttribute("film");
        Favorite favorite= (Favorite) session.getAttribute("favorite");
        String userName=(String) session.getAttribute("userName");
    %>
    <div class="film">
        <span hidden><%=film.getFilmId()%></span>
        <div class="img"><a style="background-image: url(<%=film.getFilmImgUrl()%>)" class="a1"></a> </div>
        <div class="title" ><a><h4><%=film.getFilmName()%></h4></a></div>
        <div class="rate"><span><h4>评分:<%=film.getFilmRating()%>(<%=film.getFilmNumberRatings()%>人评价)</h4></span></div>
        <div class="country" ><span><h4><%=film.getFilmArea()%></h4></span></div>
        <div class="Type" ><span><h4><%=film.getFilmType()%></h4></span></div>
        <div class="director" ><span><h4>导演:<%=film.getFilmDirector()%></h4></span></div>
        <div class="actors" ><span><h4>主演:<%=film.getFilmActors()%></h4></span></div>
    </div>
    <div class="collection" id="collection">
        <% if(userName==null||"".equals(userName)){%>
            <a style="color:#1c9ba2;" href="filmAction/collection">收藏</a>
        <%}else {%>
            <a style="color:#1c9ba2;" href="filmAction/cancleCollection">取消收藏</a>
        <%}%>
    </div>
    <div class="scoring">
        <div style="width: 80%;height: 100%;margin-left: 15%">
        <form action="filmAction/addReview" method="post">
            <div style="clear:both;"></div>
            <div class="m1" style="height: 10%">评价：</div>
            <div class="m2 "style="height: 10%;width: 70%">
                <select name="rate">
                    <option>很差</option>
                    <option>较差</option>
                    <option>还行</option>
                    <option>推荐</option>
                    <option>力荐</option>
                </select>
            </div>
            <div class="m1" style="height: 50%;margin-top: 2%">评论:</div>
            <div class="m2" style="height: 50%;margin-top: 2%">
                <textarea rows=6 cols=50 style="resize: none" name="review"></textarea>
            </div>
            <div class="m1"><input type="submit" value="提交评论" style="color:#3d9f4b "></div>
        </form>
        </div>
    </div>
</div>

</body>
</html>
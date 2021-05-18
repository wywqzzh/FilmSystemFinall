<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Cinema" %>
<%@ page import="beans.Hall" %>
<%@ page import="beans.Film" %><%--
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
    <link rel="stylesheet" href="<%=basePath%>/css/manageArrange.css">
    <script type="text/javascript">
        window.onload=function () {
            var films= document.getElementById("filmMessage").getElementsByClassName("mess");
            var cinemas= document.getElementById("cinemaMessage").getElementsByClassName("mess");
            var finallform=document.getElementById("finallSubmit");
            for(var i=0;i<films.length;i++){
                var a=films[i].getElementsByTagName("a")[0];
                a.onclick=function () {
                    var parent=this.parentNode.parentNode;
                    var filmId=parent.getElementsByTagName("span")[0].innerHTML;
                    var finallform=document.getElementById("finallSubmit");
                    var form2 = document.getElementById("showHall");
                    finallform.filmId.value=filmId;
                    form2.filmId.value=filmId;
                    console.log(filmId);
                }
            }
            for(var i=0;i<cinemas.length;i++) {
                var a = cinemas[i].getElementsByTagName("a")[0];
                a.onclick = function () {
                    var parent = this.parentNode.parentNode;
                    var cinemaId = parent.getElementsByTagName("span")[0].innerHTML;
                    var form2 = document.getElementById("showHall");
                    form2.cinemaId.value = cinemaId;
                    form2.submit();
                    // console.log(cinemaId);
                }
            }
            var isHall="<%=session.getAttribute("isHall")%>";
            if("yes"==isHall){

                var halls= document.getElementById("hallMessage").getElementsByClassName("mess");
                for(var i=0;i<halls.length;i++){
                    var a = halls[i].getElementsByTagName("a")[0];
                    a.onclick=function () {
                        var finallform=document.getElementById("finallSubmit");
                        var parent = this.parentNode.parentNode;
                        var hallNum = parent.getElementsByTagName("span")[1].innerHTML;
                        finallform.hallNum.value=hallNum;

                        console.log(hallNum);
                    }
                }
            }
            if(isHall!=undefined){
                var form=document.getElementById("finallSubmit");
                var form2 = document.getElementById("showHall");
                var filmId="<%=session.getAttribute("filmId")%>";
                if(""!=filmId){
                    form.filmId.value=filmId;
                    form2.filmId.value=filmId;

                }else {
                    console.log("filmIdNull");
                }
                var cinemaId="<%=session.getAttribute("cinemaId")%>";
                if(""!=cinemaId){
                    form.cinemaId.value=cinemaId;
                    form2.filmId.value=filmId;
                }else {
                    console.log("filmIdNull");
                }
            }

            var num=finallform.hallNum.value;
            console.log(num);
            // for(var i=0;i<halls.length;i++){
            //     var a1=halls[i].getElementsByTagName("a")[0];
            //     a1.onclick=function () {
            //         var form=document.getElementById("deleteHall");
            //         var parent=this.parentNode.parentNode;
            //         var hallId=parent.getElementsByTagName("span")[0].innerHTML;
            //         console.log("sss");
            //         console.log(hallId);
            //         form.hallId.value=hallId;
            //         form.submit();
            //     }
            // }
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
            <a href="manageAction/manageReview"><h3 style="background-color: #f7f7f7">影评管理</h3></a>
        </div>
        <div class="n1">
            <a href="manageAction/getInitarrange"><h3 style="background-color: #ffffff">排片管理</h3></a>
        </div>
    </div>
    <div class="show">
        <div class="dsearch">
            <div class="note"><h3 style="display: block">选择电影</h3></div>
            <div class="search">

                <div style="clear:both;"></div>
                <form action="manageAction/searchUser" style="width: 100%;height: 100%">
                    <input type="text" placeholder="请输入电影名" name="input" id="" value="" />
                    <button><i>搜索</i></button>
                </form>
            </div>
        </div>


        <form  method="post" action="manageAction/findHallByCinameId" id ="showHall">
            <input id = "CcinemaId" type = "hidden" name="cinemaId">
            <input id = "FfilmId" type = "hidden" name="filmId">
        </form>


        <div class="men">
            <div class="n1" style="width: 25%"><span>电影名</span></div>
            <div class="n2" style="width: 25%;"><span>导演</span></div>
            <div class="n2" style="width:25%;"><span>主演</span></div>
            <div class="n2" style="width: 24.6%;border: 0"></div>
        </div>
        <% List<Film> films=(List<Film>)session.getAttribute("films");
            if(films!=null){%>
        <div class="filmMessage" id="filmMessage">
            <%
                int x=0;
                for(Film film:films) {
                    x+=1;
                    if(x%2==0){%>

            <div class="mess" style="background-color: #f7f7f7">
                <span hidden><%=film.getFilmId()%></span>
                <div class="n1" style="width: 26%"><span><%=film.getFilmName()%></span></div>
                <div class="n1" style="width: 26%"><span><%=film.getFilmDirector()%></span></div>
                <div class="n1" style="width: 25%"><span><%=film.getFilmActors()%></span></div>
                <div class="n1" style="width: 23%"><a>选择</a></div>
            </div>
            <%}else{%>
            <div class="mess" style="background-color: #ffffff">
                <span hidden><%=film.getFilmId()%></span>
                <div class="n1" style="width: 26%"><span><%=film.getFilmName()%></span></div>
                <div class="n1" style="width: 26%"><span><%=film.getFilmDirector()%></span></div>
                <div class="n1" style="width: 25%"><span><%=film.getFilmActors()%></span></div>
                <div class="n1" style="width: 23%"><a>选择</a></div>
            </div>
            <%}
            }%>
        </div>
        <%}%>

        <div class="dsearch">
            <div class="note"><h3 style="display: block">选择影院</h3></div>
            <div class="search">

                <div style="clear:both;"></div>
                <form action="manageAction/searchUser" style="width: 100%;height: 100%">
                    <input type="text" placeholder="请输入影院名" name="input" id="" value="" />
                    <button><i>搜索</i></button>
                </form>
            </div>
        </div>

        <div class="men">
            <div class="n1" style="width: 20%"><span>影院名称</span></div>
            <div class="n2" style="width: 46%;"><span>影院地址</span></div>
            <div class="n2" style="width:20%;"><span>联系电话</span></div>
            <div class="n2" style="width: 13.6%;border: 0"></div>
        </div>
        <% List<Cinema> cinemas=(List<Cinema>)session.getAttribute("cinemas");
            if(cinemas!=null){%>
                <div class="cinemaMessage" id="cinemaMessage">
                    <%
                        int x=0;
                        for(Cinema cinema:cinemas) {
                            x+=1;
                            if(x%2==0){%>

                    <div class="mess" style="background-color: #f7f7f7">
                        <span hidden><%=cinema.getCinemaId()%></span>
                        <div class="n1" style="width: 21%"><span><%=cinema.getCinemaName()%></span></div>
                        <div class="n1" style="width: 47%"><span><%=cinema.getCinemaAddress()%></span></div>
                        <div class="n1" style="width: 21%"><span><%=cinema.getCinemaphone()%></span></div>
                        <div class="n1" style="width: 10.6%"><a>选择</a></div>
                    </div>
                    <%}else{%>
                    <div class="mess" style="background-color: #ffffff">
                        <span hidden><%=cinema.getCinemaId()%></span>
                        <div class="n1" style="width: 21%"><span><%=cinema.getCinemaName()%></span></div>
                        <div class="n1" style="width: 47%"><span><%=cinema.getCinemaAddress()%></span></div>
                        <div class="n1" style="width: 21%"><span><%=cinema.getCinemaphone()%></span></div>
                        <div class="n1" style="width: 10.6%"><a>选择</a></div>
                    </div>
                    <%}
                    }%>
                </div>
            <%}%>
        <div class="dsearch">
            <div class="note"><h3 style="display: block">选择放映厅</h3></div>
        </div>

            <div class="men">
                <div class="n1" style="width: 25%"><span>放映厅编号</span></div>
                <div class="n2" style="width: 25%;"><span>放映厅行数</span></div>
                <div class="n2" style="width:25%;"><span>放映厅列数</span></div>
                <div class="n2" style="width: 24.6%;border: 0"></div>
            </div>

        <% List<Hall> halls=(List<Hall>)session.getAttribute("halls");
            if(halls!=null){%>
        <div class="hallMessage" id="hallMessage">
            <%
                int x=0;
                for(Hall hall:halls) {
                    x+=1;
                    if(x%2==0){%>

            <div class="mess" style="background-color: #f7f7f7">
                <div class="mess" style="background-color: #f7f7f7">
                    <span hidden><%=hall.getHallId()%></span>
                    <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallNum()%></span></div>
                    <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallRow()%></span></div>
                    <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallCol()%></span></div>
                    <div class="n1" style="width: 25%;text-align: center"><a>选择</a></div>
                </div>
            </div>
            <%}else{%>

            <div class="mess" style="background-color: #f7f7f7">
                <span hidden><%=hall.getHallId()%></span>
                <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallNum()%></span></div>
                <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallRow()%></span></div>
                <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallCol()%></span></div>
                <div class="n1" style="width: 25%;text-align: center"><a>选择</a></div>
            </div>
            <%}
            }%>
        </div>
        <%}%>
        <div class="dsearch">
            <div class="note"><h3 style="display: block">其他信息</h3></div>
        </div>

        <div class="inputMessage">
            <div style="clear:both;"></div>
            <form action="manageAction/addArrange" method="post" style="display:block;width: 100%;height: 100%" id="finallSubmit">
                <input type="hidden" name="filmId">
                <input type="hidden" name="cinemaId">
                <input type="hidden" name="hallNum">
                <div style="width: 100%;height: 20%">
                    <div  class="n1"><span>价格:</span></div><div  class="n2"><input type="text" id="price" name="price"></div>
                </div>
                <div style="width: 100%;height: 20%">
                    <div  class="n1"><span>影片开始时间:</span></div><div class="n2"><input type="datetime-local" id="arrangeSartTime" name="arrangeSartTime"></div>
                </div>
                <div style="width: 100%;height: 20%">
                    <div  class="n1"><span>影片结束时间:</span></div><div class="n2"><input type="datetime-local" id="arrangeEndTime" name="arrangeEndTime"></div>
                </div>
                <div style="width: 100%;height: 20%">
                    <div  class="n1"><span>影票开售时间:</span></div><div class="n2"><input type="datetime-local" id="arrangeSaleTime" name="arrangeSaleTime"></div>
                </div>
                <div style="width: 66.5%;margin-top: 1%;text-align: center"><input type="submit" class="myButton" value="提交"></div>
            </form>
        </div>
<%--                    <div class="men">--%>
<%--                        <div class="n1" style="width: 25%"><span>放映厅编号</span></div>--%>
<%--                        <div class="n2" style="width: 25%;"><span>放映厅行数</span></div>--%>
<%--                        <div class="n2" style="width:25%;"><span>放映厅列数</span></div>--%>
<%--                        <div class="n2" style="width: 24.6%;border: 0"></div>--%>
<%--                    </div>--%>
<%--                    <div class="hallMessage" id="hallMessage">--%>
<%--                        <%  List<Hall> halls=(List<Hall>)session.getAttribute("cinemaHall");--%>
<%--                            int x=0;--%>
<%--                            for(Hall hall:halls) {--%>
<%--                                x+=1;--%>
<%--                                if(x%2==0){%>--%>

<%--                        <div class="mess" style="background-color: #f7f7f7">--%>
<%--                            <span hidden><%=hall.getHallId()%></span>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallNum()%></span></div>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallRow()%></span></div>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallCol()%></span></div>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><a>删除</a></div>--%>
<%--                        </div>--%>
<%--                        <%}else{%>--%>
<%--                        <div class="mess" style="background-color: #ffffff">--%>
<%--                            <span hidden><%=hall.getHallId()%></span>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallNum()%></span></div>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallRow()%></span></div>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallCol()%></span></div>--%>
<%--                            <div class="n1" style="width: 25%;text-align: center"><a>删除</a></div>--%>
<%--                        </div>--%>
<%--                        <%}--%>
<%--                        }%>--%>
<%--                        <div style="width: 100%;margin-top: 2%;text-align: center"><a href="manageAction/toAddHallPage" class="myButton">增加影院</a></div>--%>

<%--                    </div>--%>
<%--            <%}--%>
<%--     %>--%>

    </div>
</body>
</html>

<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Cinema" %>
<%@ page import="beans.Hall" %><%--
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
<%--    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
<%--    <script type="text/javascript">--%>
<%--        window.onload=function () {--%>
<%--            var isHall="<%=session.getAttribute("isHall")%>";--%>
<%--            if("yes"==isHall){--%>
<%--                var halls= document.getElementById("hallMessage").getElementsByClassName("mess");--%>
<%--                for(var i=0;i<halls.length;i++){--%>
<%--                    var a1=halls[i].getElementsByTagName("a")[0];--%>
<%--                    a1.onclick=function () {--%>
<%--                        var form=document.getElementById("deleteHall");--%>
<%--                        var parent=this.parentNode.parentNode;--%>
<%--                        var hallId=parent.getElementsByTagName("span")[0].innerHTML;--%>
<%--                        console.log("sss");--%>
<%--                        console.log(hallId);--%>
<%--                        form.hallId.value=hallId;--%>
<%--                        form.submit();--%>
<%--                    }--%>
<%--                }--%>
<%--            }else {--%>
<%--                var cinemas = document.getElementById("userMessage").getElementsByClassName("mess");--%>
<%--                for (var i = 0; i < cinemas.length; i++) {--%>
<%--                    var a1 = cinemas[i].getElementsByTagName("a")[0];--%>
<%--                    a1.onclick = function () {--%>
<%--                        var parent = this.parentNode.parentNode;--%>
<%--                        var cinemaId = parent.getElementsByTagName("span")[0].innerHTML;--%>
<%--                        var cinemaName = parent.getElementsByClassName("n1")[0].getElementsByTagName("span")[0].innerHTML;--%>
<%--                        var cinemaAddress = parent.getElementsByClassName("n1")[1].getElementsByTagName("span")[0].innerHTML;--%>
<%--                        var cinemaPhone = parent.getElementsByClassName("n1")[2].getElementsByTagName("span")[0].innerHTML;--%>

<%--                        var form = document.getElementById("passForm");--%>

<%--                        form.cinemaId.value = cinemaId;--%>
<%--                        form.cinemaName.value = cinemaName;--%>
<%--                        form.cinemaAddress.value = cinemaAddress;--%>
<%--                        form.cinemaphone.value = cinemaPhone;--%>

<%--                    }--%>
<%--                    var a2 = cinemas[i].getElementsByTagName("a")[1];--%>
<%--                    a2.onclick = function () {--%>
<%--                        var parent = this.parentNode.parentNode;--%>
<%--                        var cinemaId = parent.getElementsByTagName("span")[0].innerHTML;--%>
<%--                        var form = document.getElementById("showHall");--%>
<%--                        form.cinemaId.value = cinemaId;--%>
<%--                        form.submit();--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
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
        <div class="n1">
            <a href="manageAction/toArrangePage"><h3 style="background-color: #ffffff">排片管理</h3></a>
        </div>
    </div>
    <div class="show">
        <div class="dsearch">
            <div class="note"><h2 style="display: block">选择电影</h2></div>
            <div class="search">

                <div style="clear:both;"></div>
                <form action="manageAction/searchUser" style="width: 100%;height: 100%">
                    <input type="text" placeholder="请输入电影名" name="input" id="" value="" />
                    <button><i>搜索</i></button>
                </form>
            </div>
        </div>


        <form  method="post" action="manageAction/updateCinemaPage" id ="passForm">
            <input id = "CcinemaId" type = "hidden" name="cinemaId">
            <input id = "cinemaName" type = "hidden" name="cinemaName">
            <input id = "cinemaAddress" type = "hidden" name="cinemaAddress">
            <input id = "cinemaphone" type = "hidden" name="cinemaphone">
        </form>
        <form  method="post" action="manageAction/findCinemaHall" id ="showHall">
            <input id = "CccinemaId" type = "hidden" name="cinemaId">
        </form>
        <form  method="post" action="manageAction/removeHall" id ="deleteHall">
            <input id = "hallId" type = "hidden" name="hallId">
        </form>
        <% String ishall= (String) session.getAttribute("isHall");
            if(ishall==null || "".equals(ishall)){%>
                <div class="men">
                    <div class="n1" style="width: 25%"><span>电影名</span></div>
                    <div class="n2" style="width: 25%;"><span>导演</span></div>
                    <div class="n2" style="width:25%;"><span>主演</span></div>
                    <div class="n2" style="width: 24.6%;border:0;"></div>
                </div>
                <div class="filmMessage" id="filmMessage">
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
            <%}else {%>
                    <div class="men">
                        <div class="n1" style="width: 25%"><span>放映厅编号</span></div>
                        <div class="n2" style="width: 25%;"><span>放映厅行数</span></div>
                        <div class="n2" style="width:25%;"><span>放映厅列数</span></div>
                        <div class="n2" style="width: 24.6%;border: 0"></div>
                    </div>
                    <div class="hallMessage" id="hallMessage">
                        <%  List<Hall> halls=(List<Hall>)session.getAttribute("cinemaHall");
                            int x=0;
                            for(Hall hall:halls) {
                                x+=1;
                                if(x%2==0){%>

                        <div class="mess" style="background-color: #f7f7f7">
                            <span hidden><%=hall.getHallId()%></span>
                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallNum()%></span></div>
                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallRow()%></span></div>
                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallCol()%></span></div>
                            <div class="n1" style="width: 25%;text-align: center"><a>删除</a></div>
                        </div>
                        <%}else{%>
                        <div class="mess" style="background-color: #ffffff">
                            <span hidden><%=hall.getHallId()%></span>
                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallNum()%></span></div>
                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallRow()%></span></div>
                            <div class="n1" style="width: 25%;text-align: center"><span><%=hall.getHallCol()%></span></div>
                            <div class="n1" style="width: 25%;text-align: center"><a>删除</a></div>
                        </div>
                        <%}
                        }%>
                        <div style="width: 100%;margin-top: 2%;text-align: center"><a href="manageAction/toAddHallPage" class="myButton">增加影院</a></div>

                    </div>
            <%}
     %>

    </div>
</body>
</html>

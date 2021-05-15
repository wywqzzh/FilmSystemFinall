<%@ page import="beans.User" %>
<%@ page import="java.util.List" %><%--
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
    <link rel="stylesheet" href="<%=basePath%>/css/root.css">
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript">
        window.onload=function () {
            var users = document.getElementById("userMessage").getElementsByClassName("mess");
                for(var i=0;i<users.length;i++){

                    var a1=users[i].getElementsByTagName("a")[0];
                    var a2=users[i].getElementsByTagName("a")[1];
                    a1.onclick=function () {
                        var operater=this.innerHTML;
                        var parent=this.parentNode.parentNode;
                        var userName=parent.getElementsByClassName("n1")[0].getElementsByTagName("span")[0].innerHTML;
                        var form=document.getElementById("passForm");
                        form.operateUserName.value=userName;
                        form.operator.value=operater;
                        form.submit();
                    }
                    a2.onclick=function () {
                        var operater=this.innerHTML;
                        var parent=this.parentNode.parentNode;
                        var userName=parent.getElementsByClassName("n1")[0].getElementsByTagName("span")[0].innerHTML;
                        var form=document.getElementById("passForm");
                        form.operateUserName.value=userName;
                        form.operator.value=operater;
                        form.submit();
                    }
                }
        }

        // window.onclick = function(){
        //     var users = document.getElementById("userMessage").getElementsByClassName("mess");
        //     for(var i=0;i<users.length;i++){
        //         var userName=users[i].getElementsByTagName("span")[0].innerText;
        //         var a1=users[i].getElementsByTagName("a")[0];
        //         a1.on
        //     }
        // }
        // $("a").on("click",function(){
        //     var x=$(this).innerText;//弹出被点击的a标签的id
        //     console.log(x);
        // })
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
            <a><h3 style="background-color: #f7f7f7">影评管理</h3></a>
        </div>
        <div class="n1">
            <a href="manageAction/toArrangePage"><h3 style="background-color: #ffffff">排片管理</h3></a>
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
            <div class="n1"><span>用户名</span></div>
            <div class="n2"><span>账号状态</span></div>
            <div class="n2"><span>用户类型</span></div>
            <div class="n2"></div>
            <div class="n2" style="width: 19.6%;border:0;"></div>
        </div>
        <form  method="post" action="manageAction/updateUser" id ="passForm">
            <input id = "operateUserName" type = "hidden" name="operateUserName">
            <input id ="operator" type="hidden" name="operator">
        </form>
        <div class="userMessage" id="userMessage">
            <%  List<User> users=(List<User>)session.getAttribute("manageUsers");
                int x=0;
                for(User user:users) {
                    x+=1;
                    if(x%2==0){%>
            <div class="mess" style="background-color: #f7f7f7">

                <div class="n1" ><span><%=user.getUserName()%></span></div>
                <%if(user.getUserState()==0){%>
                <div class="n1" ><span>正常</span></div>
                <%}else {%>
                <div class="n1" ><span>冻结</span></div>
                <%}%>

                <%if(user.getUserType()==0){%>
                <div class="n1" ><span>普通用户</span></div>
                <%}else {%>
                <div class="n1" ><span>管理员</span></div>
                <%}%>

                <%if(user.getUserState()==0){%>
                <div class="n1" ><a>冻结</a></div>
                <%}else {%>
                <div class="n1" ><a>解冻</a></div>
                <%}%>


                <%if(user.getUserType()==0){%>
                <div class="n1" ><a>设为管理员</a></div>
                <%}else {%>
                <div class="n1" ><a>取消管理员</a></div>
                <%}%>
            </div>
            <%}else{%>
            <div class="mess" style="background-color: #ffffff">
                <div class="n1" ><span><%=user.getUserName()%></span></div>

                <%if(user.getUserState()==0){%>
                <div class="n1" ><span>正常</span></div>
                <%}else {%>
                <div class="n1" ><span>冻结</span></div>
                <%}%>

                <%if(user.getUserType()==0){%>
                <div class="n1" ><span>普通用户</span></div>
                <%}else {%>
                <div class="n1" ><span>管理员</span></div>
                <%}%>

                <%if(user.getUserState()==0){%>
                <div class="n1" ><a>冻结</a></div>
                <%}else {%>
                <div class="n1" ><a>解冻</a></div>
                <%}%>


                <%if(user.getUserType()==0){%>
                <div class="n1" ><a>设为管理员</a></div>
                <%}else {%>
                <div class="n1" ><a>取消管理员</a></div>
                <%}%>

            </div>
            <%}
            }%>
        </div>

    </div>
</body>
</html>

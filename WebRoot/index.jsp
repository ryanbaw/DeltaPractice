<%--
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>
<%@ page language="java" import="java.util.*,com.delta.practice.entity.Users" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta charset="UTF-8" />
        <title><%=request.getServletContext().getServerInfo() %></title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link href="tomcat.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
    <div>
    <%
        Users user=new Users();
        user=(Users)request.getSession().getAttribute("loginusername");
        if(user==null){
            out.print("<a href='login.jsp'>Login</a>");
            out.print("<a href='signup.jsp'>Signup</a>");
        }else{
            out.print("<font size='3'>欢迎您  :"+user.getUsername()+"</font>");
            out.print("&nbsp;&nbsp;");
            out.print("<font size='3'><a href='usersServlet?handle=7'>退出</a></font>");
            out.print("&nbsp;&nbsp;");
            out.print("<a href='signup.jsp'>Signup</a>");
        }
    %>
    </div>

    <div id="QueryArea">
        <form action="${pageContext.request.contextPath }/food" method="get">
            <input type="hidden" name="method" value="search">
            <input type="text" name="keyword" title="请输入菜品名称">
            <input type="submit" value="搜索">
        </form>
    </div>
    <div id="MainArea">
        <table class="MainArea_Content" align="center" cellspacing="0" cellpadding="0">
            <!-- 表头-->
            <thead>
                <tr align="center" valign="middle" id="TableTitle">
                    <td>菜编号</td>
                    <td>菜名</td>
                    <td>所属菜系</td>
                    <td>价格</td>
                    <td>会员价格</td>
                    <td>操作</td>
                </tr>
            </thead>    
            <!--显示数据列表 -->
            <tbody id="TableData">
            <c:forEach items="${requestScope.list}" var="food" varStatus="vs">
                <tr class="TableDetail1">
                    <td>${vs.count }</td>
                    <td>${food.foodName }</td>
                    <c:forEach items="${ requestScope.types}" var="type" >
                        <c:if test="${food.foodType_id==type.id }">
                            <c:set var="type1" value="${type.typeName}"/>
                        </c:if>
                    </c:forEach>
                    <td><c:out value="${type1}"></c:out></td>
                    <td>${food.price}</td>
                    <td>${food.mprice}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/food?method=update&id=${food.id}" class="FunctionButton">更新</a>
                        <a href="${pageContext.request.contextPath}/food?method=delete&id=${food.id}" onClick="return delConfirm();" class="FunctionButton">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    </body>

</html>

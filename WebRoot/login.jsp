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
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");
request.setAttribute("year", sdf.format(new java.util.Date()));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BRAVO</title>
    <meta name="keywords" content="BRAVO">
    <meta name="content" content="BRAVO">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
</head>
<body class="login_bj" >
<div class="zhuce_body">
    <div class="zhuce_kong login_kuang">
        <div class="zc">
            <div class="bj_bai">
                <h3>登录</h3>
                <form action="usersServlet" method="post">
                    <input name="loginusername" type="text" class="kuang_txt" placeholder="请输入手机号">
                    <input name="loginpassword" type="password" class="kuang_txt" placeholder="请输入密码">
                    <div>
                        <a href="#">忘记密码？</a>
                        <input name="rememberme" type="checkbox" value="remember" checked><span>记住我</span> 
                    </div>
                    <input name="登录" type="submit" class="btn_zhuce" value="登录">
                </form>
            </div>
            <div class="bj_right">
                <p>使用以下账号直接登录</p>
                <a href="#" class="zhuce_qq">QQ注册</a>
                <a href="#" class="zhuce_wb">微博注册</a>
                <a href="#" class="zhuce_wx">微信注册</a>
                <p>已有账号？<a href="#">立即登录</a></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>

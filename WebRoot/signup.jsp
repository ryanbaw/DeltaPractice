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
request.setAttribute("tomcatUrl", "http://tomcat.apache.org/");
request.setAttribute("tomcatDocUrl", "/docs/");
request.setAttribute("tomcatExamplesUrl", "/examples/");
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
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>

<body class="login_bj" >
<div class="zhuce_body">
    <div class="zhuce_kong">
        <div class="zc">
            <div class="bj_bai">
            <h3>欢迎注册</h3>
                <form action="com/practice/servlet/SignUpHandle" name="signupForm" method="post">
                    <input name="phone" type="text" class="kuang_txt phone" placeholder="手机号">
                    <input name="email" type="text" class="kuang_txt email" placeholder="邮箱">
                    <input name="password" type="password" class="kuang_txt possword" placeholder="密码">
                    <input name="invitationcode" type="text" class="kuang_txt possword" placeholder="邀请码">
                    <input name="pincodes" type="text" class="kuang_txt yanzm" placeholder="验证码">
                    <div>
                        <div class="hui_kuang">
                            <img src="images/zc_22.jpg" width="92" height="31">
                        </div>
                        <div class="shuaxin">
                            <a href="#">
                                <img src="images/zc_25.jpg" width="13" height="14">
                            </a>
                        </div>
                    </div>
                    <div>
                        <input name="" type="checkbox" value="">
                        <span>已阅读并同意<a href="#" target="_blank"><span class="lan">《霸王条款》</span></a></span>
                    </div>
                    <input name="注册" type="button" class="btn_zhuce" value="注册">
                </form>
            </div>
            <div class="bj_right">
                <p>使用以下账号直接登录</p>
                <a href="#" class="zhuce_qq">QQ注册</a>
                <a href="#" class="zhuce_wb">微博注册</a>
                <a href="#" class="zhuce_wx">微信注册</a>
                <p>已有账号？<a href="login.jsp">立即登录</a></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>

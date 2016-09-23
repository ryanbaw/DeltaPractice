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
    <title>注册新用户</title>
    <meta name="keywords" content="BRAVO">
    <meta name="content" content="BRAVO">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        function reloadCode(){
            var time = new Date().getTime();
            document.getElementById("imagecode").src="<%=request.getContextPath() %>/imageServlet?d="+time;
        }

        var cflags = Array("0","0","0","0","0","0");
        function checkall() {
            checkusername();
            checkpassword();
            checkcpassword();
            checkemail();
            checkccode();
            checkBox();
            var i=0;
            while (i<6) {
                if (cflags[i]=="0") {
                    alert("你的用户信息不正确,请检查!");
                    alert(cflags);
                    i=10;
                    return false;
                } else {
                    i++;
                    if (i==6) {
                        return true;
                    }
                }
            };
        }
        //检查用户名;
        function checkusername() {
            var msg=new Array(
            "<font color=\"red\" class=\"STYLE1\" >用户名不能为空</font>",
            "<font color=\"red\" class=\"STYLE1\" >用户名长度不正确</font>",
            "" );
            var username =  document.getElementById("regusername").value;
            if (username == "") {
                usermessage(0);
                cflags[0]="0";
                return false;
            }
            if(username.length<4||username.length>18){
                usermessage(1);
                cflags[0]="0";
                return false;
            }else{
                usermessage(2);
                cflags[0]="1";
                return true;
            }
            function usermessage(id){
                document.getElementById("check_info").innerHTML = msg[id];
            }
        }
        //检查登入密码;
        function checkpassword(){
            var pwd = document.getElementById("regpassword").value;

            if (pwd.length<6||pwd.length>16){
                document.getElementById("pwd_info").innerHTML = "<font color=\"red\">密码格式不正确</font>";
                cflags[1]="0";
                // alert(cflags[1]);
                return false;
            } else {
                document.getElementById("pwd_info").innerHTML = "";
                cflags[1]="1";
                return true;
            }
        }
        //检查密码是否一致;
        function checkcpassword(){
            var pwd2 = document.getElementById("regrepassword").value;
            if (pwd2==document.getElementById("regpassword").value) {
                document.getElementById("pwdrepeat_info").innerHTML = "";
                cflags[2]="1";
                return true;
            } else {
                document.getElementById("pwdrepeat_info").innerHTML = "<font color=\"red\">两次输入的密码不一致，请检查后重试。</font>";
                cflags[2]="0";
                // alert(cflags[2]);
                return false;
            }
        }
        //检查Email
        function checkemail() {
            var email=document.getElementById("regemail").value;
            var reg=new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
            if(reg.test(email)) {
                document.getElementById("email_info").innerHTML = "";
                cflags[3]="1";
            } else {
                document.getElementById("email_info").innerHTML = "E-mail地址无效";
                cflags[3]="0";
            }
        }
        //检查验证码;
        function checkccode() {
            if (document.getElementById("regcheckcode").value=="") {
                document.getElementById("checkcode_info").innerHTML="验证码不能为空";
                cflags[4]="0";
            } else {
                document.getElementById("checkcode_info").innerHTML="";
                cflags[4]="1";
            }
        }
        //检查协议;
        function checkBox(){
            if (document.getElementById("treatyid").checked){
                cflags[5]="1";
            } else {
                cflags[5]="0";
                return;
            }
        }
    </script>
</head>

<body class="login_bj" >
<div class="zhuce_body">
    <div class="zhuce_kong">
        <div class="zc">
            <div class="bj_bai">
            <h3>欢迎注册</h3>
                <form action="<%=request.getContextPath() %>/usersServlet?handle=2" name="signupForm" method="post">
                    <input name="regusername" type="text" class="kuang_txt phone" placeholder="账号" onblur="checkusername()">
                    <div id="check_info"></div>

                    <input name="regpassword" type="password" class="kuang_txt possword" placeholder="密码" onblur="checkpassword()">
                    <div id="pwd_info"></div>

                    <input name="regrepassword" type="password" class="kuang_txt possword" placeholder="重复密码" onblur="checkcpassword()">
                    <div id="pwdrepeat_info"></div>

                    <input name="regemail" type="text" class="kuang_txt email" placeholder="邮箱" onblur="checkemail()">
                    <div id="email_info"></div>

                    <input name="regcheckcode" type="text" class="kuang_txt yanzm" placeholder="验证码" onblur="checkccode()">
                    <div id="checkcode_info"></div>

                    <div>
                        <div class="hui_kuang">
                            <img id="imagecode" src="<%=request.getContextPath() %>/imageServlet" width="100" height="30">
                        </div>
                        <div class="shuaxin">
                            <a href="javascript: reloadCode();">
                                <img src="images/zc_25.jpg" width="13" height="14">
                            </a>
                        </div>
                    </div>
                    <div>
                        <input id="treatyid" name="treaty" type="checkbox" onclick="checkBox()">
                        <span>已阅读并同意<a href="king_terms.html" target="_blank"><span class="lan">《霸王条款》</span></a></span>
                    </div>
                    <input name="注册" type="submit" class="btn_zhuce" value="注册">
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

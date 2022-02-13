<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body style="background-color: pink">
<div style="position: absolute;left: 45%;top: 47%" >
    <strong style="font-size: 60px">欢迎来到大眼的洗浴中心</strong><br>
    <strong onclick="jump1()" style="color: #00F7DE">vip贵宾接待所，有请一号技师</strong><br>
    <strong onclick="jump2()" style="color: aquamarine">办理会员卡，冲一千送两千</strong>
</div>
</body>
<script type="text/javascript">
    function jump1() {
        location.href = "login"
    }
    function jump2() {
        location.href = "register"
    }
</script>
</html>
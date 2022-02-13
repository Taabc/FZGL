<%--
  Created by IntelliJ IDEA.
  User: BES
  Date: 2021/6/23
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body style="background-image: url('${pageContext.request.contextPath}/img/QQ图片20210623092307.png')">
<div style="position: absolute;left:39%;top:37%">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="用户名不能为空"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" lay-verify="title" autocomplete="off" placeholder="请输入6~16位的密码"
                   class="layui-input">
        </div>
    </div>



    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" onclick="login()">登录</button>
            <button class="layui-btn" onclick="register()">注册</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
    function register() {
        location.href = "register.jsp";
    }

    function login() {
        //先获取输入框里面的值(数组)
        var inputs = document.getElementsByTagName("input");

        //提交到后端方法，代替form表单原生提交方法
        //特点：异步请求，局部刷新
        //在ajax里判断提交成功与否，再去指定跳转到什么界面
        $.ajax({
            //请求方法
            type: "post",
            //请求的后端路径
            url: "user/login",
            //后端返回的数据，如果封装成对象，因为是java对象,前端js不能直接将其转化，就需要一个中间格式：json（字符串类型的对象，可以通过工具相互转化）
            dataType: "json",
            //传递给后端的数据，从input输入框里面去拿
            data: {
                username: inputs[0].value,
                password: inputs[1].value
            },
            //只要提交到后端成功，就执行success方法
            //result是后端返回给前端的数据，对应后端向前端写入的内容resultMap
            success: function (result) {
                //如果前端不能把json转化为js对象
                // result = eval("(" + result + ")");
                // console.log(result);
                // console.log(result.status);

                if (result.status) {
                    //登陆成功
                    location.href = "index_v";

                } else {
                    //登录失败
                    alert("登陆失败，你个小垃圾");
                    //刷新界面
                    location.reload()
                }
            }
        })
    }
</script>
</html>
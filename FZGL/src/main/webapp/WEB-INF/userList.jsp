<%--
  Created by IntelliJ IDEA.
  User: BES
  Date: 2021/6/25
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test"></table>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="updateUser">
    <form class="layui-form" lay-filter="updateForm">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input" disabled>
            </div>
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
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="text" name="tel" lay-verify="title" autocomplete="off" placeholder="请填写11位手机号"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <input type="text" name="address" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户类型</label>
            <div class="layui-input-block">
                <select name="type" lay-filter="type" id="select1">
                    <%--                selected默认选项--%>
                    <option value="1" selected="">大众会员</option>
                    <option value="2">商家</option>
                    <option value="3">管理员</option>
                </select>
            </div>
        </div>
    </form>
</script>

<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../js/jquery-3.6.0.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->

<script>
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        //表格渲染
        table.render({
            //元素，渲染什么元素
            elem: '#test'
            //请求后端的路径
            , url: 'user/userList'
            , title: '用户数据表'
            , parseData: function (result) {
                return {
                    //默认 是成功
                    code: 0,
                    count: result.count,
                    data: result.list
                }
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                //filed 后端映射属性名  title列头名 sort：true  排序：开启
                , {field: 'id', title: 'ID', width: 80, fixed: 'left', unresize: true, sort: true}
                , {field: 'username', title: '用户名', width: 120, edit: 'text'}
                , {field: 'password', title: '密码', width: 120, edit: 'text'}
                , {field: 'name', title: '姓名', width: 120, edit: 'text'}
                , {field: 'tel', title: '联系方式', width: 120, edit: 'text'}
                , {
                    field: 'type', title: '用户类型', width: 150, edit: 'text', templet: function (res) {
                        if (res.type == 1) {
                            return "大众会员";
                        } else if (res.type == 2) {
                            return "商家";
                        } else {
                            return "管理员";
                        }
                    }
                }
                , {field: 'address', title: '城市', width: 100}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
            ]]
            , page: true
        });


        //监听行工具事件
        table.on('tool(test)', function (obj) {
            //obj 包含被点击的一条数据，也包含被点击的按钮
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.open({
                    //弹框内的内容，内容内容写到script标签内
                    //获取修改用户的标签的script标签的dom对象
                    content: "确定要删除吗？"
                    , type: 0
                    , area: ['500px', '600px']
                    //btn button 弹出层内置三个按钮
                    , btn: ['立即删除','取消']
                    //三个按钮各自调用方法
                    , yes: function (index, layero) {
                        //按钮【按钮一】的回调
                        $.ajax({
                            type: "post",
                            url:"user/deleteUser",
                            data:{
                                id: data.id
                            },
                            datatype: "json",
                            success:function (result) {
                                //result = eval("(" + result + ")");
                                if (result.status) {
                                    alert("删除成功，刷新本页面");
                                    location.reload();
                                } else {
                                    alert("删除失败，请重试");
                                }
                            }
                        })
                    }
                    , btn2: function (index, layero) {
                        //按钮【按钮二】的回调

                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                    //点击按钮一瞬间执行，在显示弹框之前加载完毕
                    , success: function () {
                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                });
            } else if (obj.event === 'edit') {
                //获取所有input dom对象
                var inputs = $("input");
                //layer.open 通过layui内置layer弹出对象打开一个弹出层
                layer.open({
                    //弹框内的内容，内容内容写到script标签内
                    //获取修改用户的标签的script标签的dom对象
                    content: $("#updateUser").html()
                    , type: 1
                    , area: ['500px', '600px']
                    //btn button 弹出层内置三个按钮
                    , btn: ['立即提交', '重置', '取消']
                    //三个按钮各自调用方法
                    , yes: function (index, layero) {
                        //按钮【按钮一】的回调
                        $.ajax({
                            type: "post",
                            url:"user/updateUser",
                            data:{
                                updateValue :function () {
                                 //   把用户修改弹出框的form表单数据一起打包发给后端
                                    return JSON.stringify(form.val("updateForm"));
                            }},
                            datatype: "json",
                            success:function (result) {
                                //result = eval("(" + result + ")");
                                if (result.status) {
                                    alert("修改成功，刷新本页面");
                                    location.reload();
                                } else {
                                    alert("修改失败，请重试");
                                }
                            }
                        })
                    }
                    , btn2: function (index, layero) {
                        //按钮【按钮二】的回调
                        form.val(
                            "updateForm", {
                                "id": data.id,
                                "username": data.username,
                                "password": data.password,
                                "name": data.name,
                                "tel": data.tel,
                                "address": data.address,
                                "type": data.type,
                            }
                        );
                        form.render();
                        return false;
                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                    , btn3: function (index, layero) {
                        //按钮【按钮三】的回调

                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                    //点击按钮一瞬间执行，在显示弹框之前加载完毕
                    , success: function () {
                        form.val(
                            "updateForm", {
                                "id": data.id,
                                "username": data.username,
                                "password": data.password,
                                "name": data.name,
                                "tel": data.tel,
                                "address": data.address,
                                "type": data.type,
                            }
                        );
                        form.render()
                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                });
            }
        });
    });
</script>

</body>
</html>
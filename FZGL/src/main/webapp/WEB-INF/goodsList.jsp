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

<table class="layui-hide" id="goodsTable" lay-filter="goodsTable"></table>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="in">入库</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="out">出库</a>
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addGoodsBtn">添加商品</button>
    </div>
</script>
<%--编辑商品form表单--%>
<script type="text/html" id="updateUserScript">

    <form class="layui-form" lay-filter="updateForm">
        <div class="layui-form-item">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="id" lay-verify="title" autocomplete="off" placeholder=""
                   class="layui-input" disabled>
        </div>
    </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text" name="price" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品类型</label>
            <div class="layui-input-block">
                <input type="text" name="type" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

    </form>
</script>
<%--添加商品form表单--%>
<script type="text/html" id="addGoodsScript">
    <form class="layui-form" lay-filter="addForm">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text" name="price" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存量</label>
            <div class="layui-input-block">
                <input type="text" name="repertory" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品类型</label>
            <div class="layui-input-block">
                <input type="text" name="type" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

    </form>
</script>
<%--商品入库form表单--%>
<script type="text/html" id="inGoodsScript">
    <form class="layui-form" lay-filter="inForm">
        <div class="layui-form-item">
            <label class="layui-form-label">入库量</label>
            <div class="layui-input-block">
                <input type="text" name="num" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input" id="inin">
            </div>
        </div>

    </form>
</script>

<%--商品出库form表单--%>
<script type="text/html" id="outGoodsScript">
    <form class="layui-form" lay-filter="outForm">
        <div class="layui-form-item">
            <label class="layui-form-label">出库量</label>
            <div class="layui-input-block">
                <input type="text" name="num" lay-verify="title" autocomplete="off" placeholder=""
                       class="layui-input" id="outout">
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
            elem: '#goodsTable'
            //请求后端的路径
            , url: 'goods/goodsList'
            , title: '商品数据表'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
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
                , {field: 'name', title: '商品名', width: 300, edit: 'text'}
                , {field: 'price', title: '价格', width: 120, edit: 'text'}
                , {field: 'repertory', title: '库存', width: 120, edit: 'text'}
                , {field: 'type', title: '商品类型', width: 120, edit: 'text'}
                , {field: 'uid', title: '拥有者', width: 100}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 400}
            ]]
            , page: true
        });

        //头工具栏事件
        table.on('toolbar(goodsTable)', function(obj){
            if (obj.event === 'addGoodsBtn') {
                layer.open({
                    //弹框内的内容，内容内容写到script标签内
                    //获取修改用户的标签的script标签的dom对象
                    content: $("#addGoodsScript").html()
                    , type: 1
                    , area: ['500px', '600px']
                    //btn button 弹出层内置三个按钮
                    , btn: ['立即入库','取消']
                    //三个按钮各自调用方法
                    , yes: function (index, layero) {
                        //按钮【按钮一】的回调
                        $.ajax({
                            type: "post",
                            url:"goods/addGoods",
                            data:{
                                addValue :function () {
                                    //   把用户修改弹出框的form表单数据一起打包发给后端
                                    return JSON.stringify(form.val("addForm"));
                                }
                            },
                            datatype: "json",
                            success:function (result) {
                                //result = eval("(" + result + ")");
                                if (result.status) {
                                    alert("添加成功，刷新本页面");
                                    location.reload();
                                } else {
                                    alert("添加失败，请重试");
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
            }
        });

        //监听行工具事件
        table.on('tool(goodsTable)', function (obj) {
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
                            url:"goods/deleteGoods",
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
                //layer.open 通过layui内置layer弹出对象打开一个弹出层
                layer.open({
                    //弹框内的内容，内容内容写到script标签内
                    //获取修改用户的标签的script标签的dom对象
                    content: $("#updateUserScript").html()
                    , type: 1
                    , area: ['500px', '600px']
                    //btn button 弹出层内置三个按钮
                    , btn: ['立即提交', '重置', '取消']
                    //三个按钮各自调用方法
                    , yes: function (index, layero) {
                        //按钮【按钮一】的回调
                        $.ajax({
                            type: "post",
                            url:"goods/updateGoods",
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
                                "name": data.name,
                                "price": data.price,
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
                                "name": data.name,
                                "price": data.price,
                                "type": data.type,
                            }
                        );
                        form.render()
                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                });
            }else if (obj.event === 'in') {

                //layer.open 通过layui内置layer弹出对象打开一个弹出层
                layer.open({
                    //弹框内的内容，内容内容写到script标签内
                    //获取修改用户的标签的script标签的dom对象
                    content: $("#inGoodsScript").html()
                    , type: 1
                    , area: ['500px', '600px']
                    //btn button 弹出层内置三个按钮
                    , btn: ['立即提交','取消']
                    //三个按钮各自调用方法
                    , yes: function (index, layero) {
                        alert(form.val("inForm").num);
                        //按钮【按钮一】的回调
                        $.ajax({
                            type: "post",
                            url:"goods/updateRepertory",
                            data:{
                                num: form.val("inForm").num,
                                id: data.id,
                                repertory: data.repertory,
                                flag: "in"
                            },
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
                    , btn3: function (index, layero) {
                        //按钮【按钮三】的回调

                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                    //点击按钮一瞬间执行，在显示弹框之前加载完毕
                    , success: function () {
                        form.render()
                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                });
            }else if (obj.event === 'out') {
                //layer.open 通过layui内置layer弹出对象打开一个弹出层
                layer.open({
                    //弹框内的内容，内容内容写到script标签内
                    //获取修改用户的标签的script标签的dom对象
                    content: $("#outGoodsScript").html()
                    , type: 1
                    , area: ['500px', '600px']
                    //btn button 弹出层内置三个按钮
                    , btn: ['立即提交','取消']
                    //三个按钮各自调用方法
                    , yes: function (index, layero) {
                        //按钮【按钮一】的回调
                        $.ajax({
                            type: "post",
                            url:"goods/updateRepertory",
                            data:{
                                num:form.val("outForm").num,
                                id: data.id,
                                repertory: data.repertory,
                                flag: "out"
                            },
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
                    , btn3: function (index, layero) {
                        //按钮【按钮三】的回调

                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                    //点击按钮一瞬间执行，在显示弹框之前加载完毕
                    , success: function () {
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
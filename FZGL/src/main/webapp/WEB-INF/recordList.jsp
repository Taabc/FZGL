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
    <title>出入库记录列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-hide" id="recordTable" lay-filter="recordTable"></table>


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
            elem: '#recordTable'
            //请求后端的路径
            , url: 'goods/recordList'
            , title: '记录数据表'
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
                , {field: 'uid', title: '操作者id', width: 120, edit: 'text'}
                , {field: 'time', title: '操作时间', width: 400, edit: 'text'}
                , {field: 'gid', title: '商品id', width: 120, edit: 'text'}
                , {field: 'flag', title: '出/入', width: 120, edit: 'text'}
                , {field: 'nums', title: '操作数量', width: 100}
            ]]
            , page: true
        });
    });
</script>

</body>
</html>
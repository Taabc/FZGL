<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: BES
  Date: 2021/6/25
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>���۵ķ�װϵͳ</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">���۵ķ�װϵͳ</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
                    <%
                        User loginUser = (User) request.getSession().getAttribute("loginUser");
                        String username;
                        if (loginUser != null) {
                            username = loginUser.getName();
                        } else {
                            username = "δ��¼";
                        }
                    %>
                    <%=username%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">Your Profile</a></dd>
                    <dd><a href="">Settings</a></dd>
                    <dd><a href="">Sign out</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- ��ർ�����򣨿����layui���еĴ�ֱ������ -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">�û�����</a>
                    <dl class="layui-nav-child">
                        <dd><a href="userList" target="body">�û��б�</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">�ֿ����</a>
                    <dl class="layui-nav-child">
                        <dd><a href="goodsList" target="body">��Ʒ�б�</a></dd>
                        <dd><a href="recordList" target="body">������¼</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- ������������ -->
        <iframe src="index.jsp" name="body" style="width: 95%;height: 620px"></iframe>
    </div>

    <div class="layui-footer">
        <!-- �ײ��̶����� -->
        �ײ��̶�����
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //ͷ���¼�
        util.event('lay-header-event', {
            //���˵��¼�
            menuLeft: function(othis){
                layer.msg('չ�����˵��Ĳ���', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">�����Ҳ����Ĳ���</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //���Ͻ�
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

    });
</script>
</body>
</html>
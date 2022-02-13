/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2021-07-17 12:41:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import pojo.User;

public final class index_005fv_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=gb2312");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\r\n");
      out.write("    <title>大眼的服装系统</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../layui/css/layui.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"layui-layout layui-layout-admin\">\r\n");
      out.write("    <div class=\"layui-header\">\r\n");
      out.write("        <div class=\"layui-logo layui-hide-xs layui-bg-black\">大眼的服装系统</div>\r\n");
      out.write("        <ul class=\"layui-nav layui-layout-right\">\r\n");
      out.write("            <li class=\"layui-nav-item layui-hide layui-show-md-inline-block\">\r\n");
      out.write("                <a href=\"javascript:;\">\r\n");
      out.write("                    <img src=\"//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg\" class=\"layui-nav-img\">\r\n");
      out.write("                    ");

                        User loginUser = (User) request.getSession().getAttribute("loginUser");
                        String username;
                        if (loginUser != null) {
                            username = loginUser.getName();
                        } else {
                            username = "未登录";
                        }
                    
      out.write("\r\n");
      out.write("                    ");
      out.print(username);
      out.write("\r\n");
      out.write("                </a>\r\n");
      out.write("                <dl class=\"layui-nav-child\">\r\n");
      out.write("                    <dd><a href=\"\">Your Profile</a></dd>\r\n");
      out.write("                    <dd><a href=\"\">Settings</a></dd>\r\n");
      out.write("                    <dd><a href=\"\">Sign out</a></dd>\r\n");
      out.write("                </dl>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"layui-nav-item\" lay-header-event=\"menuRight\" lay-unselect>\r\n");
      out.write("                <a href=\"javascript:;\">\r\n");
      out.write("                    <i class=\"layui-icon layui-icon-more-vertical\"></i>\r\n");
      out.write("                </a>\r\n");
      out.write("            </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"layui-side layui-bg-black\">\r\n");
      out.write("        <div class=\"layui-side-scroll\">\r\n");
      out.write("            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->\r\n");
      out.write("            <ul class=\"layui-nav layui-nav-tree\" lay-filter=\"test\">\r\n");
      out.write("                <li class=\"layui-nav-item layui-nav-itemed\">\r\n");
      out.write("                    <a class=\"\" href=\"javascript:;\">用户管理</a>\r\n");
      out.write("                    <dl class=\"layui-nav-child\">\r\n");
      out.write("                        <dd><a href=\"userList\" target=\"body\">用户列表</a></dd>\r\n");
      out.write("                    </dl>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"layui-nav-item\">\r\n");
      out.write("                    <a href=\"javascript:;\">仓库管理</a>\r\n");
      out.write("                    <dl class=\"layui-nav-child\">\r\n");
      out.write("                        <dd><a href=\"goodsList\" target=\"body\">商品列表</a></dd>\r\n");
      out.write("                        <dd><a href=\"recordList\" target=\"body\">出入库记录</a></dd>\r\n");
      out.write("                    </dl>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"layui-body\">\r\n");
      out.write("        <!-- 内容主体区域 -->\r\n");
      out.write("        <iframe src=\"index.jsp\" name=\"body\" style=\"width: 95%;height: 620px\"></iframe>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"layui-footer\">\r\n");
      out.write("        <!-- 底部固定区域 -->\r\n");
      out.write("        底部固定区域\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script src=\"../layui/layui.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    //JS\r\n");
      out.write("    layui.use(['element', 'layer', 'util'], function(){\r\n");
      out.write("        var element = layui.element\r\n");
      out.write("            ,layer = layui.layer\r\n");
      out.write("            ,util = layui.util\r\n");
      out.write("            ,$ = layui.$;\r\n");
      out.write("\r\n");
      out.write("        //头部事件\r\n");
      out.write("        util.event('lay-header-event', {\r\n");
      out.write("            //左侧菜单事件\r\n");
      out.write("            menuLeft: function(othis){\r\n");
      out.write("                layer.msg('展开左侧菜单的操作', {icon: 0});\r\n");
      out.write("            }\r\n");
      out.write("            ,menuRight: function(){\r\n");
      out.write("                layer.open({\r\n");
      out.write("                    type: 1\r\n");
      out.write("                    ,content: '<div style=\"padding: 15px;\">处理右侧面板的操作</div>'\r\n");
      out.write("                    ,area: ['260px', '100%']\r\n");
      out.write("                    ,offset: 'rt' //右上角\r\n");
      out.write("                    ,anim: 5\r\n");
      out.write("                    ,shadeClose: true\r\n");
      out.write("                });\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

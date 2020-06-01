<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
  <meta charset="utf-8">
  <title>DB manager</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
  <link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/style/admin.css" media="all">  
  <script src="${_currConText}${_jsURL }/common/dialog.js" type="text/javascript"></script>
<%@ include file="/WEB-INF/jsp/common/commonJBox.jsp"%>
  <script>
  /^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
  </script>
</head>
<body class="layui-layout-body">  
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="fullscreen">
              <i class="layui-icon layui-icon-screen-full"></i>
            </a>
          </li>
        </ul>       
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="main/timeline.shtm">
            <span>DB Console</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="console">
                  <a lay-href="redis/init.shtm">Redis热Key</a>
                </dd>                
                <dd data-name="console" class="layui-this">
                  <a lay-href="main/timeline.shtm">控制台</a>
                </dd>
             <!--    <dd data-name="console" >
                  <a lay-href="main/more.shtm">更多扩展</a>
                </dd>  -->               
                
                
              </dl>
            </li>
            
        <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-set"></i>
                <cite>设置</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">                  
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/init.shtm">Redis</a></dd>
                    <!-- <dd><a lay-href="set/mysql.shtm">MySql</a></dd> -->
                  </dl>
                </dd>                
              </dl>
            </li>
            
            
           <!--  <li data-name="component" class="layui-nav-item">
              <a href="javascript:;" lay-tips="数据库" lay-direction="2">
                <i class="layui-icon layui-icon-component"></i>
                <cite>数据库CRUD</cite>
              </a>
              <dl class="layui-nav-child">               
                <dd data-name="button">
                  <a lay-href="demo/mysql/init.shtm">Mysql</a>
                </dd>
                <dd data-name="form">
                   <a lay-href="component/form/group.html">Sqlserver</a>
                </dd>
                <dd data-name="nav">
                  <a lay-href="component/nav/index.html">Oracle</a>
                </dd>
                <dd data-name="tabs">
                  <a lay-href="component/tabs/index.html">更多……</a>
                </dd>     
              </dl>
            </li> -->
                        
          <!--   <li data-name="template" class="layui-nav-item">
              <a href="javascript:;" lay-tips="前端框架" lay-direction="2">
                <i class="layui-icon layui-icon-template"></i>
                <cite>前端框架</cite>
              </a>
              <dl class="layui-nav-child">
                <dd><a lay-href="layui/index.shtm">LayUI</a></dd>
                <dd><a lay-href="jbox/index.shtm">Jbox</a></dd>
                <dd><a lay-href="easyui/index.shtm">easyUI</a></dd>
                <dd><a lay-href="template/caller.html">懒加载</a></dd>
                <dd><a lay-href="template/goodslist.html">响应式</a></dd>
              </dl>
            </li> -->
            
      <!--       <li data-name="app" class="layui-nav-item">
              <a href="javascript:;" lay-tips="应用" lay-direction="2">
                <i class="layui-icon layui-icon-app"></i>
                <cite>应用</cite>
              </a>
              <dl class="layui-nav-child">
                
                <dd data-name="content">
                  <a href="javascript:;">内容系统</a>
                  <dl class="layui-nav-child">
                    <dd data-name="list"><a lay-href="app/content/list.html">文章列表</a></dd>
                    <dd data-name="tags"><a lay-href="app/content/tags.html">分类管理</a></dd>
                    <dd data-name="comment"><a lay-href="app/content/comment.html">评论管理</a></dd>
                  </dl>
                </dd>
                <dd data-name="forum">
                  <a href="javascript:;">社区系统</a>
                  <dl class="layui-nav-child">
                    <dd data-name="list"><a lay-href="app/forum/list.html">帖子列表</a></dd>
                    <dd data-name="replys"><a lay-href="app/forum/replys.html">回帖列表</a></dd>
                  </dl>
                </dd>
               
                <dd data-name="forum">
                  <a href="javascript:;">电子商务</a>
                  <dl class="layui-nav-child">
                    <dd data-name="list"><a lay-href="app/forum/list.html">商品列表</a></dd>
                    <dd data-name="replys"><a lay-href="app/forum/replys.html">商品详情</a></dd>
                  </dl>
                </dd>
                
                <dd data-name="forum">
                  <a href="javascript:;">在线教育</a>
                  <dl class="layui-nav-child">
                    <dd data-name="list"><a lay-href="app/forum/list.html">课程列表</a></dd>
                    <dd data-name="replys"><a lay-href="app/forum/replys.html">课程详情</a></dd>
                    <dd data-name="replys"><a lay-href="app/forum/replys.html">名师介绍</a></dd>
                  </dl>
                </dd>
                
                <dd data-name="forum">
                  <a href="javascript:;">题库系统</a>
                  <dl class="layui-nav-child">
                    <dd data-name="list"><a lay-href="app/forum/list.html">题库列表</a></dd>
                    <dd data-name="replys"><a lay-href="app/forum/replys.html">答题试卷</a></dd>                    
                  </dl>
                </dd>
                
                
                <dd data-name="forum">
                  <a href="javascript:;">短视频</a>
                  <dl class="layui-nav-child">
                    <dd data-name="list"><a lay-href="app/forum/list.html">视频列表</a></dd>
                    <dd data-name="replys"><a lay-href="app/forum/replys.html">视频详情</a></dd>
                  </dl>
                </dd>

              </dl>
            </li>
            -->
           
<!--             <li data-name="senior" class="layui-nav-item">
              <a href="javascript:;" lay-tips="高级" lay-direction="2">
                <i class="layui-icon layui-icon-senior"></i>
                <cite>高级</cite>
              </a>
              <dl class="layui-nav-child">
                <dd>
                  <a layadmin-event="im">LayIM 通讯系统</a>  
                </dd>
                <dd data-name="echarts">
                  <a href="javascript:;">Echarts集成</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="senior/echarts/line.html">折线图</a></dd>
                    <dd><a lay-href="senior/echarts/bar.html">柱状图</a></dd>
                    <dd><a lay-href="senior/echarts/map.html">地图</a></dd>
                  </dl>
                </dd>
              </dl>
            </li>
            
            <li data-name="user" class="layui-nav-item">
              <a href="javascript:;" lay-tips="用户" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>用户</cite>
              </a>
              <dl class="layui-nav-child">
                <dd>
                  <a lay-href="user/user/list.html">网站用户</a>
                </dd>
                <dd>
                  <a lay-href="user/administrators/list.html">后台管理员</a>
                </dd>
                <dd>
                  <a lay-href="user/administrators/role.html">角色管理</a>
                </dd>
              </dl>
            </li>-->
            
            
     <!--        <li data-name="set" class="layui-nav-item"> 
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-set"></i>
                <cite>设置</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
                  <a href="javascript:;">系统设置</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/system/website.html">网站设置</a></dd>
                    <dd><a lay-href="set/system/email.html">邮件服务</a></dd>
                  </dl>
                </dd>
                <dd class="layui-nav-itemed">
                  <a href="javascript:;">我的设置</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/user/info.html">基本资料</a></dd>
                    <dd><a lay-href="set/user/password.html">修改密码</a></dd>
                  </dl>
                </dd>
              </dl>
            </li> -->
    
    
    
        
            
            
           <!--   <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="首页" lay-direction="2">
                <i class="layui-icon layui-icon-auz"></i>
                <cite>首页</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
                  <a href="javascript:;">小清新</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/system/website.html">小清新1</a></dd>
                    <dd><a lay-href="set/system/email.html">小清新2</a></dd>
                  </dl>
                </dd>
                
                <dd class="layui-nav-itemed">
                  <a href="javascript:;">高大上</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/user/info.html">高大上1</a></dd>
                    <dd><a lay-href="set/user/password.html">高大上2</a></dd>
                  </dl>
                </dd>
                
                <dd class="layui-nav-itemed">
                  <a href="javascript:;">低调奢华</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/user/info.html">低奢1</a></dd>
                    <dd><a lay-href="set/user/password.html">低奢2</a></dd>
                  </dl>
                </dd>
              </dl>
            </li>     -->        
            
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="redis/init.shtm" lay-attr="redis/init.shtm" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>                                            
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="redis/init.shtm" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="${_currConText}${_jsURL }/layuiadmin/layui/layui.js"></script>
  <script>
  layui.config({
    base: '${_currConText}/js/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index');
  </script>
  
</body>
</html>



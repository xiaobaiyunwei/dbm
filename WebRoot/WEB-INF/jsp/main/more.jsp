<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 主页示例模板一</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/style/admin.css" media="all">  
</head>
<body>

  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md8">    
        <div class="layui-card">
          <div class="layui-card-header">
            最近更新
            <a lay-href="https://www.layui.com/doc/base/changelog.html" class="layui-a-tips">全部更新</a>
          </div>
          <div class="layui-card-body">
            <div class="layui-row layui-col-space10">
              <div class="layui-col-xs12 layui-col-sm4">
                <div class="layuiadmin-card-text">
                  <div class="layui-text-top"><i class="layui-icon layui-icon-water"></i><a lay-href="https://www.layui.com/doc/modules/flow.html">Jenkins</a></div>
                  <p class="layui-text-center">自动化运维之上线发布神器</p>
                  <p class="layui-text-bottom"><a lay-href="https://www.layui.com/doc/modules/flow.html">自动化运维</a>
                  <span>近期</span></p>
                </div>
              </div>
              
              <div class="layui-col-xs12 layui-col-sm4">
                <div class="layuiadmin-card-text">
                  <div class="layui-text-top"><i class="layui-icon layui-icon-water"></i>
                  <a lay-href="https://www.layui.com/doc/modules/flow.html">Zabbix</a></div>
                  <p class="layui-text-center">自动化运维开源报警工具</p>
                  <p class="layui-text-bottom"><a lay-href="https://www.layui.com/doc/modules/flow.html">自动化运维</a>
                  <span>近期</span></p>
                </div>
              </div>
              
              <div class="layui-col-xs12 layui-col-sm4">
                <div class="layuiadmin-card-text">
                  <div class="layui-text-top"><i class="layui-icon layui-icon-upload-circle"></i>
                  <a lay-href="https://www.layui.com/doc/modules/upload.html">Slat</a></div>
                  <p class="layui-text-center">自动化运维工具</p>
                  <p class="layui-text-bottom"><a lay-href="https://www.layui.com/doc/modules/upload.html">自动化运维</a><span>近期</span></p>
                </div>
              </div>
              <div class="layui-col-xs12 layui-col-sm4">
                <div class="layuiadmin-card-text">
                  <div class="layui-text-top"><i class="layui-icon layui-icon-form"></i>
                  <a lay-href="https://www.layui.com/doc/modules/form.html#val">Ossec</a></div>
                  <p class="layui-text-center">开源基于主机入侵检测系统HIDS</p>
                  <p class="layui-text-bottom"><a lay-href="https://www.layui.com/doc/modules/form.html">安全</a><span>近期</span></p>
                </div>
              </div>
              <div class="layui-col-xs12 layui-col-sm4">
                <div class="layuiadmin-card-text">
                  <div class="layui-text-top"><i class="layui-icon layui-icon-form"></i>
                  <a lay-href="https://www.layui.com/doc/modules/form.html">SonarQube</a></div>
                  <p class="layui-text-center">代码质量审计、白盒漏洞扫描神器</p>
                  <p class="layui-text-bottom"><a lay-href="https://www.layui.com/doc/modules/form.html">安全</a><span>近期</span></p>
                </div>
              </div>
              <div class="layui-col-xs12 layui-col-sm4">
                <div class="layuiadmin-card-text">
                  <div class="layui-text-top"><i class="layui-icon layui-icon-form"></i>
                  <a lay-href="https://www.layui.com/doc/modules/form.html">Opencanary</a></div>
                  <p class="layui-text-center">开源系统蜜罐，第一时间发现入侵行为，为你的服务平稳运行保驾护航。</p>
                  <p class="layui-text-bottom"><a lay-href="https://my.oschina.net/guiguketang/blog/2050260">安全</a><span>近期</span></p>
                </div>
              </div>
              <div class="layui-col-xs12 layui-col-sm4">
                <div class="layuiadmin-card-text">
                  <div class="layui-text-top"><i class="layui-icon layui-icon-form"></i><a lay-href="https://www.layui.com/doc/modules/form.html">Hawkeye</a></div>
                  <p class="layui-text-center"> 扫描外泄到github的代码，是黑客信息收集必选手法</p>
                  <p class="layui-text-bottom"><a lay-href="https://www.layui.com/doc/modules/form.html">安全</a><span>近期</span></p>
                </div>
              </div>
            </div>
          </div>
        </div>
       
        

      </div>
      <div class="layui-col-md4">
        <div class="layui-card">
          <div class="layui-card-header">便捷导航</div>
          <div class="layui-card-body">
            <div class="layuiadmin-card-link">
              <a href="javascript:;">操作一</a>
              <a href="javascript:;">操作二</a> 
              <a href="javascript:;">操作三</a> 
              <a href="javascript:;">操作四</a> 
              <a href="javascript:;">操作五</a> 
              <a href="javascript:;">操作六</a>
              <button class="layui-btn layui-btn-primary layui-btn-xs">
                <i class="layui-icon layui-icon-add-1" style="position: relative; top: -1px;"></i>添加
              </button>
            </div>        
          </div>
        </div>
        
        <div class="layui-card">
          <div class="layui-card-header">重点组件</div>
          <div class="layui-card-body">
            <ul class="layui-row layuiadmin-card-team">
              <li class="layui-col-xs6">
                <a lay-href="https://www.layui.com/doc/modules/table.html">
                  <span class="layui-team-img"><img src="${_currConText}${_jsURL }/layuiadmin/style/res/logo.png"></span> 
                  <span>数据表格</span>
                </a>
              </li>
              <li class="layui-col-xs6">
                <a lay-href="https://www.layui.com/doc/modules/layim.html">
                  <span class="layui-team-img"><img src="${_currConText}${_jsURL }/layuiadmin/style/res/logo.png"></span> 
                  <span>即时通讯</span>
                </a>
              </li>
              <li class="layui-col-xs6">
                <a lay-href="https://www.layui.com/doc/modules/form.html">
                  <span class="layui-team-img"><img src="${_currConText}${_jsURL }/layuiadmin/style/res/logo.png"></span> 
                  <span>表单</span>
                </a>
              </li>
              <li class="layui-col-xs6">
                <a lay-href="https://www.layui.com/doc/modules/layer.html">
                  <span class="layui-team-img"><img src="${_currConText}${_jsURL }/layuiadmin/style/res/logo.png"></span> 
                  <span>弹出层</span>
                </a>
              </li>
              <li class="layui-col-xs6">
                <a lay-href="https://www.layui.com/doc/modules/upload.html">
                  <span class="layui-team-img"><img src="${_currConText}${_jsURL }/layuiadmin/style/res/logo.png"></span> 
                  <span>文件上传</span>
                </a>
              </li>
              <li class="layui-col-xs6">
                <a lay-href="https://www.layui.com/doc/modules/rate.html">
                  <span class="layui-team-img"><img src="${_currConText}${_jsURL }/layuiadmin/style/res/logo.png"></span> 
                  <span>评分</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
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
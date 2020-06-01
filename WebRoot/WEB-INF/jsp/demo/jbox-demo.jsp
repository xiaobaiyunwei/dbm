﻿<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>JBox Demo</title>
    <script type="text/javascript" src="${_currConText}${_jsURL}/jquery/jquery.min.js"></script>
    <!--jbox-->
    <link id="skin" rel="stylesheet" href="${_currConText}${_cssURL}/BoxSkins/Blue/jbox.css" />
    <script type="text/javascript" src="${_currConText}${_jsURL}/jquery/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="${_currConText}${_jsURL}/jquery/jquery.jBox-zh-CN.js"></script>
    <!--demo测试代码-->
    <script type="text/javascript" src="${_currConText}/jbox-demo-depends/demo.js"></script>
    <!--demo代码高亮-->
    <script type="text/javascript" src="${_currConText}/jbox-demo-depends/highlight/highlight.pack.js"></script>
    <script type="text/javascript" src="${_currConText}/jbox-demo-depends/highlight/languages/javascript.js"></script>
    <link rel="stylesheet" type="text/css" href="${_currConText}/jbox-demo-depends/highlight/styles/magula.css" />
    <script type="text/javascript">
        skin2 = true;
        hljs.initHighlightingOnLoad();
    </script>
    <style type="text/css">
        /*页面样式*/
        body {margin:0;padding:0;font:12px Verdana, Geneva, sans-serif;background:#66C6F6;}
        ul{ margin:0; padding:0; list-style:none;}
        a{color:#ff6600; text-decoration:none;}
        a:hover{color:#ff9900; text-decoration:underline;}
        .grid{ width:auto;width:920px !important;max-width:920px;min-width:800px; background:#FFF; margin:10px auto; border:10px solid #60B7DE;}
        .logo{ width:460px; font:bold 40px "Comic Sans MS", cursive;  margin:10px 5px 5px 25px;}
        .logo span{ font-size:13px; color:#999; margin:0 5px;}
        .demo{ padding:5px;}
        fieldset{ margin:20px; padding:16px;}
        .content{ margin:10px 0 0 0;}
        .content li { margin:5px;}
        .btn{ border:0; background:#4D77A7; color:#FFF; font-size:12px; padding:6px 10px;  margin:5px 0;}
        .copy{ height:30px; background:#E6EFF8; text-align:center; line-height:30px;}
        .t{padding:20px;}
        .update{padding:0 20px 20px 20px;}
        .t li,.update li{ margin:10px 0; line-height:20px;}
        .update{color:#069;padding-bottom:0;}
        .sel-skin{position:absolute;top:300px;right:10px;width:120px; height:80px; padding:10px; background-color:#fff;color:#fff;}
        /*jox应用测试样式*/
        div.msg-div{ padding: 10px; }
        div.msg-div p{ padding: 0px; margin:5px 0 0 0; }
        div.msg-div .field{ padding: 0px; }
        div.msg-div .field textarea{ width: 90%; height: 50px; resize:none; font-size:12px; }
        .errorBlock{ background-color: #FFC6A5; border: solid 1px #ff0000; color: #ff0000; margin: 10px 10px 0 10px; padding:7px; font-weight: bold; }
    </style>
</head>
<body>


	<div class="grid">



       <div style="padding: 0 20px">
    	<ul>
        	<li><strong>使用方法：引用Pub项目下的js文件和css文件即可</strong></li>
            <li>
              <pre>
              
              <code class="javascript">
  &lt;script type=&quot;text/javascript&quot; src=&quot;${_currConText}/js/jquery/jquery.min.js&quot;&gt;&lt;/script&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;${_currConText}/js/jquery/jquery.jBox-2.3.min.js&quot;&gt;&lt;/script&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;${_currConText}/js/jquery/jquery.jBox-zh-CN.js&quot;&gt;&lt;/script&gt;
   &lt;link id="skin" rel="stylesheet" href="${_currConText}/css/BoxSkins/Blue/jbox.css"&gt;

              </code>
              </pre>
            </li>
        </ul>
       </div>

       <fieldset>
        <input class="btn" type="button" onclick="show_jbox_set_defaults();" value="设置全局选项" />
        <input class="btn" type="button" onclick="show_jbox_set_border(5);" value="边框设置为 5" />
        <input class="btn" type="button" onclick="show_jbox_set_border(0);" value="边框设置为 0" />
     
       </fieldset>

       <fieldset><legend>$.jBox()</legend>
        <div class="content">
            <ul>
           	    <li>函数原型：</li>
             	<li style="text-indent:2em"><strong>$.jBox(content, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox(content, options);</li>
                <li>参数说明：</li>
                <li style="text-indent:2em"> - <strong>content</strong>　(string,json)</li>
                <li style="color:#999999;">　　　└ 可以是string或json。当是string时，需要加上前缀标识（html:、id:、get:、post:、iframe:），如果没有加标识，系统会自动加上html:，具体请看应用例子。当是json时，表示一个或多个状态，每个状态的默认值为 <a href="javascript:viewConfig('stateDefaults');" title="点击查看">$.jBox.stateDefaults</a>。
                </li>
                <li style="text-indent:2em"> - <strong>options</strong>　[可选] (json)</li>
                <li style="color:#999999;">　　　└ 其它参数选项，默认值为 <a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults</a>。</li>

                <li style="color:#F00">
                    <br /><strong>备注：如果想手动关闭jBox（不包括下面的tip与messager，它们另有方法），请调用　$.jBox.close(token)　方法。</strong>
                </li>
            </ul>
        </div>
        <br />

示例（一）:    
<pre>
<code class="javascript">
// 此例省略了前缀html:，前缀标识是不区分大小写的，也可以是HTML:
var info = 'jQuery jBox&lt;br /&gt;&lt;br /&gt;版本：v2.0&lt;br /&gt;日期：2011-7-24&lt;br /&gt;';
info += '官网：&lt;a target="_blank" href="http://kudystudio.com/jbox"&gt;http://kudystudio.com/jbox&lt;/a&gt;';
$.jBox.info(info);
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_1_1();" value="运　行" /></div>

示例（二）:    
<pre>
<code class="javascript">
// 显示id为id-html的div内部html，同时设置了bottomText
$.jBox('id:id-html', { bottomText: '这是底部文字' });
</code>
</pre>
<div id="id-html" style="display:none;">
    <div style='padding:10px;'>这里是id为id-html的div内部html，同时设置了bottomText</div>
</div>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_1_2();" value="运　行" /></div>

示例（三）:    
<pre>
<code class="javascript">
// ajax get 页面ajax.html的内容并显示，例如要提交id=1，则地址应该为 ajax.html?id=1，post:前缀的使用与get:的一样
$.jBox("get:${_currConText}/demo/ajax.shtm");
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_1_3();" value="运　行" /></div>

示例（四）:    
<pre>
<code class="javascript">
// 用iframe显示http://www.baidu.com的内容，并设置了标题、宽与高、按钮
$.jBox("iframe:http://www.baidu.com", {
    title: "百度一下",
    width: 800,
    height: 350,
    buttons: { '关闭': true }
});
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_1_4();" value="运　行" /></div>

示例（五）:  
<pre>
<code class="javascript">
var content = {
    state1: {
        content: '状态一',
        buttons: { '下一步': 1, '取消': 0 },
        buttonsFocus: 0,
        submit: function (v, h, f) {
            if (v == 0) {
                return true; // close the window
            }
            else {
                $.jBox.nextState(); //go forward
                // 或 $.jBox.goToState('state2')
            }
            return false;
        }
    },
    state2: {
        content: '状态二，请关闭窗口哇：）',
        buttons: { '上一步': 1, '取消': 0 },
        buttonsFocus: 0,
        submit: function (v, h, f) {
            if (v == 0) {
                return true; // close the window
            } else {
                $.jBox.prevState() //go back
                // 或 $.jBox.goToState('state1');
            }

            return false;
        }
    }
};

$.jBox(content);
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_1_5();" value="运　行" /></div>

示例（六）:    
<pre>
<code class="javascript">
var html = "&lt;div style='padding:10px;'&gt;输入姓名：&lt;input type='text' id='yourname' name='yourname' /&gt;&lt;/div&gt;";
var submit = function (v, h, f) {
    if (f.yourname == '') {
        $.jBox.tip("请输入您的姓名。", 'error', { focusId: "yourname" }); // 关闭设置 yourname 为焦点
        return false;
    }

    $.jBox.tip("你叫：" + f.yourname);
    //$.jBox.tip("你叫：" + h.find("#yourname").val());
    //$.jBox.tip("你叫：" + h.find(":input[name='yourname']").val());

    return true;
};

$.jBox(html, { title: "你叫什么名字？", submit: submit });
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_1_6();" value="运　行" /></div>
       </fieldset>

       <fieldset><legend>$.jBox.open()</legend>
        <div class="content">
            <ul>
           	    <li>函数原型：</li>
             	<li style="text-indent:2em"><strong>$.jBox.open(content, title, width, height, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.open(content, title, width, height, options);</li>
                <li>参数说明：</li>
                <li style="text-indent:2em"> - <strong>content</strong>　(string,json)</li>
                <li style="color:#999999;">　　　└ 可以是string或json。当是string时，需要加上前缀标识（html:、id:、get:、post:、iframe:），如果没有加标识，系统会自动加上html:，具体请看应用例子。当是json时，表示一个或多个状态，每个状态的默认值为 <a href="javascript:viewConfig('stateDefaults');" title="点击查看">$.jBox.stateDefaults</a>。</li>
                <li style="text-indent:2em"> - <strong>title</strong>　[可选] (string)</li>
                <li style="color:#999999;">　　　└ 窗口标题，值为null时为不显示标题，默认值为 <a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults.title</a>。</li>
                <li style="text-indent:2em"> - <strong>width</strong>　[可选] (string,number)</li>
                <li style="color:#999999;">　　　└ 窗口宽度，值为'auto'或具体像素值（例如350），默认值为 <a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults.width</a>。</li>
                <li style="text-indent:2em"> - <strong>height</strong>　[可选] (string,number)</li>
                <li style="color:#999999;">　　　└ 窗口高度，值为'auto'或具体像素值（例如100），默认值为 <a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults.height</a>。</li>
                <li style="text-indent:2em"> - <strong>options</strong>　[可选] (json)</li>
                <li style="color:#999999;">　　　└ 其它参数选项，默认值为 <a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults</a>。</li>
                <li style="color:#F00">
                    <br /><strong>备注：$.jBox.open() 只是 $.jBox() 的一个扩展，方便 title、width、height 参数的传递。</strong>
                </li>
            </ul>
        </div>
        <br />

示例（一）:    
<pre>
<code class="javascript">
$.jBox.open("iframe:http://www.baidu.com", "百度一下", 800, 350, { buttons: { '关闭': true} });
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_2_1();" value="运　行" /></div>

示例（二）: <font color="#ff0000;">（content为Json对象，比较复杂一点的例子）</font>   
<pre>
<code class="javascript">
var html1 = '&lt;div class="msg-div"&gt;' +
            '&lt;p&gt;购买数量：&lt;/p&gt;&lt;div class="field"&gt;&lt;input type="text" id="amount" name="amount" value="1" /&gt;&lt;/div&gt;' +
            '&lt;p&gt;收货地址：&lt;/p&gt;&lt;div class="field"&gt;&lt;textarea id="address" name="address"&gt;&lt;/textarea&gt;&lt;/div&gt;' +
            '&lt;div class="errorBlock" style="display: none;"&gt;&lt;/div&gt;' +
            '&lt;/div&gt;';

var html2 = '&lt;div class="msg-div"&gt;' +
            '&lt;p&gt;给卖家留言：&lt;/p&gt;&lt;div class="field"&gt;&lt;textarea id="message" name="message"&gt;&lt;/textarea&gt;&lt;/div&gt;' +
            '&lt;/div&gt;';

var data = {};
var states = {};
states.state1 = {
    content: html1,
    buttons: { '下一步': 1, '取消': 0 },
    submit: function (v, h, f) {
        if (v == 0) {
            return true; // close the window
        }
        else {
            h.find('.errorBlock').hide('fast', function () { $(this).remove(); });

            data.amount = f.amount; //或 h.find('#amount').val();
            if (data.amount == '' || parseInt(data.amount) &lt; 1) {
                $('&lt;div class="errorBlock" style="display: none;"&gt;请输入购买数量！&lt;/div&gt;').prependTo(h).show('fast');
                return false;
            }
            data.address = f.address;
            if (data.address == '') {
                $('&lt;div class="errorBlock" style="display: none;"&gt;请输入收货地址！&lt;/div&gt;').prependTo(h).show('fast');
                return false;
            }

            $.jBox.nextState(); //go forward
            // 或 $.jBox.goToState('state2')
        }

        return false;
    }
};
states.state2 = {
    content: html2,
    buttons: { '上一步': -1, '提交': 1, '取消': 0 },
    buttonsFocus: 1, // focus on the second button
    submit: function (v, o, f) {
        if (v == 0) {
            return true; // close the window
        } else if (v == -1) {
            $.jBox.prevState() //go back
            // 或 $.jBox.goToState('state1');
        }
        else {
            data.message = f.message;

            // do ajax request here
            $.jBox.nextState('&lt;div class="msg-div"&gt;正在提交...&lt;/div&gt;');
            // 或 $.jBox.goToState('state3', '&lt;div class="msg-div"&gt;正在提交...&lt;/div&gt;')

            // asume that the ajax is done, than show the result
            var msg = [];
            msg.push('&lt;div class="msg-div"&gt;');
            msg.push('&lt;p&gt;下面是提交的数据&lt;/p&gt;');
            for (var p in data) {
                msg.push('&lt;p&gt;' + p + ':' + data[p] + '&lt;/p&gt;');
            }
            msg.push('&lt;/div&gt;');
            window.setTimeout(function () { $.jBox.nextState(msg.join('')); }, 2000);
        }

        return false;
    }
};
states.state3 = {
    content: '',
    buttons: {} // no buttons
};
states.state4 = {
    content: '',
    buttons: { '确定': 0 }
};

$.jBox.open(states, '提交订单', 450, 'auto');
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_2_2();" value="运　行" /></div>
       </fieldset>

       <fieldset><legend>$.jBox.prompt()</legend>
        <div class="content">
            <ul>
           	    <li>函数原型：</li>
             	<li style="text-indent:2em"><strong>$.jBox.prompt(content, title, icon, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.prompt(content, title, icon, options);</li>
                <li>参数说明：</li>
                <li style="text-indent:2em"> - <strong>content</strong>　(string)</li>
                <li style="color:#999999;">　　　└ 只能是string，不支持前缀标识，默认值为''。</li>
                <li style="text-indent:2em"> - <strong>title</strong>　[可选] (string)</li>
                <li style="color:#999999;">　　　└ 窗口标题，值为null时为不显示标题，默认值为 <a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults.title</a>。</li>
                <li style="text-indent:2em"> - <strong>icon</strong>　[可选] (string)</li>
                <li style="color:#999999;">　　　└ <font color="red">内容图标</font>，值为'none'时为不显示图标，可选值有'none'、'info'、'question'、'success'、'warning'、'error'，默认值为'none'。</li>
                <li style="text-indent:2em"> - <strong>options</strong>　[可选] (json)</li>
                <li style="color:#999999;">　　　└ 其它参数选项，默认值为 <a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults</a>。</li>

                <li style="color:#F00">
                    <br /><strong>备注：以下几个方法由　$.jBox.prompt()　扩展而来，参数类似，请看下面的例子。</strong>
                </li>
             	<li style="text-indent:2em"><strong>$.jBox.alert(content, title, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.alert(content, title, options);</li>
             	<li style="text-indent:2em"><strong>$.jBox.info(content, title, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.info(content, title, options);</li>
             	<li style="text-indent:2em"><strong>$.jBox.success(content, title, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.success(content, title, options);</li>
             	<li style="text-indent:2em"><strong>$.jBox.error(content, title, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.error(content, title, options);</li>
             	<li style="text-indent:2em"><strong>$.jBox.confirm(content, title, submit, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.confirm(content, title, submit, options);</li>
             	<li style="text-indent:2em"><strong>$.jBox.warning(content, title, submit, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.warning(content, title, submit, options);</li>
                
                <li style="color:#F00;">　　　 └ 上面方法中默认按钮的文字设置在 <a href="javascript:javascript:viewConfig('languageDefaults');" title="点击查看">$.jBox.languageDefaults</a></li>
            </ul>
        </div>
        <br />

示例（一）:    
<pre>
<code class="javascript">
//加了个其它参数closed
$.jBox.prompt('Hello jBox', 'jBox', 'info', { closed: function () { alert('prompt is closed.'); } });
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_1();" value="运　行" /></div>

示例（二）:    
<pre>
<code class="javascript">
$.jBox.alert('Hello jBox', 'jBox');
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_2();" value="运　行" /></div>

示例（三）:    
<pre>
<code class="javascript">
$.jBox.info('Hello jBox', 'jBox');
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_3();" value="运　行" /></div>

示例（四）:    
<pre>
<code class="javascript">
$.jBox.success('Hello jBox', 'jBox');
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_4();" value="运　行" /></div>

示例（五）:  
<pre>
<code class="javascript">
$.jBox.error('Hello jBox', 'jBox');
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_5();" value="运　行" /></div>

示例（六）:  
<pre>
<code class="javascript">
var submit = function (v, h, f) {
    if (v == 'ok')
        jBox.tip(v, 'info');
    else if (v == 'cancel')
        jBox.tip(v, 'info');

    return true; //close
};

$.jBox.confirm("确定吗？", "提示", submit);
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_6();" value="运　行" /></div>

示例（六02）:  
<pre>
<code class="javascript">
var submit = function (v, h, f) {
    if (v == true)
        jBox.tip("恩", 'info');
    else
        jBox.tip("好吖", 'info');

    return true;
};
// 自定义按钮
$.jBox.confirm("天使，做我女朋友吧？", "表白提示", submit, { buttons: { '恩': true, '好吖': false} });
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_6_2();" value="运　行" /></div>

示例（七）:  
<pre>
<code class="javascript">
var submit = function (v, h, f) {
    if (v == 'yes') {
        $.jBox.tip('已保存。', 'success');
    }
    if (v == 'no') {
        $.jBox.tip('没保存。');
    }
    if (v == 'cancel') {
        $.jBox.tip('已取消。');
    }

    return true;
};
// 可根据需求仿上例子定义按钮
$.jBox.warning("内容已修改，是否保存？", "提示", submit);
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_3_7();" value="运　行" /></div>
       </fieldset>

       <fieldset><legend>$.jBox.tip()</legend>
        <div class="content">
            <ul>
           	    <li>函数原型：</li>
             	<li style="text-indent:2em"><strong>$.jBox.tip(content, icon, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.tip(content, icon, options);</li>
                <li>参数说明：</li>
                <li style="text-indent:2em"> - <strong>content</strong>　(string)</li>
                <li style="color:#999999;">　　　└ 只能是string，不支持前缀标识，默认值为''。</li>
                <li style="text-indent:2em"> - <strong>icon</strong>　[可选] (string)</li>
                <li style="color:#999999;">　　　└ <font color="red">内容图标</font>，可选值有'info'、'success'、'warning'、'error'、'loading'，默认值为'info'，当为'loading'时，timeout值会被设置为0，表示不会自动关闭。</li>
                <li style="text-indent:2em"> - <strong>options</strong>　[可选] (json)</li>
                <li style="color:#999999;">　　　└ 其它参数选项，默认值为 <a href="javascript:viewConfig('tipDefaults');" title="点击查看">$.jBox.tipDefaults</a>。</li>

                <li style="color:#F00">
                    <br /><strong>备注：如果想手动关闭tip，请调用　$.jBox.closeTip()　方法。</strong>
                </li>
            </ul>
        </div>
        <br />

示例（一）:    
<pre>
<code class="javascript">
$.jBox.tip('Hello jBox');
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_4_1();" value="运　行" /></div>

示例（二）:    
<pre>
<code class="javascript">
//加了个其它参数focusId
$.jBox.tip('关闭后设置输入框为焦点', 'info', { focusId: 'tip-input' });
</code>
</pre>
<div style="text-align:right">输入框：<input type="text" id="tip-input" /> <input class="btn" type="button" onclick="demo_4_2();" value="运　行" /></div>

示例（三）:    
<pre>
<code class="javascript">
//加了个其它参数closed
$.jBox.tip('关闭后设置输入框为已选择', 'error', { closed: function () { $('#tip-input2').select(); } });
</code>
</pre>
<div style="text-align:right">输入框：<input type="text" id="tip-input2" value="内容" /> <input class="btn" type="button" onclick="demo_4_3();" value="运　行" /></div>

示例（四）:    
<pre>
<code class="javascript">
$.jBox.tip("正在XX，你懂的...", 'loading');
// 模拟2秒后完成操作
window.setTimeout(function () { $.jBox.tip('XX已完成。', 'success'); }, 2000);
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_4_4();" value="运　行" /></div>

示例（五）:    
<pre>
<code class="javascript">
var submit = function (v, h, f) {
    if (v == 'ok') {
        $.jBox.tip("正在删除数据...", 'loading');
        // 模拟2秒后完成操作
        window.setTimeout(function () { $.jBox.tip('删除成功。', 'success'); }, 2000);
    }
    else if (v == 'cancel') {
        // 取消
    }

    return true; //close
};

$.jBox.confirm("确定要删除数据吗？", "提示", submit);
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_4_5();" value="运　行" /></div>
       </fieldset>

       <fieldset><legend>$.jBox.messager()</legend>
        <div class="content">
            <ul>
           	    <li>函数原型：</li>
             	<li style="text-indent:2em"><strong>$.jBox.messager(content, title, timeout, options);</strong></li>
                <li style="color:#999">　　　 └ 或者 jBox.messager(content, title, timeout, options);</li>
                <li>参数说明：</li>
                <li style="text-indent:2em"> - <strong>content</strong>　(string)</li>
                <li style="color:#999999;">　　　└ 只能是string，不支持前缀标识，默认值为''。</li>
                <li style="text-indent:2em"> - <strong>title</strong>　[可选] (string)</li>
                <li style="color:#999999;">　　　└ 窗口标题，值为null时为不显示标题，默认值为 <a href="javascript:viewConfig('messagerDefaults');" title="点击查看">$.jBox.messagerDefaults.title</a>。</li>
                <li style="text-indent:2em"> - <strong>timeout</strong>　[可选] (number)</li>
                <li style="color:#999999;">　　　└ 显示多少毫秒后自动关闭，如果为0则不自动关闭，默认值为 <a href="javascript:viewConfig('messagerDefaults');" title="点击查看">$.jBox.messagerDefaults.timeout</a>。</li>
                <li style="text-indent:2em"> - <strong>options</strong>　[可选] (json)</li>
                <li style="color:#999999;">　　　└ 其它参数选项，默认值为 <a href="javascript:viewConfig('messagerDefaults');" title="点击查看">$.jBox.messagerDefaults</a>。</li>

                <li style="color:#F00">
                    <br /><strong>备注：如果想手动关闭messager，请调用　$.jBox.closeMessager()　方法。</strong>
                </li>
            </ul>
        </div>
        <br />

示例（一）:    
<pre>
<code class="javascript">
$.jBox.messager('Hello jBox', 'jBox');
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_5_1();" value="运　行" /></div>

示例（二）:    
<pre>
<code class="javascript">
$.jBox.messager("Hello jBox 2", "my title", null, { width: 350, showType: 'fade' });
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_5_2();" value="运　行" /></div>

示例（三）:    
<pre>
<code class="javascript">
$.jBox.messager("Hello jBox 3", "my title", 3000, {
    width: 350,
    icon: 'info',
    showType: 'show',
    buttons: { '去看看': true },
    submit: function (v, h, f) {
        $.jBox.info('看个蛋蛋？');
        return true;
    }
});
</code>
</pre>
<div style="text-align:right"><input class="btn" type="button" onclick="demo_5_3();" value="运　行" /></div>
       </fieldset>

       <fieldset><legend>jBox 其它成员</legend>
        <div class="content">
            <ul>
           	    <li>全局设置：</li>
             	<li style="text-indent:2em"><strong><a href="javascript:viewConfig('defaults');" title="点击查看">$.jBox.defaults</a></strong></li>
             	<li style="text-indent:2em"><strong><a href="javascript:viewConfig('stateDefaults');" title="点击查看">$.jBox.stateDefaults</a></strong></li>
             	<li style="text-indent:2em"><strong><a href="javascript:viewConfig('tipDefaults');" title="点击查看">$.jBox.tipDefaults</a></strong></li>
             	<li style="text-indent:2em"><strong><a href="javascript:viewConfig('messagerDefaults');" title="点击查看">$.jBox.messagerDefaults</a></strong></li>
             	<li style="text-indent:2em"><strong><a href="javascript:viewConfig('languageDefaults');" title="点击查看">$.jBox.languageDefaults</a></strong></li>
                <li>其它函数：</li>
                <li style="text-indent:2em"> - <strong>$.jBox.setDefaults(configs);</strong></li>
                <li style="color:#999999;">　　　└ 设置全局设置，请参考 demo.js 里的使用。</li>
                <li style="text-indent:2em"> - <strong>$.jBox.getBox();</strong></li>
                <li style="color:#999999;">　　　└ 获取最前面打开的窗口jQuery对象。</li>
                <li style="text-indent:2em"> - <strong>$.jBox.getIframe(jBoxId);</strong></li>
                <li style="color:#999999;">　　　└ 获取最前面打开的或指定ID的窗口里的 iframe jQuery对象。(方便与iframe的交互)</li>
                <li style="text-indent:2em"> - <strong>$.jBox.getContent();</strong></li>
                <li style="color:#999999;">　　　└ 获取最前面打开的窗口的内容html。</li>
                <li style="text-indent:2em"> - <strong>$.jBox.setContent(content);</strong></li>
                <li style="color:#999999;">　　　└ 设置最前面打开的窗口的内容html。</li>
                <li style="text-indent:2em"> - <strong>$.jBox.getState(stateNmae);</strong></li>
                <li style="color:#999999;">　　　└ 获取最前面打开的窗口可见状态内容。（content为多状态下）</li>
                <li style="text-indent:2em"> - <strong>$.jBox.getStateName();</strong></li>
                <li style="color:#999999;">　　　└ 获取最前面打开的窗口可见状态的名称。（content为多状态下）</li>
                <li style="text-indent:2em"> - <strong>$.jBox.goToState(stateName, stateContent);</strong></li>
                <li style="color:#999999;">　　　└ 显示最前面打开的窗口的指定状态，并可设置状态内容。（content为多状态下）</li>
                <li style="text-indent:2em"> - <strong>$.jBox.nextState(stateContent);</strong></li>
                <li style="color:#999999;">　　　└ 显示最前面打开的窗口的下一个状态，并可设置状态内容。（content为多状态下）</li>
                <li style="text-indent:2em"> - <strong>$.jBox.prevState(stateContent);</strong></li>
                <li style="color:#999999;">　　　└ 显示最前面打开的窗口的上一个状态，并可设置状态内容。（content为多状态下）</li>
                <li style="text-indent:2em"> - <strong>$.jBox.close(token);</strong></li>
                <li style="color:#999999;">　　　└ 关闭最前面打开的窗口，token可以是指定jBox的ID或布尔值，如果是true显示关闭所有已打开的窗口。</li>
                <li style="text-indent:2em"> - <strong>$.jBox.closeTip();</strong></li>
                <li style="color:#999999;">　　　└ 关闭提示（由 $.jBox.tip() 打开的）。</li>
                <li style="text-indent:2em"> - <strong>$.jBox.closeMessager();</strong></li>
                <li style="color:#999999;">　　　└ 关闭提示（由 $.jBox.messager() 打开的）。</li>
            </ul>
        </div>
        <br />

示例（iframe）:    
<pre>
<code class="javascript">
// 调父窗口请用 parent 或 top，如果是多层iframe，需要调用多个parent
var html = "&lt;div style='padding:10px;'&gt;输入点什么：&lt;input type='text' id='some' name='some' /&gt;&lt;/div&gt;";
var submit = function (v, h, f) {
    if (f.some == '') {
        // f.some 或 h.find('#some').val() 等于 top.$('#some').val()
        top.$.jBox.tip("请输入点什么。", 'error', { focusId: "some" }); // 关闭设置 some 为焦点
        return false;
    }
    top.$.jBox.info("你输入了：" + f.some);

    return true;
};

top.$.jBox(html, { title: "输入", submit: submit });
</code>
</pre>
<div style="text-align:right">
<iframe src="/pub/demo/iframe.shtm" width="100%" height="50"></iframe>
</div>

       </fieldset>

<!-- 全局配置说明 -->
<div id="defaults" style="display:none;">  
<pre class="config">
<code class="javascript">
$.jBox.defaults = {
    id: null, /* 在页面中的唯一id，如果为null则自动生成随机id,一个id只会显示一个jBox */
    top: '15%', /* 窗口离顶部的距离,可以是百分比或像素(如 '100px') */
    border: 5, /* 窗口的外边框像素大小,必须是0以上的整数 */
    opacity: 0.1, /* 窗口隔离层的透明度,如果设置为0,则不显示隔离层 */
    timeout: 0, /* 窗口显示多少毫秒后自动关闭,如果设置为0,则不自动关闭 */
    showType: 'fade', /* 窗口显示的类型,可选值有:show、fade、slide */
    showSpeed: 'fast', /* 窗口显示的速度,可选值有:'slow'、'fast'、表示毫秒的整数 */
    showIcon: true, /* 是否显示窗口标题的图标，true显示，false不显示，或自定义的CSS样式类名（以为图标为背景） */
    showClose: true, /* 是否显示窗口右上角的关闭按钮 */
    draggable: true, /* 是否可以拖动窗口 */
    dragLimit: true, /* 在可以拖动窗口的情况下，是否限制在可视范围 */
    dragClone: false, /* 在可以拖动窗口的情况下，鼠标按下时窗口是否克隆窗口 */
    persistent: true, /* 在显示隔离层的情况下，点击隔离层时，是否坚持窗口不关闭 */
    showScrolling: true, /* 是否显示浏览的滚动条 */
    ajaxData: {},  /* 在窗口内容使用get:或post:前缀标识的情况下，ajax post的数据，例如：{ id: 1 } 或 "id=1" */
    iframeScrolling: 'auto', /* 在窗口内容使用iframe:前缀标识的情况下，iframe的scrolling属性值，可选值有：'auto'、'yes'、'no' */

    title: 'jBox', /* 窗口的标题 */
    width: 350, /* 窗口的宽度，值为'auto'或表示像素的整数 */
    height: 'auto', /* 窗口的高度，值为'auto'或表示像素的整数 */
    bottomText: '', /* 窗口的按钮左边的内容，当没有按钮时此设置无效 */
    buttons: { '确定': 'ok' }, /* 窗口的按钮 */
    buttonsFocus: 0, /* 表示第几个按钮为默认按钮，索引从0开始 */
    loaded: function (h) { }, /* 窗口加载完成后执行的函数，需要注意的是，如果是ajax或iframe也是要等加载完http请求才算窗口加载完成，
    参数h表示窗口内容的jQuery对象 */
    submit: function (v, h, f) { return true; },
    /* 点击窗口按钮后的回调函数，返回true时表示关闭窗口，
    参数有三个，v表示所点的按钮的返回值，h表示窗口内容的jQuery对象，f表示窗口内容里的form表单键值 */
    closed: function () { } /* 窗口关闭后执行的函数 */
};
</code>
</pre>
</div>

<div id="stateDefaults" style="display:none;">  
<pre class="config">
<code class="javascript">
$.jBox.stateDefaults = {
    content: '', /* 状态的内容，不支持前缀标识 */
    buttons: { '确定': 'ok' }, /* 状态的按钮 */
    buttonsFocus: 0, /* 表示第几个按钮为默认按钮，索引从0开始 */
    submit: function (v, h, f) { return true; } 
    /* 点击状态按钮后的回调函数，返回true时表示关闭窗口，
    参数有三个，v表示所点的按钮的返回值，h表示窗口内容的jQuery对象，f表示窗口内容里的form表单键值 */
};
</code>
</pre>
</div>

<div id="tipDefaults" style="display:none;">  
<pre class="config">
<code class="javascript">
$.jBox.tipDefaults = {
    content: '', /* 提示的内容，不支持前缀标识 */
    icon: 'info', /* 提示的图标，可选值有'info'、'success'、'warning'、'error'、'loading'，
    默认值为'info'，当为'loading'时，timeout值会被设置为0，表示不会自动关闭。 */
    top: '40%', /* 提示离顶部的距离,可以是百分比或像素(如 '100px') */
    width: 'auto', /* 提示的高度，值为'auto'或表示像素的整数 */
    height: 'auto', /* 提示的高度，值为'auto'或表示像素的整数 */
    timeout: 2000, /* 提示显示多少毫秒后自动关闭,必须是大于0的整数 */
    closed: function () { } /* 提示关闭后执行的函数 */
};
</code>
</pre>
</div>

<div id="messagerDefaults" style="display:none;">  
<pre class="config">
<code class="javascript">
$.jBox.messagerDefaults = {
    content: '', /* 信息的内容，不支持前缀标识 */
    title: 'jBox', /* 信息的标题 */
    icon: 'none', /* 信息图标，值为'none'时为不显示图标，可选值有'none'、'info'、'question'、'success'、'warning'、'error' */
    width: 350, /* 信息的高度，值为'auto'或表示像素的整数 */
    height: 'auto', /* 信息的高度，值为'auto'或表示像素的整数 */
    timeout: 3000, /* 信息显示多少毫秒后自动关闭,如果设置为0,则不自动关闭 */
    showType: 'slide', /* 信息显示的类型,可选值有:show、fade、slide */
    showSpeed: 600, /* 信息显示的速度,可选值有:'slow'、'fast'、表示毫秒的整数 */
    border: 0, /* 信息的外边框像素大小,必须是0以上的整数 */
    buttons: {}, /* 信息的按钮 */
    buttonsFocus: 0, /* 表示第几个按钮为默认按钮，索引从0开始 */
    loaded: function (h) { }, /* 窗口加载完成后执行的函数，参数h表示窗口内容的jQuery对象 */
    submit: function (v, h, f) { return true; },
    /* 点击信息按钮后的回调函数，返回true时表示关闭窗口，
    参数有三个，v表示所点的按钮的返回值，h表示窗口内容的jQuery对象，f表示窗口内容里的form表单键值 */
    closed: function () { } /* 信息关闭后执行的函数 */
};
</code>
</pre>
</div>

<div id="languageDefaults" style="display:none;">
<pre class="config">
<code class="javascript">
$.jBox.languageDefaults = {
    close: '关闭', /* 窗口右上角关闭按钮提示 */
    ok: '确定', /* $.jBox.prompt() 系列方法的“确定”按钮文字 */
    yes: '是', /* $.jBox.warning() 方法的“是”按钮文字 */
    no: '否', /* $.jBox.warning() 方法的“否”按钮文字 */
    cancel: '取消' /* $.jBox.confirm() 和 $.jBox.warning() 方法的“取消”按钮文字 */
};
</code>
</pre>
</div>

</body>
</html>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台登录-X-admin2.0</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="/login/image/x-icon" />
    <link rel="stylesheet" href="/login/css/font.css">
	<link rel="stylesheet" href="/login/css/xadmin.css">
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js"></script>
    <script type="text/javascript" src="/login/js/xadmin.js"></script>

</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">x-admin2.0-管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="pass" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        layui.use(['laydate', 'element', 'laypage', 'layer', 'form', 'table'], function () {
            var laydate = layui.laydate;//日期插件
            var lement = layui.element;//面包导航
            var laypage = layui.laypage;//分页
            var layer = layui.layer;//弹出层
            var form = layui.form;
            var table = layui.table;

            $('.x-login-right li').click(function (event) {
                color = $(this).attr('color');
                $('body').css('background-color', color);
            });

            //监听提交
            form.on('submit(login)', function (data) {
                location.href = "/adminList/login?username=" + data.field.username + "&pass=" + data.field.pass;
                return false;
            });

        })


    </script>

    

</body>
</html>
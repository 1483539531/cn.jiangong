<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            X-admin v1.0
        </title>
        <link rel="stylesheet" href="/css/x-admin.css" media="all">

        <script src="/js/jquery-1.12.4.js"></script>
        <link rel="stylesheet" href="/layui/css/layui.css">
        <script src="/layui/layui.js"></script>

    </head>
    
    <body style="background-color: #393D49">
        <div class="x-box">
            <div class="x-top">
                <i class="layui-icon x-login-close">
                    &#x1007;
                </i>
                <ul class="x-login-right">
                    <li style="background-color: #F1C85F;" color="#F1C85F">
                    </li>
                    <li style="background-color: #EA569A;" color="#EA569A">
                    </li>
                    <li style="background-color: #393D49;" color="#393D49">
                    </li>
                </ul>
            </div>
            <div class="x-mid">
                <div class="x-avtar">
                    <img src="/images/logo.png" alt="">
                </div>
                <div class="input">


                    <form class="layui-form">

                        <div class="layui-form-item x-login-box">
                            <label for="username" class="layui-form-label">
                                <i class="layui-icon">&#xe612;</i>
                            </label>
                            <div class="layui-input-inline">
                                <input type="text" id="username" name="username" required
                                autocomplete="off"  class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item x-login-box">
                            <label for="pass" class="layui-form-label">
                                <i class="layui-icon">&#xe628;</i>
                            </label>
                            <div class="layui-input-inline">
                                <input type="password" id="pass" name="pass" required
                                autocomplete="off"  class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item" id="loginbtn">
                            <button  class="layui-btn" lay-filter="save" lay-submit="">
                                登 录
                            </button>
                        </div>

                    </form>



                </div>
            </div>
        </div>
        <p style="color:#fff;text-align: center;">Copyright © 2017.Company name All rights X-admin </p>
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
                form.on('submit(save)', function (data) {
                            location.href = "/adminList/login?username=" + data.field.username + "&pass=" + data.field.pass;
                            return false;
                        });

            })

        </script>
    </body>

</html>
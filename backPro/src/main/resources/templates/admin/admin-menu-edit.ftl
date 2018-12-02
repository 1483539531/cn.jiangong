<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>
        X-admin v1.0
    </title>




    <script src="js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <style>
        .x-body{
            padding: 20px;
        }
    </style>

</head>

<body>
<div class="x-body">
    <form class="layui-form">




        <div class="layui-form-item">

            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>菜单名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username" lay-verify="required"
                       value="<#if RequestParameters['name']??>${RequestParameters['name']}</#if>" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为您唯一的登入名
            </div>

        </div>



        <div class="layui-form-item">

            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>手机
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" value="18925139194" name="phone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为您唯一的登入名
            </div>

        </div>







        <div class="layui-form-item">

            <label for="role" class="layui-form-label">
                <span class="x-red">*</span>角色
            </label>

            <div class="layui-input-inline">
                <select name="role">
                    <option value="">请选择角色</option>
                    <option value="超级管理员" selected="">超级管理员</option>
                    <option value="编辑人员">编辑人员</option>
                    <option value="问题维护">问题维护</option>
                </select>
            </div>

        </div>






        <div class="layui-form-item">

            <label for="L_repass" class="layui-form-label">
                <span class="x-red">*</span>确认密码
            </label>

            <div class="layui-input-inline">
                <input type="password" id="L_repass" name="repass" lay-verify="repass" value="123456"
                       autocomplete="off" class="layui-input">
            </div>

            <div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>

        </div>



        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>

            <button  class="layui-btn" lay-filter="save" lay-submit="">
                保存
            </button>

        </div>



    </form>
</div>






<script>
    layui.use(['form','layer'], function(){
        var form = layui.form;
        var layer = layui.layer;


        //监听提交
        form.on('submit(save)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("保存成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });


    });
</script>
</body>

</html>
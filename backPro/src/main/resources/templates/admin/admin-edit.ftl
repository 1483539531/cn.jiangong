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
                        <span class="x-red">*</span>登录名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="name" required lay-verify="required" value="admin"
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
                      <select name="role" id="role">
                        <option value="">请选择角色</option>
                        <option value="超级管理员" selected="">超级管理员</option>
                        <option value="编辑人员">编辑人员</option>
                        <option value="问题维护">问题维护</option>
                      </select>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label for="L_pass" class="layui-form-label">
                        <span class="x-red">*</span>密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" id="pass" required lay-verify="pass"
                        autocomplete="off" class="layui-input" >
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        6到16个字符
                    </div>
                </div>



                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                        <span class="x-red">*</span>确认密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" name="repass" id="repass" required lay-verify="repass"
                        autocomplete="off" class="layui-input">
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

        <input type="hidden" id="adminId" value="<#if RequestParameters['id']??>${RequestParameters['id']}</#if>">

        <script>
            layui.use(['laydate', 'element', 'laypage', 'layer', 'form', 'table'], function () {
                var laydate = layui.laydate;//日期插件
                var lement = layui.element;//面包导航
                var laypage = layui.laypage;//分页
                var layer = layui.layer;//弹出层
                var form = layui.form;
                var table = layui.table;


                selectAdminUser();
                function selectAdminUser(){
                    var id = $("#adminId").val()
                    $.ajax({
                        "url" : "adminList/selectAdminUser"
                        ,"data" : {"id" : id}
                        ,"dataType" : "json"
                        ,"success" : function (data) {
                            var adminUser = data.backUser;
                            var roleList = data.roles;
                            $("[name='name']").val(adminUser.zhanghao);
                            $("[name='password']").val(adminUser.password);
                            $("[name='repass']").val(adminUser.password);
                            $("[name='role']").empty();
                            $("[name='role']").append("<option value=0>请选择角色</option>")
                            for (var i = 0; i <roleList.length ; i++) {
                                $("[name='role']").append("<option value="+roleList[i].id+">"+roleList[i].name+"</option>")
                            }
                            form.render();
                        }
                    })
                }

                function updateAdminUser(name,pass,roleId){
                    var id = $("#adminId").val()
                    $.ajax({
                        "url" : "adminList/updateBackUser"
                        ,"data" : {"zhanghao" : name,"password":pass,"roleId":roleId,"userId":id}
                        ,"dataType" : "json"
                    })
                }




              //自定义验证规则
              form.verify({
                nikename: function(value){
                  if(value.length < 5){
                    return '昵称至少得5个字符啊';
                  }
                }
                ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                ,repass: function(value){
                    if($("#pass").val()!=$("#repass").val()){
                        return '两次密码不一致';
                    }
                }
              });

              //监听提交
              form.on('submit(save)', function(data){
                var dataValue = data.field;
                var name = dataValue.name;
                var pass = dataValue.password;
                var role = dataValue.role;
                updateAdminUser(name,pass,role);
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
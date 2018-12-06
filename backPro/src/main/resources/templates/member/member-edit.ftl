<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            X-admin v1.0
        </title>
        <script src="/js/jquery-1.12.4.js"></script>
        <link rel="stylesheet" href="/layui/css/layui.css">
        <script src="/layui/layui.js"></script>
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


                    <label for="L_email" class="layui-form-label">
                        姓名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="name" name="name" required
                        autocomplete="off"  class="layui-input">
                    </div>

                </div>


                <div class="layui-form-item">


                    <label for="L_email" class="layui-form-label">
                        电话
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="phone" name="phone" required lay-verify="phone"
                               autocomplete="off"  class="layui-input">
                    </div>

                </div>

                <div class="layui-form-item">

                    <label for="L_username" class="layui-form-label">
                        邮箱
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="email" name="email" required lay-verify="email"
                        autocomplete="off"  class="layui-input">
                    </div>


                </div>


                <div class="layui-form-item">


                    <label for="L_email" class="layui-form-label">
                        公司名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="companyName" name="companyName" lay-verify="required"
                               autocomplete="off"  class="layui-input">
                    </div>

                </div>

                <div class="layui-form-item">


                    <label for="L_email" class="layui-form-label">
                        公司职位
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="companyPosition" name="companyPosition"  lay-verify="required"
                               autocomplete="off"  class="layui-input">
                    </div>

                </div>




                <div class="layui-form-item">


                    <label for="L_city" class="layui-form-label">
                       打
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_city" name="city" autocomplete="off" value="广州"
                        class="layui-input">
                    </div>


                </div>



                <div class="layui-form-item layui-form-text">



                    <label for="L_sign" class="layui-form-label">
                        签名
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="sign" autocomplete="off"
                        class="layui-textarea" style="height: 80px;"></textarea>
                    </div>


                </div>




                <div class="layui-form-item">

                    <label for="L_sign" class="layui-form-label">
                    </label>
                    <button class="layui-btn" key="set-mine" lay-filter="save" lay-submit>
                        保存
                    </button>

                </div>


            </form>
        </div>
        <input type="text" id="userId" name="userId" value="<#if RequestParameters['id']??>${RequestParameters['id']}</#if>">


        <script>
            layui.use(['laydate','element', 'laypage', 'layer', 'form', 'table'],function () {
                var laydate = layui.laydate;
                var lement = layui.element;//面包导航
                var laypage = layui.laypage;//分页
                var layer = layui.layer;//弹出层
                var form = layui.form;
                var table = layui.table;
                selectUser()
                function selectUser(){
                    $.ajax({
                        "url":"/member/selectUser?id="+$("#userId").val()
                        ,"dataType" : "json"
                        ,"success" : function (data) {
                           console.log(data)
                        }
                    })
                }






              form.on('submit(save)', function(data){
                console.log(data);
                //发异步，把数据提交给php
                layer.alert("增加成功", {icon: 6},function () {
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
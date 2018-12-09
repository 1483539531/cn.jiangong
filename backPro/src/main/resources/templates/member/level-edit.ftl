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
                    <label for="level-id" class="layui-form-label">
                        名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="name" name="name"  class="layui-input" lay-verify="required">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label for="level-name" class="layui-form-label">
                        <span class="x-red">*</span>价钱
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="money" name="money" required="" lay-verify="number"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label for="level-kiss" class="layui-form-label">
                        <span class="x-red">*</span>信息条数
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="tiao" name="tiao" required=""  lay-verify="number"
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

        <input type="hidden" id="levelId" name="levelId" value="<#if RequestParameters['id']??>${RequestParameters['id']}</#if>">






        <script>
            layui.use(['laydate','element', 'laypage', 'layer', 'form', 'table'],function () {
                var laydate = layui.laydate;
                var lement = layui.element;//面包导航
                var laypage = layui.laypage;//分页
                var layer = layui.layer;//弹出层
                var form = layui.form;
                var table = layui.table;




                function updateLevel(cname,cmoney,ctiao,cid){
                    $.ajax({
                        "url":"/memberLevel/updateLevel",
                        "data":{cname:cname,cmoney:cmoney,ctiao:ctiao,cid:cid},
                        "dataType":"json",
                        "Type":"POST",
                    })
                }

                selectLevel();

                function selectLevel(){
                    var cid = $("#levelId").val();
                    $.ajax({
                        "url":"/memberLevel/selectList",
                        "data":{cid:cid},
                        "dataType":"json",
                        "Type":"POST",
                        "success":function (data) {
                            console.log(JSON.stringify(data))
                           $("#name").val(data.data[0].cname);
                         $("#money").val(data.data[0].cmoney);
                             $("#tiao").val(data.data[0].ctiao);
                        }
                    })
                }


                form.verify({
                    number: [/[0-9]/, '必须是数字']
                });



              //监听提交
              form.on('submit(save)', function(data){
                var cname = $("#name").val();
                var cmoney = $("#money").val();
                var ctiao = $("#tiao").val();
                var cid = $("#levelId").val();

                updateLevel(cname,cmoney,ctiao,cid);

                layer.alert("修改成功", {icon: 6},function () {
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                });
                return false;
              });






              
            });
        </script>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
    </body>

</html>
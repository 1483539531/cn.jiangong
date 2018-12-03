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
    <form action="" method="post" class="layui-form layui-form-pane">


        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red">*</span>角色名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required lay-verify="required"
                       value=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>



    <#--拥有权限-->
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">
                拥有权限
            </label>
            <table   class="layui-table layui-input-block">
                <tbody id="MenuList">
                <#-- <tr>
                                <td>
                                    文章管理
                                </td>
                                <td>
                                    <div class="layui-input-block">
                                        <input name="id[]" type="checkbox" value="2" title="文章添加">
                                        <input name="id[]" checked="" type="checkbox" value="2" title="文章删除">
                                        <input name="id[]" type="checkbox" value="2" title="文章修改">
                                        <input name="id[]" checked="" type="checkbox" value="2" title="文章改密">
                                        <input name="id[]" type="checkbox" value="2" title="文章列表">
                                    </div>
                                </td>
                            </tr>-->
                </tbody>
            </table>
        </div>


        <div class="layui-form-item layui-form-text">
            <label for="desc" class="layui-form-label">
                描述
            </label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="save">保存</button>
        </div>


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

        selectEveryMenuList();
        function selectEveryMenuList(){
            $.ajax({
                "url" : "/adminMenu/selectEveryMenuList"
                ,"data" : {"roleId":"0"}
                ,"dataType" : "json"
                ,"success" : function (data) {
                    var str = "";
                    for (var i = 0; i <data.length ; i++) {
                        str += "<tr><td>"+data[i].name+"</td><td><div class=layui-input-block>"
                        var child = data[i].children;
                        for (var j = 0; j <child.length ; j++) {
                            if(child[j].check){
                                str += "<input checked name=menu type=checkbox value="+child[j].id+" title="+child[j].name+">"
                            }else {
                                str += "<input name=menu type=checkbox value="+child[j].id+" title="+child[j].name+">"
                            }

                        }
                        str += "</div></td></tr>";
                        $("#MenuList").append(str)
                        str = "";
                    }
                    form.render();
                }

            })
        }

        function insertRole(name,comment,data){
            $.ajax({
                "url" : "/adminRole/insertRole"
                ,"data" : {"name":name,"comment":comment,"data":data}
                ,"type":"POST"
                ,"dataType" : "json"
            })
        }



        //监听提交
        form.on('submit(save)', function(data){
            var str = new Array(50);
            var name = data.field.name;
            var comment = data.field.desc;
            var i = -1;
            $('[name=menu]').each(function(){
                if($(this).is(':checked')){
                    i = i+1
                    str[i] = $(this).val();
                }
            })
            var ss = str.join("a")
            insertRole(name,comment,ss)
            layer.alert("增加", {icon: 6},function () {
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
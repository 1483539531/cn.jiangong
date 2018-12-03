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


<div class="x-nav">
    <span class="layui-breadcrumb">
        <a><cite>首页</cite></a>
        <a><cite>会员管理</cite></a>
        <a><cite>权限规则</cite></a>
    </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>


<div class="x-body">

    <form class="layui-form x-center" action="" style="width:1000px;margin: 0px auto;position: relative;left: 100px;">
        <div class="layui-form-pane" style="margin-top: 15px;">
            <div class="layui-form-item">

                <label class="layui-form-label" style="width:100px">所属分类</label>
                <div class="layui-input-inline">
                    <select name="cname" id="cname" lay-filter="cname">


                    </select>
                </div>



                <div class="layui-input-inline">
                    <input type="text" name="name"  placeholder="权限名称" lay-verify="required" lay-verType="tips" class="layui-input">
                </div>

                <div class="layui-input-inline" style="width:80px">
                    <button class="layui-btn"  lay-submit="" lay-filter="*">添加</button>
                </div>

            </div>
        </div>
    </form>


    <xblock><button class="layui-btn layui-btn-danger" onclick="delAll()">批量删除</button></xblock>

    <table id="firstTable" lay-filter="firstTable"></table>

</div>

<script>
    layui.use(['laydate', 'element', 'laypage', 'layer', 'form', 'table'], function () {
        var laydate = layui.laydate;//日期插件
        var lement = layui.element;//面包导航
        var laypage = layui.laypage;//分页
        var layer = layui.layer;//弹出层
        var form = layui.form;
        var table = layui.table;

        firstCategoryInit();
        function firstCategoryInit(){
            $.ajax({
                "url" : "/adminMenu/selectOptionMenuList"
                ,"dataType" : "json"
                ,"data": {"parentId":"0"}
                ,"success" : function (data) {
                    for (var i = 0; i <data.length ; i++) {
                        $("#cname").append("<option value="+data[i].id+">"+data[i].name+"</option>")
                    }
                    form.render();
                }
            })
        }

        function insertMenu(name,parentId){
            $.ajax({
                "url" : "/adminMenu/insertMenu"
                ,"data" : {"name":name,"parentId":parentId}
                ,"dataType" : "json"
            })
        }


        function updateMenuUrl(id,url){
            $.ajax({
                "url" : "/adminMenu/updateMenuUrl"
                ,"data" : {"id":id,"url":url}
                ,"dataType" : "json"
            })
        }

        function deleteMenu(id){
            $.ajax({
                "url" : "/adminMenu/deleteMenu"
                ,"data" : {"id":id}
                ,"dataType" : "json"
            })
        }




        form.on('select(cname)', function(data){
            table.reload('table', {
                url: '/adminMenu/selectListMenuList'
                ,where: {parentId:data.value }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            })
        });

        table.render({
            elem: '#firstTable'
            ,id: 'table'
            ,url: '/adminMenu/selectListMenuList?parentId='+1   //数据接口
            ,page: true        //开启分页
            ,cols: [[          //表头
                {field: 'id', title: 'ID'}
                ,{field: 'name', title: '值'}
                ,{field: 'url', title: '菜单路径',edit:true }
                ,{field: 'level', title: '菜单等级'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,limit : 2
            ,limits: [2,5,10]
        });







        //监听提交
        form.on('submit(*)', function(data){
            var name = data.field.name;
            var parentId = data.field.cname;
            insertMenu(name,parentId);
            table.reload('table', {
                url: '/adminMenu/selectListMenuList'
                ,where: {parentId:parentId }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            })
            return false;
        });

        table.on('tool(firstTable)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){

                layer.confirm('真的删除行么', {
                    skin: 'layui-layer-molv' //样式类名
                    ,closeBtn: 0
                }, function(index){
                    deleteMenu(data.id)
                    obj.del();
                    layer.close(index);
                });

            }else if(obj.event === 'edit'){

                var id = data.id;
                var level = data.level;
                var name = data.name;
                var parentId = data.parentId;

                layer.open({
                    type: 2,
                    area: ['700px', '500px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: '/adminMenuEditPage?id='+id+"&level="+level+"&name="+name+"&parentId="+parentId
                });
            }

        })


        table.on('edit(firstTable)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
           var data = obj.data;
            updateMenuUrl(data.id, data.url)
        });





    })
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>
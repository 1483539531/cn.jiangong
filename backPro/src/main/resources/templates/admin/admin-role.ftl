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
        <a><cite>角色管理</cite></a>
    </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>


<div class="x-body">
            
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button>
        <button class="layui-btn" onclick="role_add()"><i class="layui-icon">&#xe608;</i>添加</button>
    </xblock>

    <table id="firstTable" lay-filter="firstTable"></table>
           <#-- <td class="td-manage">
                <a title="编辑" href="javascript:;" onclick="role_edit('编辑','adminRoleEditPage','4','','510')"
                   class="ml-5" style="text-decoration:none">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" href="javascript:;" onclick="role_del(this,'1')"
                   style="text-decoration:none">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>-->


</div>


<script>
    layui.use(['laydate', 'element', 'laypage', 'layer', 'form', 'table'], function () {
        var laydate = layui.laydate;//日期插件
        var lement = layui.element;//面包导航
        var laypage = layui.laypage;//分页
        var layer = layui.layer;//弹出层
        var form = layui.form;
        var table = layui.table;


        table.render({
            elem: '#firstTable'
            ,id: 'table'
            ,url: '/adminRole/selectRoleList'   //数据接口
            ,page: true        //开启分页
            ,cols: [[          //表头
                {field: 'id', title: 'ID'}
                ,{field: 'name', title: '角色名'}
                ,{field: 'comment', title: '描述'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,limit : 2
            ,limits: [2,5,10]
        });


        table.on('tool(firstTable)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', {
                    skin: 'layui-layer-molv' //样式类名
                    ,closeBtn: 0
                }, function(index){
                    deleteRole(data.id)
                    obj.del();
                    layer.close(index);
                });

            }else if(obj.event === 'edit'){
                var roleId = data.id;
                var name = data.name;
                var comment = data.comment;
                layer.open({
                    type: 2,
                    area: ['700px', '500px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: '/adminRoleEditPage?roleId='+roleId+"&name="+name+"&comment="+comment,
                    end:function(){
                        table.reload('table', {
                            url: 'adminRole/selectRoleList'
                            ,page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    }
                });

            }

        })



    });


    /*添加*/
    function role_add(){
        layer.open({
            type: 2,
            area: ['700px', '500px'],
            fixed: false, //不固定
            maxmin: true,
            content: '/roleAddPage',
        });
    }
    
    function deleteRole(id) {
        $.ajax({
            "url": "/adminRole/deleteRole"
            , "data": {"id": id}
            , "dataType": "json"
        })
    }

             

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>
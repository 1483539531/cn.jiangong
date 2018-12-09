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
              <a><cite>等级管理</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <xblock>
                <button class="layui-btn" onclick="level_add('添加等级','level-add.html','','400')">
                    <i class="layui-icon">&#xe608;</i>添加</button></xblock>
               <#--
                        <td class="td-manage">
                            <a title="编辑" href="javascript:;" onclick="level_edit('编辑','level-edit.html','4','','300')"
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="level_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>-->
        </div>


        <table id="firstTable" lay-filter="firstTable"></table>



        <script>
            layui.use(['laydate','element', 'laypage', 'layer', 'form', 'table'],function () {
                var laydate = layui.laydate;
                var lement = layui.element;//面包导航
                var laypage = layui.laypage;//分页
                var layer = layui.layer;//弹出层
                var form = layui.form;
                var table = layui.table;


                table.render({
                    elem: '#firstTable'
                    , id: 'table'
                    , url: '/memberLevel/selectList'  //数据接口
                    , cols: [[          //表头-
                        {field: 'cid', title: 'id'}
                        , {field: 'cname', title: '名称'}
                        , {field: 'cmoney', title: '价钱'}
                        , {field: 'ctiao', title: '条数'}
                        , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
                    ]]
                })



                table.on('rowDouble(firstTable)', function(obj){
                   var id = obj.data.cid;
                    layer.open({
                        type: 2,
                        area: ['800px', '550px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: '/memberLevelEditPage?id='+id,
                        end:function () {
                            table.reload('table', {
                                url: '/memberLevel/selectList'
                                ,page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        }

                    });
                });






                table.on('tool(firstTable)',function (obj) {
                    var data = obj.data;

                    if(obj.event === 'del'){
                        layer.confirm('真的删除行么', {
                            skin: 'layui-layer-molv' //样式类名
                            ,closeBtn: 0
                        }, function(index){
                            deleteUser(data.id)
                            obj.del();
                            layer.close(index);
                        });
                    }
                })




            })







              
            //批量删除提交
             function delAll () {
                layer.confirm('确认要删除吗？',function(index){
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                });
             }
            // 等级-增加
            function level_add (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            // 等级-编辑
            function level_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
           
            /*等级-删除*/
            function level_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                });
            }
            </script>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-danger  layui-btn-xs" lay-event="del">删除</a>
        </script>
    </body>
</html>
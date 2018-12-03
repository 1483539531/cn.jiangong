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
        <a><cite>轮播列表</cite></a>
    </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>


<div class="x-body">


    <form class="layui-form x-center" action="" style="width:1000px;margin: 0px auto;position: relative;left: 60px;">
        <div class="layui-form-pane" style="margin-top: 15px;">
            <div class="layui-form-item">

                <label class="layui-form-label">日期范围</label>
                <div class="layui-input-inline">
                    <input type="text" class="date layui-input" placeholder="开始日" name="startdate">
                </div>
                <div class="layui-input-inline">
                    <input type="text" class="date layui-input" placeholder="截止日" name="enddate">
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="username" placeholder="请输入登录名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width:80px">
                    <button class="layui-btn" lay-submit lay-filter="sreach"><i class="layui-icon">提交</i>
                    </button>
                </div>
            </div>
        </div>
    </form>


    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button>
        <button class="layui-btn" onclick="admin_add()">添加</button>
    </xblock>
    <#--   <a title="编辑" href="javascript:;" onclick="admin_edit('编辑','admin-edit.ftl','4','','510')"></a>
-->

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


        function updateState(state,id){
            $.ajax({
                "url" : "/adminList/updateBackUserState"
                ,"data" :{"state": state,"id":id}
                ,"type" : "GET"
                ,"dateType" : "json"

            })
        }






        table.render({
            elem: '#firstTable'
            ,id: 'table'
            ,url: '/adminList/selectBackUserList'   //数据接口
            ,page: true        //开启分页
            ,cols: [[          //表头
                {field: 'id', title: 'ID',width: 250}
                ,{field: 'zhanghao', title: '账号',width: 250}
                ,{field: 'logindate', title: '最近登陆时间',width: 250}
                ,{field: 'state', title: '状态',templet: '#state',width: 250}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width: 250}
            ]]
            ,limit : 2
            ,limits: [2,5,10]
        });

        lay('.date').each(function(){
            laydate.render({
                elem: this
                ,trigger: 'click'
            });
        });

        form.on('submit(sreach)',function (data) {
            var dataValue = data.field;
            table.reload('table', {
                url: '/adminList/selectBackUserList'
                ,where: {startdate:dataValue.startdate,enddate:dataValue.enddate,name:dataValue.username}
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        })



        form.on('switch(switchTest)', function(data){
            layer.msg('修改成功');
            updateState(data.elem.checked,data.value)
        });


        table.on('tool(firstTable)',function (obj) {
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
                layer.open({
                    type: 2,
                    area: ['700px', '500px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: '/adminEditPage?id='+data.id
                });
            }

        })





    });
</script>


<script type="text/html" id="state">
    {{#  if(d.state == 0 ){ }}
    <input type="checkbox"  lay-skin="switch" lay-filter="switchTest" lay-text="可用|已锁定" value={{ d.id }}>
    {{#  } else { }}
    <input type="checkbox" checked lay-skin="switch" lay-filter="switchTest" lay-text="可用|已锁定" value={{ d.id }}>
    {{#  } }}
</script>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>





<script>


    /*添加*/
    function admin_add() {
        layer.open({
            type: 2,
            area: ['700px', '500px'],
            fixed: false, //不固定
            maxmin: true,
            content: '/adminAddPage'
        });
    }


</script>

</body>
</html>
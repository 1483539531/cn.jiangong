<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>
        X-admin v1.0
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/x-layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <style>
        .x-body{
            padding: 20px;
        }
    </style>
</head>
<body>

<!--    首页> 会员管理> 轮播列表    后面有个刷新页面图标    -->
<div class="x-nav">
                <span class="layui-breadcrumb">
                  <a><cite>首页</cite></a>
                  <a><cite>会员管理</cite></a>
                  <a><cite>轮播列表</cite></a>
                </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon"
                                                                        style="line-height:30px">ဂ</i></a>
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
        <button class="layui-btn" onclick="admin_add('添加用户','admin-add.html','600','500')"><i class="layui-icon">&#xe608;</i>添加
        </button>
    <%-- <table class="layui-table">



                 <td class="td-status">
                     <span class="layui-btn layui-btn-normal layui-btn-mini">
                         已启用
                     </span>
                 </td>
                 <td class="td-manage">
                     <a style="text-decoration:none" onclick="admin_stop(this,'10001')" href="javascript:;" title="停用">
                         <i class="layui-icon">&#xe601;</i>
                     </a>
                     <a title="编辑" href="javascript:;" onclick="admin_edit('编辑','admin-edit.html','4','','510')"
                     class="ml-5" style="text-decoration:none">
                         <i class="layui-icon">&#xe642;</i>
                     </a>
                     <a title="删除" href="javascript:;" onclick="admin_del(this,'1')"
                     style="text-decoration:none">
                         <i class="layui-icon">&#xe640;</i>
                     </a>
                 </td>
             </tr>
         </tbody>
     </table>--%>


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
                "url" : "updateBackUserState"
                ,"data" :{"state": state,"id":id}
                ,"type" : "GET"
                ,"dateType" : "json"

            })
        }









        table.render({
            elem: '#firstTable'
            ,id: 'table'
            ,url: 'BackUserList'   //数据接口
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
                url: 'BackUserList'
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
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>





<script>
    //批量删除提交
    function delAll() {
        layer.confirm('确认要删除吗？', function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
        });
    }

    /*添加*/
    function admin_add(title, url, w, h) {
        x_admin_show(title, url, w, h);
    }

    /*停用*/
    function admin_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            //发异步把用户状态进行更改
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_start(this,id)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!', {icon: 5, time: 1000});
        });
    }

    /*启用*/
    function admin_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            //发异步把用户状态进行更改
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6, time: 1000});
        });
    }

    //编辑
    function admin_edit(title, url, id, w, h) {
        x_admin_show(title, url, w, h);
    }

    /*删除*/
    function admin_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }
</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>
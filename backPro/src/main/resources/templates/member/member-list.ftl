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

    <!--    首页> 会员管理> 轮播列表    后面有个刷新页面图标    -->
    <div class="x-nav">
                <span class="layui-breadcrumb">
                  <a><cite>首页</cite></a>
                  <a><cite>会员管理</cite></a>
                  <a><cite>轮播列表</cite></a>
                </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>


    <div class="x-body">
            <form class="layui-form x-center" action="" style="width:800px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">

                    <div class="layui-input-inline">
                      <input class="layui-input date" name="startDate" placeholder="开始日" id="startDate">
                    </div>

                    <div class="layui-input-inline">
                      <input class="layui-input date" name="endDate" placeholder="截止日" id="endDate">
                    </div>

                    <div class="layui-input-inline">
                      <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>

                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit lay-filter="sreach">搜索</button>
                    </div>

                  </div>
                </div> 
            </form>
            <xblock>

                <button class="layui-btn layui-btn-danger" onclick="delAll()">
                    <i class="layui-icon">&#xe640;</i>批量删除
                </button>

                <button class="layui-btn" id="insert" onclick="member_add('添加用户','member-add.html','600','500')">
                    <i class="layui-icon">&#xe608;</i>添加
                </button>

            </xblock>
           <#-- <table class="layui-table">

                        <td>
                            <u style="cursor:pointer" onclick="member_show('张三','memberShowPage','10001','360','400')">
                                小明
                            </u>
            </table>-->

        <table id="firstTable" lay-filter="firstTable"></table>

        </div>



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
                    , url: '/member/selectUserList'  //数据接口
                    , page: true        //开启分页
                    ,toolbar: true
                    , cols: [[          //表头-
                        {field: 'id', title: 'id'}
                        , {field: 'zhanghao', title: '账号'}
                        , {field: 'uname', title: '姓名'}
                        , {field: 'phone', title: '电话'}
                        , {field: 'email', title: '邮箱'}
                        , {field: 'dengjiValue', title: '会员登记'}
                       /* ,{field: 'zhuangtai', title: '状态',templet: '#state'}*/
                        ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}

                    ]]
                    , limit: 2
                    , limits: [2, 5, 10]
                })


                lay('.date').each(function () {
                    laydate.render({
                        elem: this
                        ,trigger: 'click'
                    });
                })


                form.on('submit(sreach)',function (data) {
                    var dataValue = data.field;
                    table.reload('table', {
                        url: '/member/selectUserList'
                        ,where: {startDate:dataValue.startDate,endDate:dataValue.endDate,uname:dataValue.username}
                        ,page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                    return false;
                })



                function deleteUser(id){
                    $.ajax({
                        "url":"/member/deleteUser"
                        ,"dataType":"json"
                        ,"data":{id:id}
                    })
                }

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
                    }else if(obj.event === 'edit'){
                        layer.open({
                            type: 2,
                            area: ['800px', '550px'],
                            fixed: false, //不固定
                            maxmin: true,
                            content: '/memberEditPage?id='+data.id,
                            end:function () {
                                table.reload('table', {
                                    url: '/member/selectUserList'
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            }

                        });
                    }else if(obj.event === 'update'){
                        layer.open({
                            type: 2,
                            area: ['800px', '550px'],
                            fixed: false, //不固定
                            maxmin: true,
                            content: '/memberPasswordPage?id='+data.id,
                            end:function () {
                                table.reload('table', {
                                    url: '/member/selectUserList'
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            }

                        });
                    }

                })

                table.on('rowDouble(firstTable)', function(obj){
                    var id = obj.data.id;
                    layer.open({
                        type: 2,
                        area: ['800px', '550px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: '/memberEditPage?id='+id,
                        end:function () {
                            table.reload('table', {
                                url: '/member/selectUserList'
                                ,page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        }

                    });
                });


                $("#insert").click(function () {
                    layer.open({
                        type: 2,
                        area: ['800px', '550px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: '/memberAddPage'
                    });
                })
                
                

            });





            //批量删除提交
             function delAll () {
                layer.confirm('确认要删除吗？',function(index){
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                });
             }


            </script>


    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update">修改</a>
        <a class="layui-btn  layui-btn-xs" lay-event="del">删除</a>
    </script>


    </body>
</html>
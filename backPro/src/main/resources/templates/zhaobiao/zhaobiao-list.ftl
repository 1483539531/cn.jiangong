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
            <form class="layui-form x-center" action="" style="width:1500px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">

                    <div class="layui-input-inline">
                      <input class="layui-input date" placeholder="开始日" name="start" id="start">
                    </div>

                    <div class="layui-input-inline">
                      <input class="layui-input date" placeholder="截止日" name="end" id="end">
                    </div>

                     <div class="layui-input-inline">
                         <select id="number" name="number" lay-verify="" lay-search placeholder="编号">
                             <option value="">请选择</option>
                         </select>
                     </div>

                      <div class="layui-input-inline">
                          <select id="address" name="address" lay-verify="" lay-search placeholder="地址">
                              <option value="">请选择</option>
                          </select>
                      </div>


                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach">搜索</button>
                    </div>

                  </div>
                </div> 
            </form>

           <#-- <table class="layui-table">

                <tbody>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            <u style="cursor:pointer" onclick="question_show()">
                                问题标题
                            </u>
                        </td>
                        <td >
                            新闻子类1
                        </td>
                        <td >
                            xuebingsi
                        </td>
                        <td >
                            2017-01-01 11:11:42
                        </td>
                        <td >
                            34
                        </td>
                        <td class="td-manage">
                            <a title="编辑" href="javascript:;" onclick="question_edit('编辑','zhaobiao-edit.html','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="question_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>-->

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


                table.render({
                    elem: '#firstTable'
                    , id: 'table'
                    , url: '/zhaobiao/selectZhaobiaoList'  //数据接口
                    , page: true        //开启分页
                    ,toolbar: true
                    , cols: [[          //表头-
                        {field: 'zhaobiaoNumber', title: '招标编号'}
                        , {field: 'zhaobiaoHangyeValue', title: '所属行业'}
                        , {field: 'cityAddressValue', title: '地址'}
                        , {field: 'NAME', title: '联系人'}
                        , {field: 'phone', title: '电话'}
                        , {field: 'moneySourceValue', title: '资金来源'}
                        , {field: 'money', title: '投资金额',sort:true}
                        , {field: 'submission', title: '提交时间'}
                        ,{field: 'id', title: 'id'}
                        ,{field: 'zhuangtai', title: '状态',templet: '#state'}
                        ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
                    ]]
                    , limit: 2
                    , limits: [2, 5, 10]
                });

                lay('.date').each(function(){
                    laydate.render({
                        elem: this
                        ,trigger: 'click'
                    });
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
                            area: ['1200px', '550px'],
                            fixed: false, //不固定
                            maxmin: true,
                            content: '/zhaobiaoListXiangxiPage?id='+data.id
                        });
                    }

                })

                form.on('submit(sreach)',function (data) {
                    var dataValue = data.field;
                    table.reload('table', {
                        url: '/zhaobiao/selectZhaobiaoList'
                        ,where: {startdate:dataValue.start,enddate:dataValue.end,
                            zhaobiaoNumber:dataValue.number,cityAddress:dataValue.address}
                        ,page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                    return false;
                })



                function updateState(state,id) {
                    $.ajax({
                        "url" : "/zhaobiao/updateState"
                        ,"data" :{"state": state,"id":id}
                        ,"type" : "GET"
                        ,"dateType" : "json"
                    })
                }


                form.on('switch(switchTest)',function (data) {
                    updateState(data.elem.checked,data.value)
                })
                selectNumber();
                function selectNumber() {
                    $.ajax({
                        "url" : "/zhaobiao/selectNumber"
                        ,"dataType" : "json"
                        ,"success" : function (data) {
                            console.log(JSON.stringify(data))
                            for (var i = 0; i < data.length; i++) {
                                $("#number").append("<option value="+data[i].zhaobiaoNumber+">"+data[i].zhaobiaoNumber+"</option>")
                                $("#address").append("<option value="+data[i].cityAddress+">"+data[i].cityAddressValue+"</option>")
                            }
                            form.render();
                        }
                    })
                }
                
                



            })










            //批量删除提交
             function delAll () {
                layer.confirm('确认要删除吗？',function(index){
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                });
             }

             function question_show (argument) {
                layer.msg('可以跳到前台具体问题页面',{icon:1,time:1000});
             }
             /*添加*/
            function question_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
            //编辑 
           function question_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }

            /*删除*/
            function question_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                });
            }
            </script>


    <script type="text/html" id="state">
        {{#  if(d.zhuangtai == 2 ){ }}
        <input type="checkbox"  lay-skin="switch" lay-filter="switchTest" lay-text="已审核|未锁定" value={{ d.id }}>
        {{# }else if(d.zhuangtai == 3 ){ }}
        <input type="checkbox" checked lay-skin="switch" lay-filter="switchTest" lay-text="已审核|未锁定" value={{ d.id }}>
        {{# } else { }}
        <input type="checkbox" checked disabled lay-skin="switch" lay-filter="switchTest" lay-text="已发布" value={{ d.id }}>
        {{#  } }}
    </script>


    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </script>
    </body>
</html>
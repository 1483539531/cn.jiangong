<%@ page contentType="text/html;charset=UTF-8" language="java" %>>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            X-admin v1.0
        </title>
        <link rel="stylesheet" href="layui/css/layui.css">
        <script src="layui/layui.js"></script>
        <script src="js/jquery-1.12.4.js"></script>
        <style>
            .x-body{
                padding: 20px;
            }
        </style>
    </head>
    <body>

















        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>11</cite></a>
              <a><cite>会员管理</cite></a>
              <a><cite>分类管理</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>


        <div class="x-body">


            <form class="layui-form x-center"   action="" style="width:50%;margin: 0px auto" >
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item" style="width:600px">


                    <label class="layui-form-label" style="width:100px">所属分类</label>

                    <div class="layui-input-inline" style="width:120px;text-align: left">
                        <select name="firstCategory" id="firstCategory" lay-filter="firstCategory">
                             <option value=-2>全部</option>
                        </select>
                    </div>

                      <div class="layui-input-inline" style="width:120px;text-align: left">
                          <select name="twoCategory" id="twoCategory" >
                              <option value=-2>全部</option>
                          </select>
                      </div>

                    <div class="layui-input-inline" style="width:120px">
                        <input type="text" name="name"  placeholder="分类名" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="add"><i class="layui-icon">&#xe608;</i>增加</button>
                    </div>




                  </div>
                </div>
            </form>

            <%--批量删除 和共有几条数据--%>
            <xblock>
                <button class="layui-btn layui-btn-danger" onclick="delAll()">
                    <i class="layui-icon">&#xe640;</i>
                    批量删除
                </button>
                <span class="x-right" style="line-height:40px">共有数据：88 条</span>
            </xblock>


            <%--<table class="layui-table">

                &lt;%&ndash;id  分类名  所属父级  操作&ndash;%&gt;
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" name="" value="">
                        </th>
                        <th>ID</th>
                        <th>分类名</th>
                        <th>所属父级</th>
                        <th>操作</th>
                    </tr>
                </thead>

                <tbody id="x-link">


                    &lt;%&ndash;需要循环的地方&ndash;%&gt;
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td>1</td>
                        <td>1</td>
                        <td>新闻</td>

                        &lt;%&ndash;编辑和删除&ndash;%&gt;
                        <td class="td-manage">

                            <a title="编辑" href="javascript:;" onclick="cate_edit('编辑','cate-edit.html','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>

                            <a title="删除" href="javascript:;" onclick="cate_del(this,'1')" 
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
            layui.use(['element','layer','form','table'], function(){
                var element = layui.element;
                var layer = layui.layer;
                var form = layui.form;
                var table = layui.table;




                /*js代码区域*/

                //先初始化一级分类
                firstCategoryInit(0);

                //初始化一级分类方法
                function firstCategoryInit(parentId){
                    $.ajax({
                        "url" : "category",
                        "type" : "GET",
                        "dataType":"json",
                        "data" : "parentId="+parentId,
                        "success" : firstCategoryInitCallBack
                    })
                }
                //初始化一级分类成功后回调函数
                function firstCategoryInitCallBack(calldata) {
                    var categorys = calldata.data;
                    $("#firstCategory").children().remove();
                    $("#firstCategory").append("<option value=-2>全部</option>")
                    for (var i = 0; i <categorys.length ; i++) {
                        $("#firstCategory").append("<option value=" + categorys[i].id + ">"+categorys[i].value+"</option>")
                    }
                    form.render();
                }



                //初始化二级分类方法
                function twoCategoryInit(parentId){
                    $.ajax({
                        "url" : "category",
                        "type" : "GET",
                        "dataType":"json",
                        "data" : "parentId="+parentId,
                        "success" : twoCategoryInitCallBack
                    })
                }

                //初始化二级分类成功后回调函数
                function twoCategoryInitCallBack(calldata) {
                    var categorys = calldata.data;
                    $("#twoCategory").children().remove();
                    $("#twoCategory").append("<option value=-2>全部</option>")
                    for (var i = 0; i <categorys.length ; i++) {
                        $("#twoCategory").append("<option value=" + categorys[i].id + ">"+categorys[i].value+"</option>")
                    }
                    form.render();
                }





























                //layui区域

                form.on('select(firstCategory)', function(data){
                    alert(data.value); //得到被选中的值
                    twoCategoryInit(data.value);
                });


                table.render({
                    elem: '#firstTable'
                    ,url: 'category?parentId=0'   //数据接口
                    ,page: true        //开启分页
                    ,cols: [[          //表头
                         {field: 'id', title: 'ID'}
                        ,{field: 'parentId', title: '父级id'}
                        ,{field: 'value', title: '值' }
                        ,{field: 'parentname', title: '父级名字' }
                    ]]
                });






                //监听提交
              form.on('submit(add)', function(data){
                console.log(data);
                //发异步，把数据提交给php
                layer.alert("增加成功", {icon: 6});
                $('#x-link').prepend('<tr><td><input type="checkbox"value="1"name=""></td><td>1</td><td>1</td><td>'+data.field.name+'</td><td class="td-manage"><a title="编辑"href="javascript:;"onclick="cate_edit(\'编辑\',\'cate-edit.html\',\'4\',\'\',\'510\')"class="ml-5"style="text-decoration:none"><i class="layui-icon">&#xe642;</i></a><a title="删除"href="javascript:;"onclick="cate_del(this,\'1\')"style="text-decoration:none"><i class="layui-icon">&#xe640;</i></a></td></tr>');
                return false;
              });


            })










              
            //批量删除提交
             function delAll () {
                layer.confirm('确认要删除吗？',function(index){
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                });
             }

             //-编辑
            function cate_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
           
            /*-删除*/
            function cate_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                });
            }
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
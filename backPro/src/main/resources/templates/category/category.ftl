<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            X-admin v1.0
        </title>


        <link rel="stylesheet" href="/layui/css/layui.css">
        <script src="/js/jquery-1.12.4.js"></script>
        <script src="/layui/layui.js"></script>
        <style>
            .x-body{
                padding: 20px;
            }
        </style>


    </head>
    <body>












        <div class="x-nav">

            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>


        <div class="x-body">


            <form class="layui-form x-center"   action="" style="width:50%;margin: 0px auto;position: relative;right: 40px;" >
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item" style="width:1000px">


                    <label class="layui-form-label" style="width:100px">所属分类</label>

                      <div class="layui-input-inline" style="width:120px;text-align: left">
                          <select name="categoryType" id="categoryType" lay-filter="categoryType" lay-search>
                              <option value='fen'>项目分类</option>
                              <option value='huiyuan'>会员分权</option>
                              <option value='zhiwei'>职位分类</option>
                              <option value='yezhu'>业主分类</option>
                              <option value='laiyuan'>资金来源分类</option>
                              <option value='dizhi'>地址管理</option>
                          </select>
                      </div>


                    <div class="layui-input-inline" style="width:120px;text-align: left">
                        <select name="firstCategory" id="firstCategory" lay-filter="firstCategory" lay-search>
                             <option value=-10>全部</option>
                        </select>
                    </div>

                      <div class="layui-input-inline" style="width:120px;text-align: left">
                          <select name="twoCategory" id="twoCategory" lay-filter="twoCategory" lay-search>
                              <option value=100>全部</option>
                          </select>
                      </div>


                    <div class="layui-input-inline" style="width:120px">
                        <input type="text" name="name"  placeholder="分类名" lay-verify="required" lay-verType="tips" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="add">
                            <i class="layui-icon">&#xe608;</i>
                            增加
                        </button>
                    </div>




                  </div>
                </div>
            </form>

            <table id="firstTable" lay-filter="firstTable"></table>





        <script>
            layui.use(['element','layer','form','table'], function(){
                var element = layui.element;
                var layer = layui.layer;
                var form = layui.form;
                var table = layui.table;

                //进入页面默认显示项目分类，在数据库里类型列值为fen
                var typeValue = 'fen';
                var firstCategory = "";
                var twoCategory = "";



                /*js代码区域----------------------------------------------------------------*/

                //先初始化一级分类
                categoryType(0,typeValue);


                //点击分类重载一级分类
                function categoryType(parentId,type){
                    $.ajax({
                        "url" : "/category/SelectCategorysList",
                        "type" : "GET",
                        "dataType":"json",
                        "data" : "parentId="+parentId+"&type="+type,
                        "success" : categoryTypeCallBack
                    })
                }
                //点击分类重载一级分类成功后回调函数
                function categoryTypeCallBack(calldata) {
                    var categorys = calldata.data;

                    $("#firstCategory").children().remove();
                    $("#firstCategory").append("<option value=-10>全部</option>")
                    firstCategory = "";
                    $("#twoCategory").children().remove();
                    $("#twoCategory").append("<option value=-10>全部</option>")
                    twoCategory = "";

                    for (var i = 0; i <categorys.length ; i++) {
                        $("#firstCategory").append("<option value=" + categorys[i].id + ">"+categorys[i].value+"</option>")
                    }
                    form.render();
                }




                //初始化二级分类方法
                function twoCategoryInit(parentId){
                    $.ajax({
                        "url" : "/category/SelectCategorysList",
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
                    //查到数据就显示parentid一点全部下面就显示parentid为
                    //查不到的话（那就是一级分类也是请选择显示的为当前分类所有parent0的数据）那就是-10，直接就不执行任何即可，
                   if(categorys[0] != null){
                        $("#twoCategory").append("<option value="+categorys[0].parentId+">全部</option>")
                       twoCategory = "";
                    }else{
                        $("#twoCategory").append("<option value=-10>全部</option>")
                       twoCategory = "";
                    }
                    for (var i = 0; i <categorys.length ; i++) {
                        $("#twoCategory").append("<option value=" + categorys[i].id + ">"+categorys[i].value+"</option>")
                    }
                    form.render();
                }


                function addCategory(name,parentId,type){
                    $.ajax({
                        "url" : "/category/addCategory"
                        ,"data" : {"name":name,"parentId":parentId,"type":type}
                        ,"dataType" : "json"
                        ,"success" : function (data) {
                            alert(data)
                        }
                    })
                }

                function updateCategory(name,id){
                    $.ajax({
                        "url" : "/category/updateCategory"
                        ,"data" : {"name":name,"id":id}
                        ,"dataType" : "json"
                        ,"success" : function (data) {
                            alert(data)
                        }
                    })
                }

                function deleteCategory(id){
                    var flag;
                    $.ajax({
                        "url" : "/category/deleteCategory"
                        ,"data" : {"id":id}
                        ,"dataType" : "json"
                        ,async:false
                        ,"success" : function (data) {
                            flag = data;
                        }
                    })
                    return flag;
                }






                /*layui区域---------------------------------------------------------------------------*/

                //分类切换会显示该分类父级id为0的数据
                form.on('select(categoryType)', function(data){
                    typeValue = data.value;
                    categoryType(0,data.value);
                    table.reload('table', {
                        url: '/category/SelectCategorysList'
                        ,where: {parentId:0,type:data.value }
                        ,page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    })
                });


                //如果为-10就查该分类的全部父级0的，下拉那就啥也查不到因为是-10
                form.on('select(firstCategory)', function(data){
                    if($(data.othis).find(".layui-unselect").val()=="全部"){
                        firstCategory = "";
                    }else{
                        firstCategory = "1";
                    }
                    var dataValue = data.value;
                    twoCategoryInit(dataValue);
                    if(dataValue == -10){
                        dataValue = 0;
                    }
                    table.reload('table', {
                        url: '/category/SelectCategorysList'
                        ,where: {parentId:dataValue,type:typeValue }
                        ,page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                });

                form.on('select(twoCategory)', function(data){
                    if($(data.othis).find(".layui-unselect").val()=="全部"){
                       twoCategory = "";
                    }else{
                        twoCategory = "1";
                    }
                    var dataValue = data.value;
                    if(dataValue != -10){
                        table.reload('table', {
                            url: '/category/SelectCategorysList?parentId='+dataValue
                            ,page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    }
                });


                table.render({
                    elem: '#firstTable'
                    ,id: 'table'
                    ,url: '/category/SelectCategorysList?parentId=0'   //数据接口
                    ,page: true        //开启分页
                    ,cols: [[          //表头
                         {field: 'id', title: 'ID'}
                        ,{field: 'value', title: '值',edit:true }
                        ,{field: 'parentId', title: '父级id'}
                        ,{field: 'parentname', title: '父级名字',templet: '#parentName' }
                        ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
                    ]]
                    ,limit : 2
                    ,limits: [2,5,10]
                });






                //监听提交
              form.on('submit(add)', function(data){
                var data =  data.field;
                var parentId;
                if(twoCategory != ""){
                    parentId = data.twoCategory;
                }else if(firstCategory != ""){
                    parentId = data.firstCategory;
                }else{
                    parentId = "0"
                }
                  addCategory(data.name,parentId,typeValue);
                  table.reload('table', {
                      url: '/category/SelectCategorysList'
                      ,where: {parentId:parentId,type:typeValue }
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
                           if(!deleteCategory(data.id)){
                                layer.alert('有子元素不能删除', {
                                    skin: 'layui-layer-molv' //样式类名
                                    ,closeBtn: 0
                                });
                            }else{
                                obj.del();
                            }
                            layer.close(index);
                        });
                    }

                })



                table.on('edit(firstTable)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
                    updateCategory(obj.value,obj.data.id);
                });



            })


        </script>

        <script type="text/html" id="parentName">
            {{#  if(d.parentname == null){ }}
            无父级
            {{#  } else { }}
            {{d.parentname}}
            {{#  } }}
        </script>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
























    </body>
</html>
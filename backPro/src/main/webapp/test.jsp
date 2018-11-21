<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>w
    <script src="js/jquery-1.12.4.js"></script>
</head>
<body>

<table id="demo" lay-filter="test"></table>

<div id="aa">sadsad</div>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var form = layui.form;
        //第一个实例
        var ccc = table.render({
            elem: '#demo'
            ,url: 'category1' //数据接口
            ,id:'test1'
            ,toolbar: '#toolbarDemo'
            ,cols: [[
                ,{type:'space',title: '分类信息', align: 'center',colspan: 4}
            ],[
                {field: 'id', title: 'ID', width:150, sort: true,totalRow: true,style : ''}
                ,{field: 'parentId', title: '父级id', width:150,event:"id"}
                ,{field: 'value', title: '值', width:150, sort: true,edit:'text'}
                ,{field: 'parentname', title: '父级名字', width:80}
                ,{field: 'parentId', title: '是否成功', width:150,templet: '#titleTpl',}
                ,{width:150,type:'checkbox',title:"操作", toolbar: '#barDemo'}
            ]]
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: [ 'limit','prev', 'page', 'next', 'skip'] //自定义分页布局
                ,groups: 2    //只显示 2 个连续页码
                ,limit:1
            } //开启分页
            ,done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                alert(JSON.stringify(res.data))

            }
        });



        //监听行单击事件
        table.on('rowDouble(test)', function(obj){
            alert(obj.tr) //得到当前行元素对象
            alert(JSON.stringify(obj.data)) //得到当前行数据
            var aa = obj.data;
            aa.id=4;
            //obj.del(); //删除当前行
            //obj.update(aa) //修改当前行数据
        });







    });

</script>

<script type="text/html" id="titleTpl">
    {{#  if(d.id < 7){ }}
    <input type="checkbox" name="lock" value="{{d.id}}" title="锁定" lay-filter="lockDemo" checked>
    {{#  } else { }}
    <input type="checkbox" name="lock" value="{{d.id}}" title="锁定" lay-filter="lockDemo" >
    {{#  } }}
</script>

</body>

</html>
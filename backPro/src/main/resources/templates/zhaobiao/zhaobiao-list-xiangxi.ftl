<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script src="/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>
    <style>
        .x-body{
            padding: 20px;
        }
        .layui-card-header{
            border-bottom:1px solid #8c8c8c;
        }
        .common{
            position: relative;left: 5px;
        }
    </style>

</head>
<body>

<div class="x-body">

    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">



            <div class="layui-col-md12">
                <div class="layui-card">

                    <div class="layui-card-header">标题:
                        <span class="common" id="title"></span>
                    </div>
                    <div class="layui-card-header">标题
                        <span class="common">王者峡谷</span>
                    </div>
                    <div class="layui-card-header">标题
                        <span class="common">王者峡谷</span>
                    </div>

                </div>
            </div>







            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">开标时间:
                        <span class="common" id="kaibiao">xxx</span>
                    </div>
                </div>
            </div>


            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">投资金额:
                        <span class="common" id="touzi">xxx</span>
                    </div>
                </div>
            </div>



            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">资金来源:
                        <span class="common" id="zijin">xxx</span>
                    </div>
                </div>
            </div>


            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">所属行业:
                        <span class="common" id="suoshu">xxx</span>
                    </div>
                </div>
            </div>

            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">联系姓名:
                        <span class="common" id="name">xxx</span>
                    </div>
                </div>
            </div>

            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">联系电话:
                        <span class="common" id="phone">xxx</span>
                    </div>
                </div>
            </div>

            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">属省地址:
                        <span class="common" id="sheng">xxx</span>
                    </div>
                </div>
            </div>


            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header">属市地址:
                        <span class="common" id="city">xxx</span>
                    </div>
                </div>
            </div>





        </div>
    </div>

    <hr class="layui-bg-black">

    <fieldset class="layui-elem-field">
        <legend>详细内容</legend>
        <div class="layui-field-box" id="content">

        </div>
    </fieldset>


</div>
<input type="hidden" id="zhaobiaoId" value="<#if RequestParameters['id']??>${RequestParameters['id']}</#if>">

<script>
    layui.use(['laydate', 'element', 'laypage', 'layer', 'form', 'table'], function () {
        var laydate = layui.laydate;//日期插件
        var lement = layui.element;//面包导航
        var laypage = layui.laypage;//分页
        var layer = layui.layer;//弹出层
        var form = layui.form;
        var table = layui.table;


        show();
        function show() {
            var id1 = $("#zhaobiaoId").val();
            $.ajax({
                "url":"/zhaobiao/selectZhaobiaoListToId"
                ,"data":{"id":id1}
                ,"dataType":"json"
                ,"success":function (data) {
                    $("#content").append(data[0].content)
                    $("#title").html(data[0].title)

                    $("#kaibiao").html(data[0].releaseDate)
                    $("#touzi").html(data[0].money)
                    $("#zijin").html(data[0].moneySource)
                    $("#suoshu").html(data[0].zhaobiaoHangye)
                    $("#name").html(data[0].name)
                    $("#touzi").html(data[0].money)
                    $("#sheng").html(data[0].shengAddress)
                    $("#city").html(data[0].cityAddress)


                }
            })
        }


    })
</script>



</body>
</html>
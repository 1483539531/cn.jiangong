<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            X-admin v1.0
        </title>

        <script src="/js/jquery-1.12.4.js"></script>

        <link rel="stylesheet" href="/lib/layui/css/layui.css">
        <script src="/lib/layui/layui.js"></script>

        <link rel="stylesheet" href="/css/x-admin.css" media="all">
        <script src="/js/x-layui.js" ></script>
        <script src="/js/x-admin.js"></script>
    </head>
    <body>


















        <div class="layui-layout layui-layout-admin">




            <!--标题栏-->
            <div class="layui-header header header-demo">
                <div class="layui-main">

                    <a class="logo" href="index.ftl">建设网1</a>

                    <ul class="layui-nav" lay-filter="">
                        <!--logo图片-->
                      <li class="layui-nav-item"><img src="/images/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>

                      <li class="layui-nav-item">
                        <a href="javascript:;">用户name</a>
                        <dl class="layui-nav-child"> <!-- 二级菜单 -->
                          <dd><a href="">个人信息</a></dd>
                          <dd><a href="">切换帐号</a></dd>
                          <dd><a href="/loginPage">退出</a></dd>
                        </dl>
                      </li>

                      <!--<li class="layui-nav-item">
                        <a href="" title="消息">
                            <i class="layui-icon" style="top: 1px;">&#xe63a;</i>
                        </a>
                        </li> -->
                      <li class="layui-nav-item x-index"><a href="/">前台首页</a></li>
                    </ul>

                </div>
            </div>














            <div class="layui-side layui-bg-black x-side">
                <div class="layui-side-scroll">








                    <!--left-side栏-->
                    <ul class="layui-nav layui-nav-tree site-demo-nav" id="side1" lay-filter="side">



                        <!--问题管理-->
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe607;</i><cite>问题管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                    <dd class="">
                                        <a href="javascript:;" _href="./question-list.html">
                                            <cite>问题列表</cite>
                                        </a>
                                    </dd>


                                    <dd class="">
                                        <a href="javascript:;" _href="./question-del.html">
                                            <cite>删除问题</cite>
                                        </a>
                                    </dd>

                            </dl>

                        </li>

                        <!--产品管理-->
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe62d;</i><cite>产品管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                    <dd class="">
                                        <a href="javascript:;" _href="./aaa.html">
                                            <cite>产品列表（待开发）</cite>
                                        </a>
                                    </dd>

                                    <dd class="">
                                        <a href="javascript:;" _href="./recruiterList.html">
                                            <cite>品牌管理（待开发）</cite>
                                        </a>
                                    </dd>


                                    <dd class="">
                                        <a href="javascript:;" _href="./welcome.html">
                                            <cite>类型管理（待开发）</cite>
                                        </a>
                                    </dd>


                                    <dd class="">
                                        <a href="javascript:;" _href="./welcome.html">
                                            <cite>类型属性（待开发）</cite>
                                        </a>
                                    </dd>


                                    <dd class="">
                                        <a href="javascript:;" _href="./category.html">
                                            <cite>产品分类</cite>
                                        </a>
                                    </dd>

                            </dl>

                        </li>



                        <!--轮播管理-->
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                轮播管理
                            </a>

                            <dl class="layui-nav-child">
                                    <dd>
                                        <a href="javascript:;" _href="./question-list.html">轮播列表</a>
                                    </dd>
                            </dl>

                            <dl class="layui-nav-child">
                                <dd>
                                    <a href="javascript:;" _href="./question-del.html">轮播列表</a>
                                </dd>
                            </dl>

                        </li>




                       <#-- <!--订单管理&ndash;&gt;
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe642;</i><cite>订单管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                    <dd class="">
                                        <a href="javascript:;" _href="./welcome.ftl">
                                            <cite>订单列表（待开发）</cite>
                                        </a>
                                    </dd>

                            </dl>

                        </li>




                        <!--分类管理&ndash;&gt;
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe630;</i><cite>分类管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                <dd class="">
                                    <a href="javascript:;" _href="categoryPage">
                                        <cite>分类列表</cite>
                                    </a>
                                </dd>

                            </dl>

                        </li>





                        <!--评论管理&ndash;&gt;
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe606;</i><cite>评论管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                <dd class="">
                                    <a href="javascript:;" _href="./comment-list.html">
                                        <cite>评论列表</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./feedback-list.html">
                                        <cite>意见反馈</cite>
                                    </a>
                                </dd>

                            </dl>

                        </li>





                        <!--会员管理&ndash;&gt;
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe612;</i><cite>会员管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                <dd class="">
                                    <a href="javascript:;" _href="member-list.html">
                                        <cite>会员列表</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./member-del.html">
                                        <cite>删除会员</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./member-level.html">
                                        <cite>等级管理</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./member-kiss.html">
                                        <cite>积分管理</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./member-view.html">
                                        <cite>浏览记录</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./member-view.html">
                                        <cite>分享记录</cite>
                                    </a>
                                </dd>

                            </dl>

                        </li>






                        <!--管理员管理&ndash;&gt;
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe613;</i><cite>管理员管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                <dd class="">
                                    <a href="javascript:;" _href="adminListPage">
                                        <cite>管理员列表</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="adminRolePage">
                                        <cite>角色管理</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./admin-cate.html">
                                        <cite>权限分类</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="adminMenuPage">
                                        <cite>权限管理</cite>
                                    </a>
                                </dd>

                            </dl>

                        </li>




                        <!--系统统计&ndash;&gt;
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>系统统计</cite>
                            </a>

                            <dl class="layui-nav-child">

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts1.html">
                                        <cite>拆线图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts2.html">
                                        <cite>柱状图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts3.html">
                                        <cite>地图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts4.html">
                                        <cite>饼图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts5.html">
                                        <cite>雷达图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts6.html">
                                        <cite>k线图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts7.html">
                                        <cite>热力图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./echarts8.html">
                                        <cite>仪表图</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="http://echarts.baidu.com/examples.html" target="_blank" _href="./welcome.ftl">
                                        <cite>更多案例</cite>
                                    </a>
                                </dd>

                            </dl>

                        </li>



                        <!--系统设置&ndash;&gt;
                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe614;</i><cite>系统设置</cite>
                            </a>

                            <dl class="layui-nav-child">

                                <dd class="">
                                    <a href="javascript:;" _href="./sys-set.html">
                                        <cite>系统设置</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./sys-data.html">
                                        <cite>数字字典</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./sys-shield.html">
                                        <cite>屏蔽词</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./sys-log.html">
                                        <cite>系统日志</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./sys-link.html">
                                        <cite>友情链接</cite>
                                    </a>
                                </dd>

                                <dd class="">
                                    <a href="javascript:;" _href="./sys-qq.html">
                                        <cite>第三方登录</cite>
                                    </a>
                                </dd>

                            </dl>

                        </li>




                        <li class="layui-nav-item">

                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe634;</i><cite>轮播管理</cite>
                            </a>

                            <dl class="layui-nav-child">

                                <dd class="">
                                    <a href="javascript:;" _href="./banner-list.html">
                                        <cite>轮播列表</cite>
                                    </a>
                                </dd>

                            </dl>

                        </li>-->
                    </ul>



                </div>
            </div>





            <div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true">
                <div class="x-slide_left"></div>
                <ul class="layui-tab-title">
                    <li class="layui-this">
                        <a href="">我的桌面</a>
                        <i class="layui-icon layui-unselect layui-tab-close">ဆ</i>
                    </li>
                </ul>
                <div class="layui-tab-content site-demo site-demo-body">
                    <div class="layui-tab-item layui-show">
                        <iframe frameborder="0" src="/welcomePage" class="x-iframe"></iframe>
                    </div>
                </div>
            </div>

        </div>




    </body>



<script>



        selectEveryMenuList_id()
    function selectEveryMenuList_id() {
        $.ajax({
            "url" : "/index/idSelectEveryMenuList"
            ,"dataType" : "json"
            ,async : false
            ,"success" : function (data) {
                console.log(data)
                var str = "";
                for (var i = 0; i <data.length ; i++) {
                    var childrenValue = data[i].children;
                    if(childrenValue.length!=0){
                        str += "<li class=\"layui-nav-item \"><a class=\"javascript:;\" href=\"javascript:;\"> <i class=layui-icon style=top:3px;>&#xe634;</i><cite>"+data[i].name+"</cite> </a><dl class=layui-nav-child>"
                    }
                    for (var j = 0; j < childrenValue.length ; j++) {
                        str += " <dd> <a _href="+childrenValue[j].url+"> <cite>"+childrenValue[j].name+"</cite> </a> </dd> "
                    }
                    str += "</dl></li>";
                }
                $("#side1").empty();
                $("#side1").append(str)
            }
        })
    }
</script>
</html>
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
        <link rel="stylesheet" href="./css/x-admin.css" media="all">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link rel="stylesheet" href="./css/bootstrap-table.css">
        <link rel="stylesheet" href="./css/sweetalert2.css">
        <link rel="stylesheet" href="./css/sweetalert2.min.css">
        <link rel="stylesheet" href="./css/toastr.css">
        <style>
            .zpz-style div{
                line-height: 40px;
            }
            .zpz-style div a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
       <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>系统管理</cite></a>
              <a><cite>招聘者信息</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">

            <table  >

                <thead>
                <tr>
                    <th class="text-center" data-field="id">编号</th>
                    <th class="text-center" data-field="recruiterImg" data-formatter="recruiterImg">招聘者头像</th>
                    <th class="text-center" data-field="recruiterName">招聘者</th>
                    <th class="text-center" data-field="companyName">公司名称</th>
                    <th class="text-center" data-field="position">职位</th>
                    <th class="text-center" data-formatter="optFormatter" data-events="optEvents">操作</th>
                </tr>
                </thead>

            </table>



            <div class="modal fade" id="modal-id-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">编辑</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">编号：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="id" id="id" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">招聘者头像：</label>
                                    <div class="col-md-8">
                                        <img src="" id="imgRecruiter" alt="">
                                        <input type="text" name="recruiterImg" id="recruiterImg" class="form-control">
                                        <input type="file" name="fileName" id="fileName" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">招聘者：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="recruiterName" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">公司名称：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="companyName" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">职位：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="position" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">公司地址：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="companyAddress" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">公司简介：</label>
                                    <div class="col-md-8">
                                        <textarea name="companyProfile" cols="30" rows="10" class="form-control" style="height: 130px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-3">手机号：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="recruiterPhone" class="form-control">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" onclick="bc()" class="btn btn-primary">保存</button>
                        </div>
                    </div>&lt;!&ndash; /.modal-content &ndash;&gt;
                </div>&lt;!&ndash; /.modal-dialog &ndash;&gt;
            </div>&lt;!&ndash; /.modal &ndash;&gt;

            <div class="modal fade" id="modal-id-2">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">详情信息</h4>
                        </div>
                        <div class="modal-body">
                            <div id="view">
                                <div>
                                    <label for="" class="control-label col-md-4 text-right">编号：</label>
                                    <span></span>
                                </div>
                                <p>&emsp;</p>
                                <div>
                                    <label for="" class="control-label col-md-4 text-right">招聘者头像：</label>
                                    <span>
                                        <img src="" alt="">
                                    </span>
                                </div>
                                <p>&emsp;</p>
                                <div>
                                    <label for="" class="control-label col-md-4 text-right">招聘者：</label>
                                    <span></span>
                                </div>
                                <p>&emsp;</p>
                                <div>
                                    <label for="" class="control-label col-md-4 text-right">公司名称：</label>
                                    <span></span>
                                </div>
                                <p>&emsp;</p>
                                <div>
                                    <label for="" class="control-label col-md-4 text-right">职位：</label>
                                    <span></span>
                                </div>
                                <p>&emsp;</p>
                                <div>
                                    <label for="" class="control-label col-md-4 text-right">公司地址：</label>
                                    <span></span>
                                </div>
                                <p>&emsp;</p>
                                <div>
                                    <label for="" class="control-label col-md-4 text-right" style="height: 70px;">公司简介：</label>
                                    <span></span>
                                </div>
                                <p>&emsp;</p>
                                <div>
                                    <label for="" class="control-label col-md-4 text-right">手机号：</label>
                                    <span></span>
                                </div>
                                <p>&emsp;</p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>&lt;!&ndash; /.modal-content &ndash;&gt;
                </div>&lt;!&ndash; /.modal-dialog &ndash;&gt;
            </div>&lt;!&ndash; /.modal &ndash;&gt;



            <div class="modal fade" id="modal-id-3">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">职位描述</h4>
                        </div>
                        <div class="modal-body">
                            <p></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>&lt;!&ndash; /.modal-content &ndash;&gt;
                </div>&lt;!&ndash; /.modal-dialog &ndash;&gt;
            </div>&lt;!&ndash; /.modal &ndash;&gt;
        </div>
        <script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="./js/bootstrap.js"></script>
        <script type="text/javascript" src="./js/bootstrap-table.js"></script>
        <script type="text/javascript" src="./js/bootstrap-table-zh-CN.js"></script>
        <script type="text/javascript" src="./js/sweetalert2.js"></script>
        <script type="text/javascript" src="./js/sweetalert2.min.js"></script>
        <script type="text/javascript" src="./js/toastr.js"></script>
      <script>

            $(function(){
                $("#fileName").change(function () {
                    var recruiterImg = $(this).val().split("\\")[2];
                    /*var id = $("#id").val();
                    var param = {"recruiterImg":recruiterImg,"id":id};
                    $.post("/recruiter/uploadRecruiterImg",param,function (msg) {
                        toastr.warning("温馨提示："+msg);
                        $("#table").bootstrapTable("refresh");
                    })*/
                    var imgPath = "/images/"+recruiterImg;
                    $("#imgRecruiter").attr("src",imgPath);
                    $("#modal-id-1").find("input:eq(1)").val(imgPath);
                });
            })

            function recruiterImg(recruiterImg) {
                var img = "<img class='center-block' src='"+recruiterImg+"'/>";
                return img;
            }


            function optFormatter() {
                var edit = "<button class='btn btn-info edit'>编辑</button>";
                var del = "<button class='btn btn-danger del'>删除</button>";
                var query = "<button class='btn btn-primary query'>详情信息</button>";
                return edit+"&emsp;"+del+"&emsp;"+query;
            }

            var optEvents = {
                "click .edit":function (index,value,row) {
                    edit(row);
                },
                "click .del":function (index,value,row) {
                    del(row);
                },
                "click .query":function (index,value,row) {
                    query(row);
                }
            };

            function edit(row) {
                $("#modal-id-1").find("input:eq(0)").val(row.id);
                $("#modal-id-1").find("input:eq(1)").val(row.recruiterImg);
                $("#imgRecruiter").attr("src",row.recruiterImg);
                $("#modal-id-1").find("input:eq(3)").val(row.recruiterName);
                $("#modal-id-1").find("input:eq(4)").val(row.companyName);
                $("#modal-id-1").find("input:eq(5)").val(row.position);
                $("#modal-id-1").find("input:eq(6)").val(row.companyAddress);
                $("#modal-id-1").find("textarea").val(row.companyProfile);
                $("#modal-id-1").find("input:eq(7)").val(row.recruiterPhone);
                $("#modal-id-1").modal("show");
            }

            function bc() {
                var formParam = $("#modal-id-1 form").serialize();
                var imgRecruiterSrc = $("#imgRecruiter").attr("src");
                $.post("/recruiter/update",formParam,function (msg) {
                    toastr.warning("温馨提示："+msg);
                    $("#table").bootstrapTable("refresh")
                    $("#modal-id-1").modal("hide");
                    $("#modal-id-1 form")[0].reset();
                })
            }

            function query(row) {
                $("#modal-id-2").modal("show");
                $("#view").find("span:eq(0)").html(row.id);
                $("#view").find("span:eq(1) img").attr("src",row.recruiterImg);
                $("#view").find("span:eq(2)").html(row.recruiterName);
                $("#view").find("span:eq(3)").html(row.companyName);
                $("#view").find("span:eq(4)").html(row.position);
                $("#view").find("span:eq(5)").html(row.companyAddress);
                $("#view").find("span:eq(6)").html(row.companyProfile);
                $("#view").find("span:eq(7)").html(row.recruiterPhone);
            }

            function del(row) {

                swal({
                    title: '温馨提示',
                    text: "确定要删除此招聘者信息吗!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText:'取消',
                    confirmButtonText: '确定'
                }).then(result) => ({
                    $.post("/recruiter/del?id="+row.id,function(msg){
                        swal(
                            msg,
                            '您删除的招聘者信息已移除!',
                            'success'
                        )
                    $("#table").bootstrapTable("refresh")
                })
            })

            }

            function detail(index,row) {
                var arr = row.recruitmentInfoList;

            <h4><strong>招聘者发布的职位信息</strong></h4>
                <table class="table table-bordered table-striped table-hover">
                    <tr>
                    <td class="text-center"><strong>编号</strong></td>
                <td class="text-center"><strong>招聘职位标题</strong></td>
                <td class="text-center"><strong>最低薪资—最高薪资</strong></td>
                <td class="text-center"><strong>最少工作经验—最高工作经验</strong></td>
                <td class="text-center"><strong>学历</strong></td>
                <td class="text-center"><strong>职位描述</strong></td>
                <td class="text-center"><strong>工作地址</strong></td>
                <td class="text-center"><strong>发布时间</strong></td>
                </tr>
                    `;
                var html=[];
                html.push(tb)
                $(arr).each(function () {
                    var id = this.id;
                    var jobTitle = this.jobTitle;
                    var minimumWage = this.minimumWage;
                    var maxmumWage = this.maxmumWage;
                    var minimumWorking = this.minimumWorking;
                    var maxmumWorking = this.maxmumWorking;
                    var education = this.education;
                    var describeContent = this.jobDescription.describeContent;
                    var workAddress = this.workAddress;
                    var createDate = this.createDate;
                    var tr=`
                <tr>
                <td class="text-center">${id}</td>
                    <td class="text-center">${jobTitle}</td>
                    <td class="text-center">${minimumWage}-${maxmumWage}</td>
                    <td class="text-center">${minimumWorking}年-${maxmumWorking}年</td>
                    <td class="text-center">${education}</td>
                    <td class="text-center">
                    <input type="hidden" class="describeContentHidden" value="${describeContent}"/>
                    <a href='javascript:void(0)' onclick='djck();' style='text-decoration: none;cursor: pointer;'>点击查看</a>
                    </td>
                    <td class="text-center">${workAddress}</td>
                    <td class="text-center">${createDate}</td>
                    </tr>
                        `;
                    html.push(tr);
                });

                html.push(`</table>`);
                return html.join("");
            }

            function djck() {
                var describeContentHidden = $(".describeContentHidden").val();
                $("#modal-id-3").modal("show");
                $("#modal-id-3").find("p").html(describeContentHidden);
            }

      </script>
    </body>
</html>
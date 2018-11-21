
var table_name = $("#table_name").val();
var table_name2;

//var content;
//bkLib.onDomLoaded(function () {
//    content = new nicEditor({fullPanel: true}).panelInstance("description");
//});

function reload_rand() {
    var time = new Date().getTime();
    $("#rand").val("");
    $("#jishi").val(time);
    $("#randImg").prop("src", "/cblcn/member.regist/generateYzm?t=" + time + "&randomID=" + $("#randomID").val());
}

function refresh_category(category_id) {
    var category_ids = category_id.split(",");
    for (var i = 0; i < category_ids.length; i++) {
        $("#category_lin :checkbox").each(function () {
            if ($(this).val() == category_ids[i])
                $(this).prop("checked", "checked");
        });
    }
}
function refresh_biddingType(classb_id) {
    var classb_ids = classb_id.split(",");
    for (var i = 0; i < classb_ids.length; i++) {
        $("#classa_lin :checkbox").each(function () {
            if ($(this).val() == classb_ids[i])
                $(this).prop("checked", "checked");
        });
    }
}
//敏感词汇
var sensitiveWords = /习近平|李克强|胡锦涛|温家宝/;
function check_table_name2() {
    table_name2 = $("#table_name_lin :radio:checked").val();
    return true;
}
function check_title() {
    var title = $.trim($("#title").val());
    if (title == "") {
        alert($("#title_lin td").eq(0).text() + "不能为空！");
        return false;
    }
    if (title.length > 200) {
        alert($("#title_lin td").eq(0).text() + "过长！");
        return false;
    }
    if(title.search(sensitiveWords)>=0){
        return confirm("标题包含敏感词汇,确认提交吗？");
    }
    return true;
}
function check_category() {
    if ($("#category_lin :checked").length == 0) {
        alert($("#category_lin td").eq(0).text() + "不能为空！");
        return false;
    }
    return true;
}
function check_area() {
    if ($("#area_id").val() == "") {
        alert($("#area_lin td").eq(0).text() + "不能为空！");
        return false;
    }
    return true;
}
function check_enddate() {
    if (table_name2 == "ZBGG" || table_name2 == "ZBYG" || table_name == "CGXX") {
        publish_end_date = $.trim($("#publish_end_date").val());
        if (publish_end_date != "") {
            if (!/^\d{4}-\d{2}-\d{2}$/.test(publish_end_date)) {
                alert($("#end_date_lin td").eq(0).text() + "格式错误！");
                return false;
            }
            if (new Date(publish_end_date.replace("-", "/")) < new Date()) {
                alert($("#end_date_lin td").eq(0).text() + "错误！");
                return false;
            }
        }
    }
    return true;
}
function check_cust() {
    var cust_name = $.trim($("#cust_name").val());
    if (cust_name == "") {
        alert("联系人不能为空！");
        return false;
    }
    if (cust_name.length > 50) {
        alert("联系人过长！");
        return false;
    }
    return true;
}
//标讯类别
function check_classa() {
    if (table_name2 == "ZBGG" || table_name2 == "ZBYG") {
        var classa_id = $("#classa_id").val();
        if (classa_id == "") {
            alert("标讯类别不能为空");
            return false;
        }
    }
    return true;
}
//招标类型
function check_classb() {
    if (table_name2 == "ZBGG" || table_name2 == "ZBYG") {
        var classb_id = $("#classb_lin :checked").length;
        if (classb_id == 0) {
            alert("招标类型不能为空");
            return false;
        }
    }
    return true;
}
//资金来源
function check_classc() {
    if (table_name2 == "ZBGG" || table_name2 == "ZBYG") {
        var classc_id = $("#classc_id").val();
        if (classc_id == "") {
            alert("资金来源不能为空");
            return false;
        }
    }
    return true;
}
//function check_classc() {}
function check_stringa() {
    if (table_name == "ZBXX") {
        var stringa = $.trim($("#stringa").val());
        if (stringa == "") {
            alert($("#stringa_lin td").eq(0).text() + "不能为空！");
            return false;
        }
        if (stringa.length > 100) {
            alert($("#stringa_lin td").eq(0).text() + "过长！");
            return false;
        }
    }
    return true;
}
function check_stringb() {
    if (table_name == "ZBXX") {
        var stringb = $.trim($("#stringb").val());
        if (stringb == "") {
            alert($("#stringb_lin td").eq(0).text() + "不能为空！");
            return false;
        }
        if (stringb.length > 100) {
            alert($("#stringb_lin td").eq(0).text() + "过长！");
            return false;
        }
    }
    return true;
}
function check_stringc() {
    var stringc = $.trim($("#stringc").val());
    if (stringc == "") {
        alert("联系电话不能为空！");
        return false;
    }
    return true;
}
function check_stringd() {
    if (table_name2 == "ZBGS") {
        var stringd = $.trim($("#stringd").val());
        if (stringd == "") {
            alert($("#stringd_lin td").eq(0).text() + "不能为空！");
            return false;
        }
        if (stringd.length > 100) {
            alert($("#stringd_lin td").eq(0).text() + "过长！");
            return false;
        }
    }
    return true;
}
function check_inta() {
    if (table_name == "ZBXX" && $.trim($("#inta").val()) != "") {
        var inta = parseInt($.trim($("#inta").val()));
        if (inta == "NaN" || inta < 0) {
            alert($("#inta_lin td").eq(0).text() + "有误！");
            return false;
        }
    }
    if (table_name2 == "ZBGS" && $.trim($("#inta").val()) == "") {
        alert("中标金额不能为空！");
        return false;
    }
    return true;
}

function check_description() {
    /*var description = content.instanceById("description").getContent();
     if (description.length < 10) {
     alert("请补充信息内容！");
     return false;
     }
     if (description.length > 2 * 1024 * 1024) {
     alert("信息内容过大！");
     return false;
     }
     $("#description").val(description);
     return true;*/

    var description = UE.getEditor('container').getPlainTxt();
    if (description.length < 10) {
        alert("请补充信息内容！");
        return false;
    }
    if (description.length > 500000) {
        alert("信息内容过大！");
        return false;
    }

    if(description.search(sensitiveWords)>=0){
        return confirm("文章内容包含敏感词汇,确认提交吗？");
    }
    return true;

}
function check_rand() {
    var verify = false;
    var rand = $.trim($("#rand").val());
    if (rand == "") {
        alert("请输入验证码!");
        return verify;
    }
    jQuery.ajax({
        async: false,
        type: "post",
        url: "/cblcn/member.regist/checkyzm2",
        data: {"randomID": $("#randomID").val(), "input": rand, "t": $("#jishi").val()},
        dataType: "text",
        success: function (msg) {
            if (msg == "true") {
                verify = true;
            } else {
                alert("验证码错误!");
            }
        }
    });
    return verify;
}
function check_no() {
    var verify = false;
    jQuery.ajax({
        async: false,
        type: "post",
        url: "/info.fbxx/check_no",
        data: {"no": $("#no").val()},
        dataType: "text",
        success: function (msg) {
            if (msg == "0") {
                verify = true;
            } else {
                verify = confirm("有重复的招标编号存在，是否要提交当前记录？");
            }
        }
    });
    return verify;
}

function info_show() {
    //发布类型
    var verify = check_table_name2();
    if (verify)
        verify = check_title();
    if (verify)
        verify = check_enddate();
    if (verify)
        verify = check_category();
    if (verify)
        verify = check_area();
    if (verify)
        verify = check_cust();
    if (verify)
        verify = check_classa();
    //if(verify) verify = check_classb();
    //if(verify) verify = check_classc();
    if (verify)
        verify = check_stringa();
    if (verify)
        verify = check_stringb();
    if (verify)
        verify = check_stringc();
    if (verify)
        verify = check_stringd();
    if (verify)
        verify = check_inta();
    if (verify)
        verify = check_description();

    if (verify) {
        $("#fbxx_form").prop("action", "/info.fbxx/preview");
        $("#fbxx_form").prop("target", "_blank");
        $("#fbxx_form").submit();
    }
}

//保存
function info_submit() {
    //非空验证
    var verify = check_table_name2();
    if (verify)
        verify = check_title();
    if (verify)
        verify = check_enddate();
    if (verify)
        verify = check_category();
    if (verify)
        verify = check_area();
    if (verify)
        verify = check_cust();
    if (verify)
        verify = check_classa();
    if (verify)
        verify = check_classb();
    if (verify)
        verify = check_classc();
    if (verify)
        verify = check_stringa();
    if (verify)
        verify = check_stringb();
    if (verify)
        verify = check_stringc();
    if (verify)
        verify = check_stringd();
    if (verify)
        verify = check_inta();
    if (verify)
        verify = check_description();
    if (verify)
        verify = check_rand();
//    if (verify)
//        verify = check_no();

    if (verify) {
        $("#fbxx_form").prop("action", "/info.fbxx/save");
        $("#fbxx_form").prop("target", "_self");
        $("#fbxx_form").submit();
    }
}

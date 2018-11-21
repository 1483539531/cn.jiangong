//=======================================================================================
// JavaScript 公共类
// 韦梁邦
// 最后更新: 2004-06-15
//=======================================================================================


//=======================================================================================
// 系统操作
//=======================================================================================

//判断登陆状态
$(function () {
    var da = new Date();
    
    
    $.post('/cblcn/home/logincheck', 't:' + da.getTime(), function (member) {
        if (member != null && member != "" && member.login_id != "") {
            $(".user_name").html(member.login_id);
            $(".login_out").prop("href", "/cblcn/Home/logout2?sid=" + member.session_id + "&url=" + document.location.href + "&timestamp=" + new Date().getTime());// + "&url=" + document.location.href);

//            $(".dl_zc").hide();
//            if (member.cust_right_group == "0") {
//                $(".free_member").show();
//                $(".avatar").prop("src", "/public/cblcn/infoshow/images/img_xq/tx_mf_07.jpg");
//            } else {
//                $(".d_pj").addClass("liang");
//                if (member.cust_right_group == "1") {
//                    $(".free_member").show();
//                    $(".avatar").prop("src", "/public/cblcn/infoshow/images/img_xq/tx_pt_09.jpg");
//                }
//                if (member.cust_right_group == "2") {
//                    $(".free_member").show();
//                    $(".avatar").prop("src", "/public/cblcn/infoshow/images/img_xq/tx_bz_09.jpg");
//                }
//                if (member.cust_right_group == "3") {
//                    $(".fee_member").show();
//                    $(".avatar").prop("src", "/public/cblcn/infoshow/images/img_xq/tx_vip_09.jpg");
//                }
//            }

            $(".no_login").hide();
            $(".login_after").show();
        }
    }, 'json');
});



//获取当前路径
function getCurrPath() {
    var p = document.location.pathname;
    var ip = p.lastIndexOf("/");
    if (ip != -1 && ip < p.length) {
        p = p.substr(0, ip + 1);
    }
    return p;
}

//毫秒级延时
function delay(gap) {
    var then, now;
    then = new Date().getTime();
    now = then;
    while ((now - then) < gap) {
        now = new Date().getTime();
    }
}

//获取当前文档id 对象
function getObject(objName) {
    if (document.getElementById(objName) != null)
        return	document.getElementById(objName);
    else
        return	document.all[ objName ];
}


//=======================================================================================
// 字符串操作
//=======================================================================================

//分隔符，用于下拉选择框中，隔开所有的值，与后台JBS类对应
var G_FG = JS_FG = '○';

//去掉前后空格
function trim(oldStr) {
    return oldStr.replace(/^\s+/, '').replace(/\s+$/, '');
}

//去掉左边的空格
function ltrim(oldStr) {
    return	oldStr.replace(/^\s+/, '');
}

//去掉右边的空格
function rtrim(oldStr) {
    return	oldStr.replace(/\s+$/, '');
}

//去掉所有空格
function delSpace(oldStr) {
    return oldStr.replace(/[\s]+/g, '');
}

//去掉指定字符
function delChar(oldStr, Char) {
    var temp = "";
    oldStr = '' + oldStr;
    splitstring = oldStr.split(Char); //双引号之间是个空格；
    for (i = 0; i < splitstring.length; i++)
        temp += splitstring[i];
    return temp;
}

//获取字符串长度（一个汉字按两个字符）
function getCnLen(oldStr) {
    return oldStr.replace(/[^\x00-\xff]/g, "**").length;
}

//判断输入的字符串长度（一个汉字按两个字符）
//oldStr:数据 Strlength:长度
function strLenCheck(oldStr, Strlength, showErr) {
    var len = getCnLen(oldStr);
    if (len > Strlength) {
        if (showErr == true) {
            Alert("输入长度不能超过 " + len + "字符,目前为 " + Strlength + "字符,请重新输入");
        }
        return	false;
    }
    return	true;
}

//警告提示框, 长度大于0才弹出提示框
function Alert(oldStr) {
    if (oldStr.length > 0)
        alert(oldStr);
}

//不允许输入分号、单引号、双引号、逗号
//oldStr: 数据 flag	:是否允许字符串为空，1 可以为空	0 不能为空
function checkStrChar(oldStr, blank_flag, errormsg) {
    var i = 0;
    var chsymbol = "\"\',\;";
    var tempStr = oldStr;
    if ((tempStr == "") && (blank_flag == 0)) {
        Alert("" + errormsg + "");
        return false;
    }
    for (i = 0; i < tempStr.length; i++) {
        if (chsymbol.indexOf(tempStr.charAt(i)) >= 0) {
            Alert("" + errormsg + "");
            return	false;
        }
    }
    return true;
}

//功能介绍：检查字符串的长度必须在最小与最大长度之内
//OBJ 检测字段名，minLength	最小长度,最大长度，errormsg	错误信息
//返回值：true/false
function checkStrLenArea(oldStr, minLength, maxLength, errormsg) {
    var i, sum;
    sum = 0;
    var strTemp = oldStr;
    for (i = 0; i < strTemp.length; i++) {
        if ((strTemp.charCodeAt(i) >= 0) && (strTemp.charCodeAt(i) <= 255))
            sum = sum + 1;
        else
            sum = sum + 2;
    }
    if ((sum < minLength) || (sum > maxLength)) {
        Alert("" + errormsg + "");
        return false;
    }
    return true;
}

//=======================================================================================
// 数字操作
//=======================================================================================

//保留小数点精度(四舍五入)
//oldData：原数据  precision：保留小数位数
function numFixed(oldData, precision) {
    var t_str = oldData.toString();
    var a = t_str.indexOf(".");
    if (a >= 0) {
        var diff = t_str.length - (t_str.lastIndexOf(".") + 1);
        if (diff <= precision) {
            for (var i = 0; i < precision - diff; i++)
                t_str = t_str + "0";
        } else {
            t_str = t_str.substring(0, t_str.indexOf(".") + 1 + precision + 1);
            var lastNum = parseInt(t_str.substring(t_str.length - 1, t_str.length));
            t_str = t_str.substring(0, t_str.length - 1);
            if (lastNum >= 5) {
                var newData = parseInt(t_str.substring(0, t_str.indexOf(".")) + t_str.substring(t_str.indexOf(".") + 1, t_str.length));
                newData = newData + 1;
                t_str = newData.toString();
                t_str = t_str.substring(0, t_str.length - precision) + "." + t_str.substring(t_str.length - precision, t_str.length);
            }
        }
    } else {
        t_str = t_str + ".";
        for (var i = 0; i < precision; i++)
            t_str = t_str + "0";
    }
    return t_str;
}

//取一个浮点数的整数部分
function getZhengShu(v1) {
    var p1 = v1.indexOf(".");
    if (p1 == -1)
        p1 = v1.length;
    return v1.substr(0, p1);
}

//取一个浮点数的小数部分
function getXiaoShu(v1) {
    var p1 = v1.indexOf(".");
    if (p1 == -1)
        return "";
    return v1.substr(p1 + 1, v1.length - p1 - 1);
}

//无小数点正数值比较大小
function chkNumZhengShu(v1, v2) {
    var p1 = v1.length;
    var p2 = v2.length;
    if (p1 > p2)
        return 1;
    if (p1 < p2)
        return -1;
    if (v1 > v2)
        return 1;
    if (v1 < v2)
        return -1;
    return 0;
}

//无小数点小数比较大小
function chkNumXiaoShu(v1, v2) {
    var p1 = v1.length;
    var p2 = v2.length;
    var len = p1 - p2;
    if (len < 0)
        len = len * -1;
    var k = "";
    for (var i = 0; i < len; i++)
        k += " ";
    if (p1 > p2)
        v2 += k;
    if (p1 < p2)
        v1 += k;
    if (v1 > v2)
        return	1;
    if (v1 < v2)
        return	-1;
    return 0;
}

//判断是否为数字
//参数:	字符串数字
function isNumber(num) {

    if ((num == null) || (num.length == 0))
        return false;

    var n = trim("" + num);

    //判断另一种可能,像身份证,为18位的数字
    var ValidChars = "-0123456789.";
    var Char;
    var nd = 0;
    for (var i = 0; i < n.length; i++) {
        Char = n.charAt(i);
        if (ValidChars.indexOf(Char) == -1) {
            return false;
        }
        if (Char == '-' && i > 0)
            return false; //减号不在第一位
        if (Char == '.') {
            if (i == 0 || i == (n.length - 1))
                return	false;	//小数点在最前或者最后
            if (i > 0 && n.charAt(i - 1) == '-')
                return false;	//小数点紧跟在-号后面
            nd++;
        }
    }
    //小数点不唯一
    if (nd > 1)
        return	false;

    return true;
}

//比较两个数字v1,v2大小
function chkNumberMax(v1, v2) {
    if (!isNumber(v1) || !isNumber(v2))
        return 0;
    if (!isNumber(v2))
        return 1;
    if (!isNumber(v1))
        return -1;

    v1 = trim("" + v1);
    v2 = trim("" + v2);

    var f1 = v1.indexOf('-');
    var f2 = v2.indexOf('-');

    //正数大于负数
    if ((f1 == -1) && (f2 != -1))
        return 1;
    if ((f1 != -1) && (f2 == -1))
        return -1;

    v1 = v1.replace('-', '');
    v2 = v2.replace('-', '');

    //比较整数
    var a = chkNumZhengShu(getZhengShu(v1), getZhengShu(v2));
    if (a != 0) {
        if (f1 != -1)
            a = a * -1;	//结果取反
        return a;
    }

    //比较小数
    var b = chkNumXiaoShu(getXiaoShu(v1), getXiaoShu(v2));
    if (b != 0) {
        if (f1 != -1)
            b = b * -1;	//结果取反
        return b;
    }

    return 0;
}


//判断一个数字是否符合要求
//参数:	都以字符串形式传入
//		数字起始值,	数字终止值,	小数位数的最少位数,	小数位数的最多位数
//		如果传入""值,则对应的判断不起作用
//		例如传入的 min 为"", 则不判断数值的最小限制
//	1. checkNumber(	数字, "", "", 0, 0 );  判断是否整数, 小数位为0
//	2. checkNumber(	数字, "1", "250", 0, 2 ); 判断人的身高,	2位小数, 在1到250之间
//
//返回值: 返回""则表示正确,	否则返回错误信息

function checkNumber(num, min, max, pointLenMin, pointLenMax) {

    if (!isNumber(num)) {	//不是数字
        return "不是数字";
    }

    if (isNumber(min)) {	//最小值判断
        if (chkNumberMax(num, min) == -1) {
            return "数值必须大于等于 " + min;
        }
    }
    if (isNumber(max)) {	//最小值判断
        if (chkNumberMax(num, max) == 1) {
            return "数值必须小于等于 " + max;
        }
    }

    var pn = trim("" + num);
    var pLen = getXiaoShu(pn).length;

    if (isNumber(pointLenMin)) {	//最少小数位数判断
        if (pLen < parseFloat(pointLenMin)) {
            return "小数位数必须大于等于 " + pointLenMin;
        }
    }

    if (isNumber(pointLenMax)) {	//最大小数位数判断
        if (pLen > parseFloat(pointLenMax)) {
            return "小数位数必须小于等于 " + pointLenMax;
        }
    }

    return "";
}

//=======================================================================================
// FORM	操作
//=======================================================================================

//判断是否为EMAIL地址
function isEmail(aStr, aCanBeNull)
{
    if (isEmpty(aStr))
    {
        if (arguments.length > 1 && aCanBeNull == true)
            return true;
    } else
    {
        var lRegexp = /\w+@\w+\.([\w\.]+)*\w+/;
        var lMatchs = aStr.match(lRegexp);
        if (lMatchs == null || lMatchs.length == 0)
            return false;
        var lMatch = lMatchs[0];
        if (lMatch.length == aStr.length)
            return true;
    }
    return false;
}

//判断网址是否正确
function isHttpURL(aStr, aCanBeNull) {
    if (isEmpty(aStr)) {
        if (arguments.length > 1 && aCanBeNull == true)
            return true;
    } else {
        var lRegexp = /http:\/\/[\w\.\%\/\-]+(\?[\w\=\-\%]+)?/i;
        var lMatchs = aStr.match(lRegexp);
        if (lMatchs == null || lMatchs.length == 0)
            return false;
        var lMatch = lMatchs[0];
        if (lMatch.length == aStr.length)
            return true;
    }
    return false;
}

//屏蔽指定form内所有的输入修改
function disableForm(form_obj)
{
    if (document.all || document.getElementById) {

        for (var i = 0; i < form_obj.length; i++) {
            var eobj = form_obj.elements[i];
            //if( eobj.type == 'button' ) continue;

            if (eobj.type == 'select-one') {
                eobj.disabled = true;
            } else {
                if (eobj.length > 1) {
                    for (var j = 0; j < eobj.length; j ++)
                        eobj[j].disabled = true;
                } else {
                    eobj.disabled = true;
                }
            }
        }
    }
}

//隐藏页面按钮
function hideBtn(btn_name)
{
    var sc = "if( document.all." + btn_name + "	!= null	) document.all." + btn_name + ".style.display =	'none';";
    eval(sc);
}

//获取单选框用户选择的记录
function getRadioChoose(obj)
{
    var rid = "";
    if (obj != null) {
        if (obj.length > 1) {
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].checked) {
                    rid = obj[i].value;
                    break;
                }
            }
        } else {
            if (obj.checked)
                rid = obj.value;
        }
    }
    return rid;
}


//获取多选框用户选择的记录
//参数, 窗体元素对象,分隔符(单引,双引,无)
function getCheckBoxChoose(obj, split)
{
    var rid = "";
    if (obj != null) {
        if (obj.length > 1) {
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].checked) {
                    if (rid != "")
                        rid += ",";
                    rid += split + obj[i].value + split;
                }
            }
        } else {
            if (obj.checked)
                rid = split + obj.value + split;
        }
    }
    return rid;
}



//设置多选框选择的记录的状态
//参数, 窗体元素对象
//参数, type 
//		  = 'select_all'   全选
//		  = 'select_none'  全部取消
//	      = 'select_reverse'  反选
function setCheckBoxChoose(obj, type)
{
    type = "" + type;
    type = type.toLowerCase();
    var rid = "";
    if (obj != null) {
        if (obj.length > 1) {
            for (var i = 0; i < obj.length; i++) {
                if (type == 'select_all')
                    obj[i].checked = true;
                else
                if (type == 'select_none')
                    obj[i].checked = false;
                else
                if (type == 'select_reverse')
                    obj[i].checked = !obj[i].checked;
            }
        } else {
            if (type == 'select_all')
                obj.checked = true;
            else
            if (type == 'select_none')
                obj.checked = false;
            else
            if (type == 'select_reverse')
                obj.checked = !obj[i].checked;
        }
    }
    return rid;
}


function showChooseAllBtnEx(obj, btn) {
    if (btn.checked == true) {
        setCheckBoxChoose(obj, 'select_all');
    } else {
        setCheckBoxChoose(obj, 'select_none');
    }
}

//显示全选/取消全选按钮, 传入对象名称字符串
//显示反选按钮, 传入对象名称字符串
function showChooseAllBtn(objName) {
    var s = "全选<input type=checkbox onClick='showChooseAllBtnEx(" + objName + ", this)'>";
    s += "反选<input type=checkbox onClick='setCheckBoxChoose(" + objName + ", \"select_reverse\")'>";
    document.write(s);
}


//给页面控件赋值
function setVal(obj, val)
{
    if (val == null)
        val = '';
    if (obj != null)
        obj.value = val;
}


//=======================================================================================
// 窗口操作
//=======================================================================================

//必须在文档下载完成后才能够调用
//beforeBegin，afterBegin，beforeEnd，afterEnd
function insertHtml(position, html) {
    document.body.insertAdjacentHTML(position, html)
}

//获取程序的最终路径
//供对话框使用
function getRealPath(url) {
    //alert( url.toUpperCase() );
    if (url.indexOf("/") != 0 && url.toUpperCase().indexOf("HTTP://") != 0) {
        url = getCurrPath() + url;
    }

    return url;
}

/*
 * 打开非模式窗口,并等到该窗口关闭时才往下执行
 *
 * 子窗口如此获取父窗口中对象的值
 *	var	win	= window.dialogArguments;	//获取父窗口的句柄
 *	alert( "姓名是:	" +	win.document.all.name.value	); //获取表单的值
 *
 * 返回值: 子窗口关闭时,	依照下面方式设置返回值
 *
 *	window.returnValue = "张三峰";	//返回字符串
 * 或者
 *	window.returnValue = 13;	   //返回数值
 * 或者
 *	function Point() { 
 *		this.left=0; 
 *		this.top=0;	
 *		this.width=0;
 *		this.height=0;
 *	} 
 *	var	p =	new	Point();
 *	window.returnValue = p;		   //返回对象 
 * 设置完成后关闭窗口
 *	window.close();				   //关闭窗口
 */

function getWindow() {
    return window.opener;	//获取父窗口的句柄
}

function dlgOpen(aTitle, aUrl, status)
{
    //if(navigator.userAgent.indexOf("MSIE")>0) { 
    if (false) {
        var param = new Object;
        param.title = aTitle;
        param.url = getRealPath(aUrl);
        param.win = window;
        var lRetval = window.showModalDialog("/js/dialog.html", param, status);//是IE
    } else
    {
        var relUrl = getRealPath(aUrl);
        var lRetval = window.open(relUrl, aTitle, status);
        //下面注释代码为模拟模式对话框的
        /*		lRetval.onblur=function(){
         this.focus();
         this.opener.onclick=function(){lRetval.focus()};
         return false
         };
         lRetval.focus();
         */	}
    return lRetval;
}

function openWindow(title, url, left, top, width, height) {
    var re = "";
    var status = "";

    //指定 left, right,	width, height
    if (isNumber(left) && isNumber(top) && isNumber(width) && isNumber(height)) {
        //if(navigator.userAgent.indexOf("MSIE")>0) { 
        if (false) {
            //"MSIE"; 
            status = 'dialogTop: ' + top + 'px;	dialogLeft:	' + left + 'px;	dialogHeight: ' + height + 'px;	dialogWidth: ' + width + 'px; edge:	Raised;	center:	No;	help: No; resizable: Yes; status: Yes; ';
        } else
        {
            status = 'height=' + height + ',width=' + width + ',top=' + top + ',left=' + left + ', toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=yes';
        }
        re = dlgOpen(title, url, status);
    }
    //指定 left, right >> left 当 width, right 当 height 处理, 窗口居中显示
    else if (isNumber(left) && isNumber(top) && !isNumber(width) && !isNumber(height)) {
        width = left;
        height = top;
        if (width == -1 || height == -1) {
            width = document.body.clientWidth;
            height = document.body.clientHeight;
        }
        //if(navigator.userAgent.indexOf("MSIE")>0) { 
        if (false) {
            //"MSIE"; 
            status = 'dialogHeight:	' + height + 'px; dialogWidth: ' + width + 'px;	edge: Raised; center: Yes; help: No; resizable:	Yes; status: Yes; ';
        } else
        {
            status = 'height=' + height + ',width=' + width + ',top=' + 0 + ',left=' + 0 + ', toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=yes';
        }
        re = dlgOpen(title, url, status);
    }
    //没有指定	left, right, width,	height,	当全屏
    else {
        //alert("*****");
        width = screen.availWidth;
        height = screen.availHeight;
        //if(navigator.userAgent.indexOf("MSIE")>0) { 
        if (false) {
            //"MSIE"; 
            status = 'dialogHeight:	' + height + 'px; dialogWidth: ' + width + 'px;	edge: Raised; center: Yes; help: No; resizable:	Yes; status: Yes; ';
        } else
        {
            status = 'height=' + height + ',width=' + width + ',top=' + 0 + ',left=' + 0 + ', toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=yes';
        }
        re = dlgOpen(title, url, status);
    }

    return re;

}


//打开普通IE窗口
function openWin(aUrl, aWidth, aHeight)
{
    var xMax = screen.width, yMax = screen.height;
    var xOffset = (xMax - aWidth) / 2, yOffset = (yMax - aHeight) / 2;
    var win = window.open(aUrl, 'pub_001', 'status=yes, width=' + aWidth + ',height=' + aHeight + ',screenX=' + xOffset + ',screenY=' + yOffset + ', top=' + yOffset + ',left=' + xOffset + '');
    win.focus();
    return win;
}

//关闭窗口
function closeWindow() {
    location.href = '/sysmanage/right.htm';
    return	true;
}

//关闭父窗口
function closeParentWindow() {
    parent.location.href = '/sysmanage/right.htm';
    return true;
}

//刷新父窗口
function reloadParentWindow() {
    window.opener.location.reload();
    window.close();
    return	true;
}


//=======================================================================================
// 以下为JBS专用
//=======================================================================================

function jbs_isExist(obj) {
    if (obj == null) {
        alert("JBS	FORM 对象未定义");
        return false;
    }
    return true;
}

//提示框
function jbs_alert(obj, msg) {
    if (confirm(msg)) {
        obj.focus();
        obj.select();
    }
}

//检查非空
function jbs_form_notNull(obj) {
    if (!jbs_isExist(obj))
        return false;

    var f = true;

    switch (obj.type) {
        case "select-one":
        case "select-multiple":
            if (obj.options[ obj.selectedIndex ].value == '') {
                f = false;
                alert("下拉字段必须选择,不能为空");
            }
            break;
        case "checkbox":
        case "radio":
            break;
        default:
            if (obj.value == '') {
                f = false;
                jbs_alert(obj, "字段必须填写,不能为空");
            }
            break;
    }

    return f;

}


//判断一个数字是否符合要求
//参数:	都以字符串形式传入
//		数字起始值,	数字终止值,	小数位数的最少位数,	小数位数的最多位数,   allowNULL
//		如果传入""值,则对应的判断不起作用
//		例如传入的 min 为"", 则不判断数值的最小限制
//	1. checkNumber(	数字, "", "", 0, 0 );  判断是否整数, 小数位为0
//	2. checkNumber(	数字, "1", "250", 0, 2 ); 判断人的身高,	2位小数, 在1到250之间
//
//返回值: 返回""则表示正确,	否则返回错误信息
function jbs_form_checkNumber(obj, min, max, pointLenMin, pointLenMax, isNull) {
    if (!jbs_isExist(obj))
        return false;
    if (isNull == '1' && obj.value == '')
        return true;
    var s = checkNumber(obj.value, min, max, pointLenMin, pointLenMax);
    if (s != "") {
        jbs_alert(obj, s);
        return false;
    }
    return true;
}


//JS: 检查输入长度, 允许为空，如果要检查非空，使用非空事件
function jbs_form_checkValueLength(obj, len) {
    if (!jbs_isExist(obj))
        return false;
    if (isNumber(len)) {
        var l = getCnLen(obj.value);
        if (l > len) {
            jbs_alert(obj, "输入长度不能超过 " + len + "字符,目前为 " + l + "字符");
            return false;
        }
    }
    return true;
}


//JS: 检查输入长度, 允许为空，如果要检查非空，使用非空事件
function jbs_form_checkValueArea(obj, min, max) {
    if (!jbs_isExist(obj))
        return false;

    if (isNumber(min)) {
        var l = getCnLen(obj.value);
        if (l < min) {
            jbs_alert(obj, "输入长度不能小于 " + min + "字符,目前为 " + l + "字符");
            return false;
        }
    }

    if (!jbs_form_checkValueLength(obj, max))
        return false;	//检查长度

    return true;
}



//检查FORM元素
//例:
//if( ! jbs_check_form( document.form_main ) ) return false;
function jbs_check_form(form_obj)
{
    if (document.all || document.getElementById) {

        for (var i = 0; i < form_obj.length; i++) {
            var eobj = form_obj.elements[i];
            var n = trim(eobj.name);
            var tok;
            var js_code = "tok=window.JS_" + n + ";";
            eval(js_code);
            if (tok) {
                js_code = "tok=JS_" + n + "( document." + form_obj.name + "." + n + " );";
                eval(js_code);
                if (!tok)
                    return false;
            }
        }
    }
    return true;
}


//=======================================================================================
// 以上为JBS专用
//=======================================================================================



//=======================================================================================
// FORM校验专用
//=======================================================================================
//* Version Information (Only Available In IE5.5 Or Above Explorer Version)
//* Author: CuckooZ
//* 2002-05-23 Version 0.1
//* 2002-12-17 Version 0.2		Add verifyRule="PASSWORD"
//* 2002-12-20 Version 0.2.1	Add verifyRule="TIME"
//* 2002-12-28 Version 0.3      remove password notEmpty(surplus code)
//* 2002-12-28 Version 0.3.1	Bug fixed function isFDate() :nDay <= nMaxDay
//* 2003-01-08 Version 0.3.2    Add verifyRule="CURRENCY"

// 校验网页的输入值
// 对于一个网页的元素，可设置verifyRule, notEmpty, errorName, errorMsg, invalidOption五个属性。
// verifyRule = ["NUMBER", "EMAIL", "DATE", "TIME", "ID", "PASSWORD", "CURRENCY"], 
// 分别表示此元素的数值类型[数字, Email, 日期, 身份证号码, 密码类型, 金额类型]
// notEmpty, 设置了此标志，则此元素不允许为空。
// errorMsg 存在且有值的话，则显示errorMsg的出错信息，优先级最高；
// errorName 存在且有值的话，则显示errorName + sCommonMsg的出错信息，优先级其次；
// 上述两属性均不设置的话，则显示oField.name + sCommonMsg的出错信息，优先级最低。
// 一种可能的例子是：（在网页中有如下的一个表单元素）
//  <input type="text" name="EmployeeName" notEmpty errorName="员工姓名">
// 对此的校验是：输入一个非空的字符串，如果空的话，出错信息为上述errorName + sCommonMsg，即"员工姓名不能为空，请重新输入。"
//  <input type="text" name="IDCard" verifyRule="ID">
// 对此的检验是：当此项有输入时，输入值必须满足15位的数字或18位的(前17为数字,后1为数字或字母）ID号（即为身份证号）
//  <select name="select" notEmpty>
//    <option invalidOption>请选择</option>
//    <option value='1'>1</option>
//    <option value='2'>2</option>
//  </select>
// 对此的检验是：必须选择非"请选择"的项值。(invalidOption标志说明此项选择为提示性的，必须选择其它值)
// 对于成组的checkbox, radio，如果至少需要选择其一的话，则在同一组的第一个元素后加notEmpty。
// 2002-12-17
// <input type="password" name="newpwd" notEmpty verifyRule="PASSWORD">
// <input type="password" name="newpwd2" notEmpty>
// 对此的检验是：两次输入的密码必须不为空且必须一致。需要注意的是与之匹配的密码项必须是前者名称后＋“2”构成
// 2002-12-28
// 文件类型的校验：由于对文件类型实行新的css，因此文件控件本身被设置为不可见，而增加了一个文本域和一个按钮来代
// 替文件输入域的功能，因此要把对文件的focus()操作定位到对文本域的focus()，该文本域有一个规则就是其名称是文件域
// 的名称后＋Text构成
function VerifyInput(oFrm) {
    var oField;
    var i, j;
    var flag;
    for (i = 0; i < oFrm.elements.length; i++) {
        oField = oFrm.elements[i];
        // 检验notEmpty, 检验所有有此标志的输入项是否满足不为空的条件。
        if (!isUndefined(oField.notEmpty)) {
            switch (oField.type) {
                case "select-one":
                    if (oField.selectedIndex == 0 && !isUndefined(oField.options[0].invalidOption))
                        return VerifyInputErrorMsg(oField, "需要选择一个值!");
                    break;
                case "select-multiple":
                    flag = 0;
                    for (j = 0; j < oField.length; j++) {
                        if (oField.options[j].selected && isUndefined(oField.options[j].invalidOption)) {
                            flag = 1;
                            break;
                        }
                    }
                    if (flag == 0)
                        return VerifyInputErrorMsg(oField, "至少必须选择一个值!");
                    break;
                case "checkbox":
                case "radio":
                    flag = 0;
                    for (j = i; j < oFrm.elements.length; j++) {
                        if (oFrm.elements[j].name == oField.name && oFrm.elements[j].checked) {
                            flag = 1;
                            break;
                        }
                    }
                    if (flag == 0)
                        return VerifyInputErrorMsg(oField, "至少必须一个选项被选中!");
                    break;
                default:
                    if (isEmpty(oField.value))
                        return VerifyInputErrorMsg(oField, "不能为空，请重新输入。");
                    break;
            }
        }

        // 检验所有有输入值的是否满足verifyRule的规定。
        if (oField.verifyRule && !isEmpty(oField.value)) {
            switch (oField.verifyRule.toUpperCase()) {
                case "NUMBER":
                    if (isNaN(oField.value))
                        return VerifyInputErrorMsg(oField, "必须为数值，请重新输入。");
                    break;
                case "ID":
                    if (!isID(oField.value))
                        return VerifyInputErrorMsg(oField, "必须为15位(全数字)或18(17数字+1数字或字母)位的合法身份证号，请重新输入。");
                    break;
                case "EMAIL":
                    if (!isEmail(oField.value))
                        return VerifyInputErrorMsg(oField, "是一个如mymail@mailsvr.com类的电子邮箱，请重新输入。");
                    break;
                case "DATE":
                    if (!isFDate(oField.value))
                        return VerifyInputErrorMsg(oField, "是如2002/7/19或2002-7-19或2002.7.19类的且合法的日期类型，请重新输入。");
                    break;
                case "TIME":
                    if (!isTime(oField.value))
                        return VerifyInputErrorMsg(oField, "是如8:00或13:30之类的合法的时间，请重新输入。");
                    break;
                case "PASSWORD":
                    if (oFrm.elements.item(oField.name + "2").value != oField.value)
                        return VerifyInputErrorMsg(oField, "两次输入的密码必须一致，请重新输入。");
                    break;
                case "CURRENCY":
                    if (!isCurrency(oField.value))
                        return VerifyInputErrorMsg(oField, "是如3000.50或20.3之类的合法的金额数值，请重新输入。");
                    break;
                default:

            }
        }
    }
    return true;
}

// VerifyInput的子功能函数。
// if (oField.errorMsg) <=> if (oField.errorMsg被定义且不为空)
function VerifyInputErrorMsg(oField, sCommonMsg) {
    if (oField.errorMsg) {
        alert(oField.errorMsg);
    } else if (oField.errorName) {
        alert("<" + oField.errorName + ">" + sCommonMsg);
    } else {
        alert("<" + oField.name + ">" + sCommonMsg);
    }
    oField.focus();
    return false;
}

// 判断一个输入值是否 ""
function isEmpty(vInput) {
    var s_temp = "";
    var re = /(^\s*)|(\s*$)/g;
    s_temp = vInput.replace(re, "");
    if (s_temp.length == 0)
        return true;
    return false;
}

// 判断一个输入值是否 null, 一个变量定义后未赋值均会返回true值
function isNull(vInput) {
    if (vInput == null)
        return true;

    return false;
}

// 判断一个输入值是否 undefined, 一个变量定义后未赋值均会返回true值
function isUndefined(vInput) {
    if (vInput == undefined)
        return true;
    return false;
}

// 判断一个串是否是Email邮箱地址格式 (i.e. mymail@mailsvr.com)
function isEmail(sEmail) {
    return (sEmail.indexOf("@") > 0 && sEmail.indexOf("@") < sEmail.indexOf(".") - 1 && sEmail.indexOf(".") < sEmail.length - 1);
}

// 判断一个串是否是日期型格式 (i.e. 2002-9-19 || 2002/09/12 || 2002.9.12)
function isFDate(sDate) {
    var rg;
    var aResult;
    var nYear, nMonth, nDay;
    var nMinYear, nMaxYear, nMaxDay;
    rg = /^(\d{4})[-./](\d{1,2})[-./](\d{1,2})$/;
    aResult = sDate.match(rg);
    if (isNull(aResult))
        return false;
    nYear = parseInt(aResult[1]);
    nMonth = parseInt(aResult[2]);
    nDay = parseInt(aResult[3]);
    nMinYear = 1000;
    nMaxYear = 3000;
    switch (nMonth) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            nMaxDay = 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            nMaxDay = 30;
            break;
        case 2:
            if (nYear % 4 == 0 && nYear % 100 != 0 || nYear % 400 == 0)
                nMaxDay = 29;
            else
                nMaxDay = 28;
            break;
    }
    return (nYear > nMinYear && nYear < nMaxYear && nMonth > 0 && nMonth < 13 && nDay > 0 && nDay <= nMaxDay);
}

// 判断一个串或一个数字是否为合法的身份证号码。(共18位，前17位为数字，后1位可为字符)
function isID(nID) {
    if (nID.toString().length == 15 && !isNaN(nID) || nID.toString().length == 18 && !isNaN(nID.toString().substr(0, 17)))
        return true;
    return false;
}

// 判断一个串是否为小时数(如8:00, 12:30)
function isTime(sTime)
{
    var rg;
    var aResult;
    rg = /^(\d{1,2}):(\d{1,2})$/;
    aResult = sTime.match(rg);
    if (isNull(aResult))
        return false;
    var iHour = parseInt(aResult[1]);
    var iMinute = parseInt(aResult[2]);
    return (iHour >= 0 && iHour <= 24 && iMinute >= 0 && iMinute <= 60);
}

// 判断一个串是否为金额型，即30.00，50.20，5000之类的形式
function isCurrency(sCurrency)
{
    return (!isNaN(sCurrency) && (sCurrency.indexOf(".") == -1 || sCurrency.length - sCurrency.indexOf(".") <= 3));
}


//=======================================================================================
// FORM专用
//=======================================================================================


//获取url
function getUrl() {
    var h_url = location.href;
    path = "/zbw/login/login.jsp?url=" + h_url;
    //window.opener='anyone';
    //window.close();
    var obj = top.opener;
    if (typeof (obj) == "object" && !obj.closed)
    {
        obj.opener = null;
        obj.close();
    }
    //setTimeout(window.close(),100);
    //window.open (path, "登录", "top=0, left=0,toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes, location=yes, status=yes")
    //openWindow( "登录",path, 'top=0, left=0,toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes, location=yes, status=yes')
    location.href = path;
    return false;

}


/**任勇于10月22日加入f_check_date_between方法*/
function f_check_date_between(strDate1, strComment1, strDate2, strComment2, strComment3) {
    if (strDate1 == "")
    {
        alert(strComment1 + "不能为空");
        return false;
    }
    if (strDate2 == "")
    {
        alert(strComment2 + "不能为空");
        return false;
    }
    var arr_date1 = strDate1.split("-");
    var arr_date2 = strDate2.split("-");
    var date1 = new Date(parseInt(arr_date1[0]), parseInt(arr_date1[1], 10) - 1, parseInt(arr_date1[2], 10));
    var date2 = new Date(parseInt(arr_date2[0]), parseInt(arr_date2[1], 10) - 1, parseInt(arr_date2[2], 10));
    if (date1.getTime() - date2.getTime() > 0)
    {
        alert(strComment3);
        return false;
    }
    return true;

}

/**跳转页面*/
function gotopage(iShowInPage) {
    var pn = document.all.pagenum.value;
    if (isNaN(pn)) {
        alert('请输入一个数字!');
        document.all.pagenum.select();
        return false;
    } else if (pn < 1) {
        alert('请输入合法的页数!');
        return false;
    } else {
        var offset = iShowInPage * (pn - 1);
        var path = document.location.href;
        var len = path.indexOf('?');
        var str = '';
        if (len > -1) {
            str = path.substring(len + 1);
            path = path.substring(0, len);
        } else {
            path = path;
        }
        if (str != null) {
            len = str.indexOf("offset=");
            if (len >= 0) {
                var length = str.indexOf("&", len);
                str = str.substring(length + 1);
            }
        }
        location.href = path + "?offset=" + offset + "&" + str;
        return false;
    }
}

function login_out()
{

}

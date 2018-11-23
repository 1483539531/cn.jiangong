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

<div id="aa">asd</div>


<script>
    $("#aa").click(function () {
        $.ajax({
            "url" : "category",
            "type" : "GET",
            "dataType":"json",
            "data" : "parentId=0",
            "success" : function(data){
                alert(JSON.stringify(data))
            }
        })
    })

</script>



</body>

</html>
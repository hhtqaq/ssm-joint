<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/13
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            topage(2);
        });

        function topage(num){
            $.ajax({
                url: "${pageContext.request.contextPath}/list",
                data:"currentpage="+num,
                type: "get",
                dataType: "JSON",
                success: function (data) {
                    //表格信息
                    bulid_table(data);
                    //分页信息
                    bulidpage(data)
                    //分页条信息
                    bulidpagenav(data);
                }
            });
        }
        function bulid_table(data) {
            var users = data.map.pageInfo.list;
            $("#usertb tbody").empty();
            //使用jquery自带的each循环第一个参数为要循环的数组
            //第二个参事为循环之后的回调函数，第一个参数为索引，第二个为内容
            $.each(users, function (index, item) {
                var userid = $("<td></td>").append(item.id);
                var username = $("<td></td>").append(item.username);
                var password = $("<td></td>").append(item.password);
                var editbtn=$("<button></button>").addClass("btn btn-primary btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                var delbtn=$("<button></button>").addClass("btn btn-danger btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                var edittd=$("<td></td>").append(editbtn).append("   ").append(delbtn);
                $("<tr></tr>").append(userid).append(username).append(password).append(edittd)
                    .appendTo("#usertb tbody");
            })
        }
        //构建分页信息
        function bulidpage(data) {
            $("#pageinfo").empty();
            var pageinfo=$("#pageinfo");
            pageinfo.append("当前"+data.map.pageInfo.pageNum+"页，总"+data.map.pageInfo.pages+"页，总"+data.map.pageInfo.total+"记录数");
        }
        //构建分页条信息
        function bulidpagenav(data) {
            $("#pagenav").empty();
            var pagenav=$("#pagenav");
            var ul=$("<ul></ul>").addClass("pagination");

            var firstpage=$("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
            var lastpage=$("<li></li>").append($("<a></a>").attr("href","#").append("尾页"));
            var prepage=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;").attr("aria-hidden","true"))
                .attr("href","#").attr("aria-label","Previous"));
            var nextpage=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;").attr("aria-hidden","true"))
                .attr("href","#").attr("aria-label","Next"));
            //前一页后一页
            if(!data.map.pageInfo.hasPreviousPage){
                prepage.addClass("disabled");
            }else{
                //前一页的点击事件
                prepage.click(function () {
                    topage(data.map.pageInfo.pageNum-1);
                });
            }
            if(!data.map.pageInfo.hasNextPage){
                nextpage.addClass("disabled");
            }else{
                //后一页的点击事件
                nextpage.click(function () {
                    topage(data.map.pageInfo.pageNum+1);
                });
            }
            //首页点击事件
            firstpage.click(function () {
                topage(1);
            });
            //尾页点击事件
            lastpage.click(function () {
                topage(data.map.pageInfo.pages);
            });


            ul.append(firstpage).append(prepage);
            $.each(data.map.pageInfo.navigatepageNums,function (index,item) {
                var page=$(" <li></li>").append($("<a></a>").attr("href","#").append(item));
                if(data.map.pageInfo.pageNum==item){
                    page.addClass("active");
                }
                page.click(function () {
                    topage(item);
                });
            ul.append(page);
            });
            ul.append(nextpage).append(lastpage);
            var navel=$("<nav></nav>").append(ul);
            navel.appendTo(pagenav);
        }
    </script>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-condensed" id="usertb">
                <thead>
                <tr>
                    <td class="col-md-2">id</td>
                    <td class="col-md-3">姓名</td>
                    <td class="col-md-3">密码</td>
                    <td class="col-md-3">操作</td>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <div class="col-md-6" id="pageinfo"></div>
        <div class="col-md-6 col-md-offset-8" id="pagenav">
        </div>
    </div>
</div>
</body>
</html>

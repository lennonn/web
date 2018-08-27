<#noparse> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %></#noparse>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>文章类型</title>
    <link rel="stylesheet" href="<#noparse>${pageContext.request.contextPath}</#noparse>/css/bootstrap/table/bootstrap-table.css">

</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body>
<div class="row">
    <div class="col-md-12">
        <table id="${modelNameLowerCamel}"
               data-classes="table table-hover "
               data-search="true"
               data-show-refresh="true"
               data-show-toggle="true"
               data-show-columns="true"
               data-toolbar="#toolbar"></table>
        <div id="toolbar">
            <div class="btn-group">
                <button class="btn btn-block btn-info" data-toggle="modal" data-target="#modal-default">
                    <i class="fa fa-plus-square">添加</i>
                </button>
            </div>
        </div>
        <div class="modal fade" id="modal-default">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">添加文章</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <input type="hidden" name="id" id="_id" >
                            <#list tableInfo as item>
                                <#if item_index!=0>
                            <input class="form-control" id="${item.colName}" name="${item.colName}" placeholder="请输入${item.remark}"/>
                                </#if>
                            </#list>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="_save();">保存提交</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </div>
</div>
<script src="<#noparse>${pageContext.request.contextPath}</#noparse>/js/bootstrap/table/bootstrap-table.js"></script>
<script src="<#noparse>${pageContext.request.contextPath}</#noparse>/views/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>

<script type="text/javascript">

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#articleType').bootstrapTable({
                url: '<#noparse>${pageContext.request.contextPath}</#noparse>/${modelNameLowerCamel}/initTable',         //请求后台的URL（*）
                striped: true,  //表格显示条纹
                pagination: true, //启动分页
                toolbar: "#toolbar",                //工具按钮用哪个容器
                pageSize: 20,  //每页显示的记录数
                pageNumber: 1, //当前第几页
                pageList: [30, 40, 80],  //记录数可选列表
                search: true,  //是否启用查询
                showColumns: true,  //显示下拉框勾选要显示的列
                showRefresh: true,  //显示刷新按钮
                sidePagination: "server", //表示服务端请求
                //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
                //设置为limit可以获取limit, offset, search, sort, order
                queryParamsType: "undefined",
                queryParams: function queryParams(params) {   //设置查询参数
                    var param = {
                        pageNumber: params.pageNumber,
                        pageSize: params.pageSize,
                        queryString: $("#orderNum").val()
                    };
                    return param;
                },
                columns: [
                    {checkbox: true},
                    <#list tableInfo as item>
                        <#if item_index!=0>
                    {field: '${item.colName}', title: '${item.remark}', sortable: true},
                        </#if>
                    </#list>
                    {field: 'button', title: '操作', events: "operateEvents", formatter: operateFormatter}
                    ],
                onLoadSuccess: function () {  //加载成功时执行
                    // alert("加载成功");
                },
                onLoadError: function () {  //加载失败时执行
                    // alert("加载数据失败");
                }
            });
        };
        return oTableInit;
    };


    function operateFormatter(value, row, index) {
        return [
            '<button type="button" class="edit btn btn-info btn-xs" > <i class="fa fa-edit">编辑</i></button>',
            '<button type="button" class="delete btn btn-info btn-xs" > <i class="fa  fa-remove">删除</i></button>'
        ].join('');
    }

    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
            debugger;

            $("#tId").val(row.tId);
            $("#title").val(row.title);
            $("#_id").val(row.id);
            $("#scan").val(row.scan);
            CKEDITOR.instances.editor1.setData(row.content);
            $("#modal-default").modal('show');
        },
        'click .delete': function (e, value, row, index) {
            $.ajax({
                url:"<#noparse>${pageContext.request.contextPath}</#noparse>/article/delete?id="+row.id,
                type: "post",
                dataType: "json",
                success: function (res) {
                    $("#${modelNameLowerCamel}").bootstrapTable('refresh');//刷新ds_table的数据
                }
            });
        }
    };

    function _save() {
        var tId =$("#tId option:selected").val();
        var content = CKEDITOR.instances.editor1.getData();
        var title =$("#title").val();
        var data= {"tId":tId,"title":title,"content":content};
        var id =$("#_id").val();
        var scan =$("#scan").val();
        if(id!=""){
            data.id=id;
            data.scan =scan;
        }
        $.ajax({
            url:"<#noparse>${pageContext.request.contextPath}</#noparse>/article/save",
            type: "post",
            data:data,
            dataType: "json",
            success: function (res) {
                alert(res.msg);
                $("#modal-default").modal('toggle');
                $("#${modelNameLowerCamel}").bootstrapTable('refresh');//刷新ds_table的数据
                //window.location.href="<#noparse>${pageContext.request.contextPath}</#noparse>/article/list";
                // $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
            }
        });
    }
</script>
</body>
</html>

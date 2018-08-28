    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Pace Page</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet"  media="all" href="${pageContext.request.contextPath}/views/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
        folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/dist/css/skins/_all-skins.min.css">
        <!-- Pace style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/plugins/pace/pace.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- ztree-->
<%--
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ztree/demo.css" type="text/css">
--%>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ztree/metroStyle/metroStyle.css" type="text/css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ztree/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ztree/jquery.ztree.core.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ztree/jquery.ztree.excheck.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ztree/jquery.ztree.exedit.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ztree/menu.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/zlennon-pub.js"></script>
        <!-- /ztree-->
         <!--icon-->
            <link href="<%=request.getContextPath()%>/css/bootstrap/icons/icon-picker.min.css" rel="stylesheet" media="all" type="text/css" />
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/icons/iconPicker.min.js"></script>
        <!--/icon-->
        <!-- Google Font -->
        <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        </head>
        <body>
        <!-- Site wrapper -->

        <!-- Main content -->
        <section class="content">
        <div class="row">
        <div class="col-md-3">
        <!-- Horizontal Form -->
        <div class="box box-primary">
        <div class="box-header with-border">
        <h3 class="box-title">菜单树</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <ul id="treeDemo" class="ztree"></ul>
        </div>
        <!-- /.box -->
        <!-- /.box -->
        </div>

        <div class="col-md-9">
        <!-- Horizontal Form -->
        <div class="box box-info">
        <div class="box-header with-border">
        <h3 class="box-title">菜单操作</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form  id ="operMenu" class="form-horizontal" action="" method="post">
        <div class="box-body">
            <input type="hidden" class="form-control" name= "menuId" id="menuId" >
            <div class="form-group">
        <label for="parentName" class="col-sm-2 control-label">父级菜单</label>

        <div class="col-sm-10">
        <input type="text" disabled="disabled" class="form-control" name= "parentName" id="parentName" placeholder="父级菜单">
        <input type="hidden" class="form-control" name= "parentId" id="parentId" >

        </div>
        </div>
        <div class="form-group">
        <label for="menuName" class="col-sm-2 control-label">菜单名称</label>

        <div class="col-sm-10">
        <input type="text" class="form-control" name="menuName" id="menuName" placeholder="菜单名称">
        </div>
        </div>

        <div class="form-group">
        <label for="menuUrl" class="col-sm-2 control-label">菜单连接</label>

        <div class="col-sm-10">
        <input type="text" class="form-control" name="menuUrl" id="menuUrl" placeholder="菜单连接">
        </div>
        </div>

        <div class="form-group">
        <label for="menuIcon" class="col-sm-2 control-label">菜单图标</label>
            <div class="col-sm-10">
            <div class="input-group">
           <%-- <input type="text" class="form-control timepicker">--%>
            <input type="text" class="form-control" name= "menuIcon" id="menuIcon" placeholder="菜单图标">
            <div class="input-group-addon">
            <i class="fa fa-picture-o"></i>
            </div>
            </div>
            </div>
        </div>

        <div class="form-group">
        <label for="menuType" class="col-sm-2 control-label">菜单类型</label>

        <div class="col-sm-10">
        <input type="text" class="form-control" name="menuType" id="menuType" placeholder="菜单类型">
        </div>
        </div>

        <div class="form-group">
        <label for="menuOrder" class="col-sm-2 control-label">菜单排序码</label>

        <div class="col-sm-10">
        <input type="text" class="form-control" name="menuOrder" id="menuOrder" placeholder="菜单排序码">
        </div>
        </div>


        </div>
        <!-- /.box-body -->
        <div class="box-footer">
        <button type="button" class="btn btn-info pull-right" title="Ajax Request">
            新增或修改
        </button>
<%--
        <button type="input" class="btn btn-info pull-right" onclick="_submit('<%=request.getContextPath()%>/sysMenu/addMenu');">保存</button>
--%>
        </div>
        <!-- /.box-footer -->
        </form>
        </div>
        <!-- /.box -->
        </div>
        </div>
        <div class="ajax-content">
        </div>

        </section>
        <!-- /.content -->

        <!-- ./wrapper -->


        <script type="text/javascript">
    //从数据库查询菜单
        $(document).ajaxStart(function () {
            Pace.restart()
        })
        $('.pull-right').click(function () {
        $.ajax({
            url: '<%=request.getContextPath()%>/sysMenu/addMenu',
            dataType:"json",
            data:$("form").serialize(),
            type:"post",
            success: function (result) {
                alert(result.success);
                init(result.menuId);
        }
        })
        })
        </script>
        </body>
        </html>


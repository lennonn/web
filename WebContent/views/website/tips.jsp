<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body onload="timer">
<div class="callout callout-info">
    <div class="row">
        <div class="datetime_wp">今天是：<span id="timeDisplayed"></span></div>
        我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友。    </div>
</div>
<script type="text/javascript">

    function Refresh(){
        $("#timeDisplayed").text(new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay()));
        setTimeout("Refresh()",1000);
    }
    var timer=setTimeout("Refresh()",1000);
</script>
</body>
</html>


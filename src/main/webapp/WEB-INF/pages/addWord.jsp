<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--
  Created by IntelliJ IDEA.
  User: Casper
  Date: 12.01.2019
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style><%@include file="/WEB-INF/css/addWordStyles.css"%></style>
    <title>MyWordS - Your own vocabulary trainer</title>
</head>
<body>
<header>
    <div id="header">
        <div id="logo">
            <a href="${pageContext.request.contextPath}/" methods="get">MyWordS</a>
        </div>
        <div id="headerlink">
            <a id="addword" href="${pageContext.request.contextPath}/AddNewWord" methods="get">Add New Word</a>
        </div>
    </div>
</header>
<div class="page">
    <div id="content-wrapper">
        <div class="content">
            <div id="addform">
                <form action="${pageContext.request.contextPath}/AddNewWord" method="post">
                    <input type="text" id="word" name="word" placeholder="Word" required><br>
                    <input type="text" id="translate1" name="translate1" placeholder="Translate" required><br>
                    <input type="text" id="translate2" name="translate2" placeholder="Alternative translate" disabled><br>
                    <br>
                    <div id="submitContainer">
                        <input id="button" type="submit">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<footer>
    <div>ⒸNovik 2019
    </div>
</footer>
<script>
    function act(event){
        if(document.getElementById("translate1").value.length >= 1){
            document.getElementById("translate2").removeAttribute("disabled");
        }
    }
    document.getElementById("translate1").addEventListener("keyup", act);
</script>
<script>
    let x = ${resultOfSaving};
    if(x.resultOfSaving){
        alert(x.resultOfSaving);
    }
</script>
</body>
</html>
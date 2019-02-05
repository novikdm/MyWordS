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
    <style><%@include file="/WEB-INF/css/addWordStyles.css"%></style>
    <title>MyWordS - Your own vocabulary trainer</title>
</head>
<body>
<header>
    <div class="header">Profile</div>
    <div><a href="/" methods="get">MyWordS</a></div>
    <br>
    <div id="headerlink"><a id="addword" href="/AddNewWord" methods="get">Add New Word</a></div>
</header>
<hr>
<div id="addform">
    <form action="/AddNewWord" method="post">
        <input type="text" id="word" name="word" placeholder="Word" required><br>
        <input type="text" id="translate1" name="translate1" placeholder="Translate" required><br>
        <input type="text" id="translate2" name="translate2" placeholder="Alternative translate" disabled><br>
        <br>
        <div id="submitContainer">
            <input id="button" type="submit">
        </div>

    </form>
</div>

<script>
    function act(event){
        console.log(event);
        let x = document.getElementById("translate1").getAttribute('value');
        console.log(x);
        x = x===null ? event.key : x+event.key;
        document.getElementById("translate1").setAttribute('value', event.key);
        if(x.length >= 3){
            document.getElementById("translate2").removeAttribute("disabled");
        }
    }
    document.getElementById("translate1").addEventListener("keydown", act);
</script>
<script>
    let x = ${resultOfSaving};
    if(x.resultOfSaving){
        alert(x.resultOfSaving);
    }
</script>
</body>
</html>
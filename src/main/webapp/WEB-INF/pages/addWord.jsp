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
    <style>
        input {
            border : 1px solid lightgrey;
            margin: 1px;
            padding: 2px;
        }
        .header{
            width: 49%;
            float: left;
        }
        #headerlink{
            width: 110px;
            background: #fafafa;
        }
        a{
            display: block;
            text-decoration: none;
            width: 110px;
        }
        #addform {
            width: 200px;
            text-align: center;
            background: #fafafa;
        }
        #submitContainer {
            border: 0px;
            margin: 0;
        }
        #word, #translate1, #translate2 {
            height: 30px;
        }
        #translate2{

        }
    </style>
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
        document.getElementById("translate2").removeAttribute("disabled");
</script>
<script>
    let x = ${resultOfSaving};
    console.log(x);
</script>
</body>
</html>
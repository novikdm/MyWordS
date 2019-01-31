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
        #check {
            width: 200px;
            text-align: center;
            background: #fafafa;
        }
        #trueCounter, #falseCounter {
            width: 50%;
            border: 0px;
            margin: 0;
        }
        #trueCounter {
            float: left;
        }
        #falseCounter {
            float: right;
            text-align: right;
        }
        #checkedtext, #checkedtranslate {
            height: 30px;
        }
        #true, #false{
            width: 49%;
            height: 30px;
        }
        #true{
            float: left;
        }
        #false{
            float: right;
        }
    </style>
    <title>MyWordS - Your own vocabulary trainer</title>
</head>
<body>
<header>
    <div class="header">Profile</div>
    <div>MyWordS</div>
    <br>
    <div id="headerlink"><a id="addword" href="/AddNewWord" methods="get">Add New Word</a></div>
</header>
<hr>
<div class="page">
    <%--<div class="left_column">Left Column</div>--%>
    <%--<br><hr>--%>
    <div id="content-wrapper">
        <div class="content">
            <%--<form action="/check" method="post">--%>
            <%--<input type="text" name="word" value="${word.word}"><br>--%>
            <%--<input type="text" name="translate" value="${translate}"><br><br>--%>
            <%--<input type="submit"  value="true" name="true">--%>
            <%--<input type="submit"  value="false" name="false">--%>
            <%--</form>--%>
            <div id="check">
                <input type="text" id="trueCounter">
                <input type="text" id="falseCounter">
                <form action="/" method="get">
                    <input type="text" id="checkedtext"><br>
                    <input type="text" id="checkedtranslate"><br>
                    <br>
                    <div id="trueContainer">
                        <input id="true" type="button" value="True">
                    </div>
                    <div id="falseContainer">
                        <input id="false" type="button" value="False">
                    </div>
                </form>
            </div>
            <br>
            <hr>

            <div>
                <ul id="testList">

                </ul>
            </div>
        </div>
    </div>

</div>
<hr>
<footer>
    <div>(c) Novik</div>
    <div>2019</div>
</footer>
<script>
    let a = document.getElementById("content-wrapper");
    let b = ${checkedAnswer} == 1 ? 1 : ${checkedAnswer};
    if(typeof ${checkedAnswer} != "number"){
        if(b){
            a.style.background = "rgba(0, 160, 0, 0.1)";
        }
        else {
            a.style.background = "rgba(160, 0, 0, 0.1)";
        }
    }
    setTimeout( function(){ a.style.background = "transparent"} , 5);
</script>



<script>
    if(sessionStorage.getItem('True')==null && sessionStorage.getItem('false')==null){
        sessionStorage.setItem('True', '0');
        sessionStorage.setItem('False', '0');
    }
    sessionStorage.setItem('Step', '0');
    var arrayOfWords = ${arrayWord};
    let size = arrayOfWords.length;
    document.getElementById('trueCounter').setAttribute(
        'value',
        'True ' + sessionStorage.getItem('True')
    );
    document.getElementById("falseCounter").setAttribute(
        'value',
        sessionStorage.getItem('False') + ' False'
    );
    document.getElementById("checkedtext").setAttribute("value", arrayOfWords[0].word);
    document.getElementById("checkedtranslate").setAttribute("value", arrayOfWords[0].translateForCheck);
    //--------------------------------------------------------------------------
    //-------------------------------List For Tests after test need to delete-------------------------------------------
    for(let i=0; i<arrayOfWords.length ; i++){
        let li = document.createElement('li');
        li.textContent = "w: " + arrayOfWords[i].word + "; " + "t: " + arrayOfWords[i].translate1 + "; " + "ct: " + arrayOfWords[i].translateForCheck + "; ";
        document.getElementById("testList").appendChild(li);
    }
    //---------------------------------------------------------------------------
    document.getElementById("true").onclick = function(){
        let step = + sessionStorage.getItem('Step');
        if(step<size){
            changeSessionStorage(isCorrectTranslate(step));
            step++;
            sessionStorage.setItem('Step', step);
            changeInputs(step);
        }
        if(step===(size)){
            changeButton('true');
        }
    }
    document.getElementById("false").onclick = function(){
        let step = + sessionStorage.getItem('Step');
        if(step<size){
            changeSessionStorage(!isCorrectTranslate(step));
            step++;
            sessionStorage.setItem('Step', step);
            changeInputs(step);
        }
        if(step===(size)){
            changeButton('false');
        }
    }
    //-----------------------------------------------------------------------
    function changeButton(trueOrFalse) {
        let tr = document.getElementById(trueOrFalse);
        let el = document.createElement('input');
        let str = trueOrFalse==="true" ? 'True' : 'False';
        let id = trueOrFalse + "Container";
        el.setAttribute('type', 'submit');
        el.setAttribute('value',  str);
        el.setAttribute('id', trueOrFalse);
        document.getElementById(id).appendChild(el);
        tr.remove();
        el.click();
    }
    function changeSessionStorage(rezultOfCheck) {
        if(rezultOfCheck){
            let x = + sessionStorage.getItem('True');
            x++;
            sessionStorage.setItem('True', x);
            document.getElementById('trueCounter').setAttribute(
                'value',
                'True ' + sessionStorage.getItem('True')
            );
        }
        else{
            let x = + sessionStorage.getItem('False');
            x++;
            sessionStorage.setItem('False', x);
            document.getElementById("falseCounter").setAttribute(
                'value',
                sessionStorage.getItem('False') + ' False'
            );
        }
    }
    function isCorrectTranslate(step){
        let rezult = true;
        let translate1 = arrayOfWords[step].translate1;
        let translate2 = arrayOfWords[step].translate2;
        let translateForCheck = arrayOfWords[step].translateForCheck;
        console.log("123324rgjf")
        if(translate1 != translateForCheck && translate2 != translateForCheck) rezult = false;
        return rezult;
    }
    function changeInputs(step) {
        if(step !== size){
            getRandomTranslate(arrayOfWords[step]);
            document.getElementById("checkedtext").setAttribute("value", arrayOfWords[step].word);
            document.getElementById("checkedtranslate").setAttribute("value", arrayOfWords[step].translateForCheck);
        }
    }
    function getRandomTranslate(wordAndTranslate){
        let result = wordAndTranslate.translate1;
        let translate2 = wordAndTranslate.translate2;
        let x =  Math.random();
        if(translate2)
            if (x>0.5){
                result = translate2;
            }
        return result;
    }
</script>
    <hr>
    <footer>
        <div>(c) Novik</div>
        <div>2019</div>
    </footer>
    <script>
        let a = document.getElementById("content-wrapper");
        let b = ${checkedAnswer} == 1 ? 1 : ${checkedAnswer};
        if(typeof ${checkedAnswer} != "number"){
            if(b){
                a.style.background = "rgba(0, 160, 0, 0.1)";
            }
            else {
                a.style.background = "rgba(160, 0, 0, 0.1)";
            }
        }
    setTimeout( function(){ a.style.background = "transparent"} , 5);
    </script>



    <script>
        if(sessionStorage.getItem('True')==null && sessionStorage.getItem('false')==null){
            sessionStorage.setItem('True', '0');
            sessionStorage.setItem('False', '0');
        }
        sessionStorage.setItem('Step', '0');
        var arrayOfWords = ${arrayWord};
        let size = arrayOfWords.length;
        document.getElementById('trueCounter').setAttribute(
            'value',
            'True ' + sessionStorage.getItem('True')
        );
        document.getElementById("falseCounter").setAttribute(
            'value',
            sessionStorage.getItem('False') + ' False'
        );
        document.getElementById("checkedtext").setAttribute("value", arrayOfWords[0].word);
        document.getElementById("checkedtranslate").setAttribute("value", arrayOfWords[0].translateForCheck);

        //--------------------------------------------------------------------------

        //-------------------------------List For Tests after test need to delete-------------------------------------------
        for(let i=0; i<arrayOfWords.length ; i++){
            let li = document.createElement('li');
            li.textContent = "w: " + arrayOfWords[i].word + "; " + "t: " + arrayOfWords[i].translate1 + "; " + "ct: " + arrayOfWords[i].translateForCheck + "; ";
            document.getElementById("testList").appendChild(li);
        }


        //---------------------------------------------------------------------------

        document.getElementById("true").onclick = function(){
            let step = + sessionStorage.getItem('Step');
            if(step<size){
                step++;
                sessionStorage.setItem('Step', step);
                changeInputs(step);
            }
            if(step===(size)){
                changeButton('true');
            }
        }
        document.getElementById("false").onclick = function(){
            let step = + sessionStorage.getItem('Step');
            if(step<size){
                changeSessionStorage(!isCorrectTranslate(step));
                step++;
                sessionStorage.setItem('Step', step);
                changeInputs(step);
            }
            if(step===(size)){
                changeButton('false');
            }
        }

        //-----------------------------------------------------------------------

        function changeButton(trueOrFalse) {
            let tr = document.getElementById(trueOrFalse);
            let el = document.createElement('input');
            let str = trueOrFalse==="true" ? 'True' : 'False';
            let id = trueOrFalse + "Container";
            el.setAttribute('type', 'submit');
            el.setAttribute('value',  str);
            el.setAttribute('id', trueOrFalse);
            document.getElementById(id).appendChild(el);
            tr.remove();
            el.click();
        }

        function changeSessionStorage(rezultOfCheck) {
            if(rezultOfCheck){
                let x = + sessionStorage.getItem('True');
                x++;
                sessionStorage.setItem('True', x);
                document.getElementById('trueCounter').setAttribute(
                    'value',
                    'True ' + sessionStorage.getItem('True')
                );
            }
            else{
                let x = + sessionStorage.getItem('False');
                x++;
                sessionStorage.setItem('False', x);
                document.getElementById("falseCounter").setAttribute(
                    'value',
                    sessionStorage.getItem('False') + ' False'
                );
            }
        }

        function isCorrectTranslate(step){
            let rezult = true;
            let translate1 = arrayOfWords[step].translate1;
            let translate2 = arrayOfWords[step].translate2;
            let translateForCheck = arrayOfWords[step].translateForCheck;
            if(translate1 != translateForCheck && translate2 != translateForCheck) rezult = false;
            return rezult;
        }

        function changeInputs(step) {
            if(step !== size){
                getRandomTranslate(arrayOfWords[step]);
                document.getElementById("checkedtext").setAttribute("value", arrayOfWords[step].word);
                document.getElementById("checkedtranslate").setAttribute("value", arrayOfWords[step].translateForCheck);
            }
        }

        function getRandomTranslate(wordAndTranslate){
            let result = wordAndTranslate.translate1;
            let translate2 = wordAndTranslate.translate2;
            let x =  Math.random();
            if(translate2)
                if (x>0.5){
                    result = translate2;
                }
            return result;
        }
    </script>
</body>
</html>
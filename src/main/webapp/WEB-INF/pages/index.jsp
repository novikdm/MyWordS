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
    <%--<c:set var="context" value="${pageContext.request.contextPath}" />--%>
    <%--<link rel="stylesheet" type="text/css" href="${context}/css/styles.css"/>--%>
    <style><%@include file="/WEB-INF/css/indexStyles.css"%></style>
    <title>MyWordS - Your own vocabulary trainer</title>
</head>
<body>
<header>
    <div id="header">
        <div id="logo">
            <a href="/" methods="get">MyWordS</a>
        </div>
        <div id="headerlink">
            <a id="addword" href="/AddNewWord" methods="get">Add New Word</a>
        </div>
    </div>
</header>
<div class="page">
    <div id="content-wrapper">
        <div class="content">
            <div id="check">
                <input type="text" id="trueCounter" readonly>
                <input type="text" id="falseCounter" readonly>
                <form action="/" method="get">
                    <input type="text" id="checkedtext" readonly><br>
                    <input type="text" id="checkedtranslate" readonly><br>
                    <div id="trueContainer">
                        <input id="true" type="button" value="True">
                    </div>
                    <div id="falseContainer">
                        <input id="false" type="button" value="False">
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
    changeWidth()
    document.getElementById("checkedtext").setAttribute("value", arrayOfWords[0].word);
    document.getElementById("checkedtranslate").setAttribute("value", arrayOfWords[0].translateForCheck);
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
        changeWidth();
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
        changeWidth();
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
    function changeWidth() {
        let trueCount = + sessionStorage.getItem('True');
        let falseCount = + sessionStorage.getItem('False');
        let trueWidthPercent;
        let falseWidthPercent;
        if(trueCount !== 0 && falseCount !== 0){
            let hundredPercent = trueCount + falseCount;
            trueWidthPercent = ((trueCount*100)/hundredPercent).toFixed();
            falseWidthPercent = 100 - trueWidthPercent;
        }
        else{
            trueWidthPercent = 50;
            falseWidthPercent = 50;
        }
        document.getElementById('trueCounter').style.width = trueWidthPercent+"%";
        document.getElementById('falseCounter').style.width = falseWidthPercent+"%";
    }
</script>
</body>
</html>
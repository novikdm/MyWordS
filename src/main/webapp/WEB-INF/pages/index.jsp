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
        <div>Profile</div>
        <div>MyWordS</div>
        <div>
            <form>
                <button>Login</button>
                <button>Sign Up</button>
            </form>
        </div>
    </header>
    <hr>
    <div class="page">
        <div class="left_column">Left Column</div>
        <br><hr>
        <div id="content-wrapper">
        <div class="content">
            <form action="/check" method="post">
                <input type="text" name="word" value="${word.word}"><br>
                <input type="text" name="translate" value="${translate}"><br><br>
                <input type="submit"  value="true" name="true">
                <input type="submit"  value="false" name="false">
            </form>
            <%--<hr>--%>
            <%--<form action="/addNewWord" method="post">--%>
                <%--<input type="text" name="nword"><br>--%>
                <%--<input type="submit">--%>
            <%--</form>--%>
            <hr>
            <br>
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
                    <%--<button id="true" >True</button>--%>
                    <%--<button id="false">False</button>--%>
                </form>
            </div>
            <br>
            <hr>

            <div>

                <ul>
                    <c:forEach items="${listOfWords}" var="x">
                        <li>${x.getWord()} + ${x.getTranslate1()} + ${x.getTranslateForCheck()}</li>
                    </c:forEach>
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
    setTimeout( function(){ a.style.background = "transparent"} , 1);
    </script>



    <script>

        if(sessionStorage.getItem('True')==null && sessionStorage.getItem('false')==null){
            sessionStorage.setItem('True', '0');
            sessionStorage.setItem('False', '0');
        }
        sessionStorage.setItem('Step', '0');
        let size = ${listOfWords.size()};
        document.getElementById('trueCounter').setAttribute(
            'value',
            'True ' + sessionStorage.getItem('True')
        );
        document.getElementById("falseCounter").setAttribute(
            'value',
            sessionStorage.getItem('False') + ' False'
        );



        <%--<c:forEach items="${listOfWords}" var="x">--%>
            <%--Window.sessionStorage.setItem(i, );--%>
        <%--${x.getWord().getWord()};--%>
        <%--${x.getWord().getTranslate1()} ;--%>
        <%--${x.getTranslateForCheck()};--%>
        <%--</c:forEach>--%>
        // function check(){
        //
        // }

        //-----------------------------


        document.getElementById("true").onclick = function(){
            let i = + sessionStorage.getItem('Step');
            if(i<size){
                <%--console.log("---1---");--%>
                <%--console.log(${listOfWords.get(i).getWord().getTranslate1()});--%>
                <%--let rightTranslate = ${listOfWords.get(i).getWord().getTranslate1()};--%>
                <%--console.log(rightTranslate);--%>
                <%--let checkedTranslate = ${listOfWords.get(i).getTranslateForCheck()};--%>
                <%--console.log("---2---");--%>

                let trigger = Math.random()>0.5 ? true : false;

                changeSessionStorage(trigger);
                i++;
                sessionStorage.setItem('Step', i);
            }
            if(i===(size)){
                changeButton('true');
            }
            document.getElementById("checkedtext").setAttribute('value', ${listOfWords.get(i).getWord()});
        }


        //-----------------------------------

        <%--console.log(--%>
            <%--JSON.stringify(--%>
                <%--{--%>
                    <%--${listOfWords.get(0)}--%>
                <%--}--%>
            <%--)--%>
        <%--);--%>
        <%--let str = String(${listOfWords.get(0).getTranslateForCheck()});--%>
        <%--console.log(str);--%>
        <%--let obj = {--%>
            <%--'word' : ${listOfWords.get(0).getWord().getWord()},--%>
            <%--'translates' : [--%>
                <%--${listOfWords.get(0).getWord().getTranslate1()},--%>
                <%--${listOfWords.get(0).getWord().getTranslate2()},--%>
            <%--],--%>
            <%--'checkTranslate' : ${listOfWords.get(0).getTranslateForCheck()}--%>
        <%--};--%>
        <%--console.log(obj);--%>

        <%--document.getElementById("true").onclick = function(){--%>
            <%--let i = + sessionStorage.getItem('Step');--%>
            <%--console.log("i= " + i);--%>
            <%--if(i<size){--%>
                <%--console.log("---1---");--%>
                <%--console.log(${listOfWords.get(i).getWord().getTranslate1()});--%>
                <%--let rightTranslate = ${listOfWords.get(i).getWord().getTranslate1()};--%>
                <%--console.log(rightTranslate);--%>
                <%--let checkedTranslate = ${listOfWords.get(i).getTranslateForCheck()};--%>
                <%--console.log("---2---");--%>
                <%--if(rightTranslate === checkedTranslate){--%>
                    <%--console.log("---3---");--%>
                    <%--let x = + sessionStorage.getItem('True');--%>
                    <%--x++;--%>
                    <%--x += "";--%>
                    <%--sessionStorage.setItem('True', x);--%>
                <%--}--%>
                <%--else{ console.log("---4---");--%>
                    <%--let x = + sessionStorage.getItem('False');--%>
                    <%--x++;--%>
                    <%--x += "";--%>
                    <%--sessionStorage.setItem('False', x);--%>
                <%--}--%>
                <%--console.log("---5---");--%>
                <%--i++;--%>
                <%--i += i--%>
                <%--sessionStorage.setItem('Step', i);--%>
            <%--}--%>
        <%--}--%>
        <%--document.getElementById("false").onclick = function(){--%>
            <%--let i = + sessionStorage.getItem('Step');--%>
            <%--if(i<size){--%>
                <%--let rightTranslate = ${listOfWords.get(i).getWord().getTranslate1()};--%>
                <%--let checkedTranslate = ${listOfWords.get(i).getTranslateForCheck()};--%>
                <%--if(rightTranslate != checkedTranslate){--%>
                    <%--let x = + sessionStorage.getItem('True');--%>
                    <%--x++;--%>
                    <%--x += "";--%>
                    <%--sessionStorage.setItem('True', x);--%>
                <%--}--%>
                <%--else{--%>
                    <%--let x = + sessionStorage.getItem('False');--%>
                    <%--x++;--%>
                    <%--x += "";--%>
                    <%--sessionStorage.setItem('False', x);--%>
                <%--}--%>
                <%--i++;--%>
                <%--i += i--%>
                <%--sessionStorage.setItem('Step', i);--%>
            <%--}--%>
        <%--}--%>

        function changeButton(trueOrFalse) {
            let tr = document.getElementById(trueOrFalse);
            let el = document.createElement('input');
            let str = trueOrFalse==="true" ? 'True' : 'False';
            let id = trueOrFalse + "Container";
            el.setAttribute('type', 'submit');
            el.setAttribute('value',  str);
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
    </script>
</body>
</html>

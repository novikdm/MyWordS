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
            <div class="check">
                <form action="/" method="get">
                    <input type="text" id="checkedtext"><br>
                    <input type="text" id="checkedtranslate"><br>
                    <br>
                    <button id="true">True</button>
                    <button id="false">False</button>
                </form>


            </div>
            <hr>

            <div>

                <ul>
                    <c:forEach items="${listOfWords}" var="x">
                        <li>${x.getWord().getWord()} + ${x.getWord().getTranslate1()} + ${x.getTranslateForCheck()}</li>
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
        // console.log(b);
        if(b){

            a.style.background = "rgba(0, 160, 0, 0.1)";
            // a.style.backg
        }
        else {
            a.style.background = "rgba(160, 0, 0, 0.1)";
        }
    }
    // a.style.background = "none";
    setTimeout( function(){ a.style.background = "transparent"} , 1);

</script>
    <script>
        Window.sessionStorage.setItem('True', '0');
        Window.sessionStorage.setItem('False', '0');
        Window.sessionStorage.setItem('Step', '0');
        let size = ${listOfWords.size()};

        <%--<c:forEach items="${listOfWords}" var="x">--%>

            <%--Window.sessionStorage.setItem(i, );--%>



        <%--${x.getWord().getWord()};--%>
        <%--${x.getWord().getTranslate1()} ;--%>
        <%--${x.getTranslateForCheck()};--%>
        <%--</c:forEach>--%>

        // function check(){
        //
        // }
        document.getElementById("true").onclick = function(){
            let i = + Window.sessionStorage.getItem('Step');
            if(i<size){
                let rightTranslate = ${listOfWords.get(i).getWord().getTranslate1()};
                let checkedTranslate = ${listOfWords.get(i).getTranslateForCheck()};
                if(rightTranslate === checkedTranslate){
                    let x = + Window.sessionStorage.getItem('True');
                    x++;
                    x += "";
                    Window.sessionStorage.setItem('True', x);
                }
                else{
                    let x = + Window.sessionStorage.getItem('False');
                    x++;
                    x += "";
                    Window.sessionStorage.setItem('False', x);
                }
                i++;
                i += i
                Window.sessionStorage.setItem('Step', i);
            }
        }
        document.getElementById("false").onclick = function(){
            let i = + Window.sessionStorage.getItem('Step');
            if(i<size){
                let rightTranslate = ${listOfWords.get(i).getWord().getTranslate1()};
                let checkedTranslate = ${listOfWords.get(i).getTranslateForCheck()};
                if(rightTranslate != checkedTranslate){
                    let x = + Window.sessionStorage.getItem('True');
                    x++;
                    x += "";
                    Window.sessionStorage.setItem('True', x);
                }
                else{
                    let x = + Window.sessionStorage.getItem('False');
                    x++;
                    x += "";
                    Window.sessionStorage.setItem('False', x);
                }
                i++;
                i += i
                Window.sessionStorage.setItem('Step', i);
            }
        }
    </script>
</body>
</html>

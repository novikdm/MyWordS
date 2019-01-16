<%--
  Created by IntelliJ IDEA.
  User: Casper
  Date: 12.01.2019
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
                <input type="text" name="word"><br>
                <input type="text" name="translate"><br><br>
                <input type="submit" placeholder="True" value="true" name="true">
                <input type="submit" placeholder="False" value="false" name="false">
            </form>
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
</body>
</html>

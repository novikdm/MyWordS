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
        <div class="content">
            <form action="/check" method="post">
                <input type="text" name="word"><br><br>
                <input type="submit" placeholder="True" value="true" name="true">
                <input type="submit" placeholder="False" value="false" name="false">
            </form>
        </div>
    </div>
    <hr>
    <footer>
        <div>(c) Novik</div>
        <div>2019</div>
    </footer>

</body>
</html>

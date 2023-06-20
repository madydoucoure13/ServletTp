<%--
  Created by IntelliJ IDEA.
  User: douc.mady
  Date: 15/06/2023
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<div class="container">
<!-- Pills content -->
<div class="tab-content">
    <div class="" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
        <form action="login" method="post">
            <p class="text-center">Veuillez remplir</p>

            <!-- Email input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="loginName">Email</label>
                <input type="email" name="email" required id="loginName" class="form-control" />
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="loginPassword">Mot de passe</label>
                <input type="password" name="mdp" required id="loginPassword" class="form-control" />
            </div>

            <!-- Submit button -->
            <button type="submit" name="login" class="btn btn-primary btn-block mb-4">Se connecter</button>

            <!-- Register buttons-->
            <div class="text-center">
                <p>Pas de compte? <a href="inscrire.jsp">S'inscrire</a></p>
            </div>
        </form>
    </div>

</div>
<!-- Pills content -->

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>

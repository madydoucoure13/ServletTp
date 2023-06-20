<%--
  Created by IntelliJ IDEA.
  User: douc.mady
  Date: 15/06/2023
  Time: 11:27
  To change this template use File | Settings | File Templates.

  nom, prénom, pseudo, email, mot de passe et la répétition du mot de passe.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    if(session.getAttribute("user_name") != null){
        response.sendRedirect("index.jsp");
    }

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
        <div class="" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
            <form method="post" action="login">
               <p class="text-center">Veuillez vous remplir les champs ci-dessous</p>

                <!-- Name input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="registerNameP">Prénom</label>
                    <input type="text" required id="registerNameP" name="prenom" value="Mady" class="form-control" />

                </div>
                <!-- Name input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="registerName">Nom</label>
                    <input type="text" required id="registerName" name="nom" value="Doucoure" class="form-control" />

                </div>
                <!-- Username input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="registerUsername">Pseudo</label>
                    <input type="text" required id="registerUsername" name="pseudo" value="doucoure13" required class="form-control" />
                </div>

                <!-- Email input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="registerEmail">Email</label>
                    <input type="email" id="registerEmail" name="email" value="doucoure13@gmail.com" required class="form-control" />

                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="registerPassword">Mot de passe</label>
                    <input type="password" required id="registerPassword" name="mdp" value="12345" class="form-control" />

                </div>

                <!-- Repeat Password input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="registerRepeatPassword">Confirmez le mot de passe</label>
                    <input type="password" id="registerRepeatPassword" name="mdpr" VALUE="12345" required class="form-control" />

                </div>
                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-center mb-4">
                    <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
                           aria-describedby="registerCheckHelpText" />
                    <label class="form-check-label" for="registerCheck">
                        J'ai lu et j'accepte les terms et contrats
                    </label>
                </div>

                <!-- Submit button -->
                <button type="submit" name="register" class="btn btn-primary btn-block mb-3">S'inscrire</button>
            </form>
        </div>
    </div>
    <!-- Pills content -->
    <!-- Register buttons-->
    <div class="text-center">
        <p>Se connecter? <a href="login.jsp">Se connecter</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>
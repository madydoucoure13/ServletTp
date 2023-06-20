<%@ page import="com.doucouremady.servletjsp.Personnes" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.doucouremady.servletjsp.Database" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
   HttpSession sessions = request.getSession();
    Database database = new Database();
    //request.getA
    if(sessions.getAttribute("user_name") == null){
        response.sendRedirect("login.jsp");
    }
    List<Personnes> users = (ArrayList<Personnes>)  database.ListUtilisateur();

%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
            <span class="fs-4">ServletJSP</span>
        </a>


        <div class="col-md-3 text-end">
            <a href="login.jsp" type="button" class="btn btn-primary">Se déconnecter</a>
        </div>
    </header>
</div>
<div class="container">

<h2>Bonjour: <%= sessions.getAttribute("user_name")%></h2>
<br/>
<h3 id="active-tables">Liste de Utilisateurs Inscrits<a class="anchorjs-link " aria-label="Anchor" data-anchorjs-icon="#" href="" style="padding-left: 0.375em;"></a></h3>
<table class="table  table-success table-striped">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Nom</th>
        <th scope="col">Prénom</th>
        <th scope="col">Email</th>
    </tr>
    </thead>
    <tbody>
  
    <% int i = 1; for(Personnes us : users){ %>
    <tr>
        <th scope="row"><%=i++%></th>
        <td><% out.print(us.getNom()) ;%></td>
        <td><% out.print(us.getPrenom()) ;%></td>
        <td><% out.print(us.getEmail()) ;%></td>
    </tr>
    <%} %>
    </tbody>
</table>

</div>
</body>
</html>
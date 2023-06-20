package com.doucouremady.servletjsp;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.crypto.Data;

//@WebServlet(name = "helloServlet", value = "login")
public class Monservlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

      /* public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
     this.getServletContext().getRequestDispatcher("/login.jsp").forward(request,
                response);

    }*/

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doPost(req, resp);
        HttpSession session = req.getSession();
        Database database = new Database();

        String prenom, nom, pseudo, email, mdp, mdpr;
        if(req.getParameter("register") != null){
            prenom = req.getParameter("prenom");
            nom = req.getParameter("nom");
            pseudo = req.getParameter("pseudo");
            email = req.getParameter("email");
            mdp = req.getParameter("mdp");
            mdpr = req.getParameter("mdpr");
            database.CreerUtilisateur(prenom,nom,pseudo,email,mdp);
            System.out.println(prenom+"_"+nom+"_"+pseudo+"_"+email);
            //req.getRequestDispatcher("").forward(req,resp);
            resp.sendRedirect("index.jsp");
            session.setAttribute("user_prenom",prenom);
            session.setAttribute("user_name",nom);

        } else if (req.getParameter("login") != null) {
            email = req.getParameter("email");
            mdp = req.getParameter("mdp");
            session.setAttribute("user_name",email);
           // session.setAttribute("mdp",email);
            resp.sendRedirect("index.jsp");
            System.out.println(email+"_"+mdp);
            System.out.println("Voici la resultat "+database.login(email,mdp));
        }


    }

    public void destroy() {
    }
}
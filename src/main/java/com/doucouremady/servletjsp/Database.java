package com.doucouremady.servletjsp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {

    public Connection connection;


    //	Methode permettant d'etablir la connection avec la base de donnée
    public void InitialiseConnection() {

        //		Chargement de la librairie mysql connector

        try {
            //Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");

        }catch (Exception e) {
            System.out.println(e.getMessage());
        }

//		connexion avec la base de données

        try {
            this.connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/users_servlet", "root", "");

        }catch (Exception e) {
            System.out.println(e.getMessage());
        }


    }

//	La méthode permettant de créer un utlisateur

    public void CreerUtilisateur(String prenom,String nom,String pseudo,String email,String mdp) {

        this.InitialiseConnection();
//		variable requette qui envoyera la requette
        try {
            PreparedStatement requette = this.connection.prepareStatement("INSERT INTO inscrits(nom, prenom,pseudo,email,mdp) VALUES(?, ?,?,?,?);");
            requette.setString(1,prenom);
            requette.setString(2,nom);
            requette.setString(3, pseudo);
            requette.setString(4, email);
            requette.setString(5, mdp);

            requette.executeUpdate();

        }catch (Exception e) {
            System.out.println(e.getMessage());
        }


//		Personnes user = new Personnes();
//
//
//
//		return user;
    }


//	Méthode permettant de retouner la liste des utilisateurs

    public List<Personnes> ListUtilisateur(){

//		Declaration d'une liste qui recevra la liste
        List<Personnes> utilisateurs = new ArrayList<Personnes>();

//		Deux variable requette qui envoyera la requette et resultat qui la recevra

        Statement requette=null;
        ResultSet resultat=null;

//		se connecter à la base de données

        this.InitialiseConnection();

        try {
            requette = this.connection.createStatement();
//			execution de la requette
            resultat = requette.executeQuery("Select nom,prenom,email FROM inscrits;");

//			recuperation des resultats un à un
            while(resultat.next()) {
                Personnes user = new Personnes();
                user.setNom(resultat.getString("nom"));
                user.setPrenom(resultat.getString("prenom"));
                user.setEmail(resultat.getString("email"));
                utilisateurs.add(user);
            }

        }catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
//			A la fin de la requette on vas ferme la connection

            try {
                if(resultat!=null) {
                    resultat.close();
                }
                if(requette!=null) {
                    requette.close();
                }
                if(this.connection!=null) {
                    this.connection.close();
                }

            }catch (Exception e) {
                System.out.println(e.getMessage());
            }


        }

        return utilisateurs;
    }




    //Verification si l'utilisateur est déjà inscrire
    public boolean existe(String pseudo,String password) {


        //creation d'une varable user de type boolean pour verifier si

        boolean user = false;

        //reconnecte la base de données
        this.InitialiseConnection();
        try {
            PreparedStatement requette = this.connection.prepareStatement("SELECT * FROM inscrits WHERE pseudo = ? and password = ?;");

            requette.setString(1, pseudo);
            requette.setString(2, password);
            ResultSet result = requette.executeQuery();
            user = result.next();


        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return user;


    }

    //	methode pour la connection d'un utilisateur
    public String login(String pseudo,String password) {

//		creation d'un utilisateur qui sera retouner
       // Personnes user = null;


//		Deux variable requette qui envoyera la requette et resultat qui la recevra

        this.InitialiseConnection();

        try {

            PreparedStatement requette = this.connection.prepareStatement("SELECT * FROM personnes WHERE pseudo = ? and password = ?;");

            requette.setString(1, pseudo);
            requette.setString(2, password);

            ResultSet result = requette.executeQuery();

            if (result.next()) {
                return "true";
            }

            result.close();
            requette.close();

        }catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "false";
    }


}

package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "movie", value = "/movie")
public class movie extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] movieDetails = new String[7];
        int movieId=1;


        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        PrintWriter out = response.getWriter();


        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb", "root", "");
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT name,description,release_date,genre,rating,duration,url FROM movies WHERE id='"+movieId+"'");

            while (resultSet.next()) {
                movieDetails[0] = resultSet.getString(1);
                movieDetails[1] = resultSet.getString(2);
                movieDetails[2] = resultSet.getString(3);
                movieDetails[3] = resultSet.getString(4);
                movieDetails[4] = resultSet.getString(5);
                movieDetails[5] = resultSet.getString(6);
                movieDetails[6] = resultSet.getString(7);
            }
        }
        catch (Exception e){
            throw new RuntimeException(e);
        }

        for(String x : movieDetails){
            out.print(x);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

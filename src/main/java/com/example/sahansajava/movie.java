package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "movie", value = "/movie")
public class movie extends HttpServlet {
    String movieId;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("mId")!=null) {
            movieId = request.getParameter("mId").replaceAll("'","");
        }

        System.out.println(movieId);

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        PrintWriter out = response.getWriter();


        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb", "root", "");
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT name,description,release_date,genre,rating,duration,url,ticket_price FROM movies WHERE name='"+movieId+"'");

            List<String> list = new ArrayList<>();

            while (resultSet.next()) {
                list.add(resultSet.getString(1));
                list.add(resultSet.getString(2));
                list.add(resultSet.getString(3));
                list.add(resultSet.getString(4));
                list.add(resultSet.getString(5));
                list.add(resultSet.getString(6));
                list.add(resultSet.getString(7));
                list.add(resultSet.getString(8));
            }


            String jsonArrRes = new JSONArray(list).toString();

            System.out.println(jsonArrRes);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArrRes);

            resultSet.close();
            statement.close();
            connection.close();
        }
        catch (Exception e){
            throw new RuntimeException(e);
        }

//        for(String x : movieDetails){
//            out.print(x);
//        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

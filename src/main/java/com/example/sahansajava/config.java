package com.example.sahansajava;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "config", value = "/config")
public class config extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int lCount = 0, tCount = 0, nCount = 0;
        String[][] LDetails = new String[6][3];
        String[][] TDetails = new String[6][3];
        String[][] NDetails = new String[18][3];

        Connection connection = null;
        Statement statementL = null;
        Statement statementT = null;
        Statement statementN = null;
        ResultSet resultSetL = null;
        ResultSet resultSetT = null;
        ResultSet resultSetN = null;
        PrintWriter out = response.getWriter();


        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb", "root", "");
            statementL = connection.createStatement();
            statementT = connection.createStatement();
            statementN = connection.createStatement();
            resultSetL = statementL.executeQuery("SELECT name,YEAR(release_date),img_path FROM movies WHERE id IN(SELECT id FROM latest_movies ) ORDER BY release_date DESC");
            resultSetT = statementT.executeQuery("SELECT name,YEAR(release_date),img_path FROM movies WHERE id IN(SELECT id FROM upcoming_movies)");
            resultSetN = statementN.executeQuery("SELECT name,YEAR(release_date),img_path FROM movies WHERE id IN(SELECT id FROM now_showing)");


            while (resultSetL.next()) {
                LDetails[lCount][0] = resultSetL.getString(1);
                LDetails[lCount][1] = resultSetL.getString(2);
                LDetails[lCount][2] = resultSetL.getString(3);
                lCount++;
            }
            while (resultSetT.next()) {
                TDetails[tCount][0] = resultSetT.getString(1);
                TDetails[tCount][1] = resultSetT.getString(2);
                TDetails[tCount][2] = resultSetT.getString(3);
                tCount++;
            }
            while (resultSetN.next()) {
                NDetails[nCount][0] = resultSetN.getString(1);
                NDetails[nCount][1] = resultSetN.getString(2);
                NDetails[nCount][2] = resultSetN.getString(3);
                nCount++;
            }

            System.out.println(LDetails[0][0]+" "+LDetails[0][1]+" "+LDetails[0][2]);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        request.setAttribute("LmDetails", LDetails);
        request.setAttribute("TmDetails", TDetails);
        request.setAttribute("NmDetails", NDetails);
        request.setAttribute("LatestPanelCount", lCount);
        request.setAttribute("TrendingPanelCount", tCount);
        request.setAttribute("NowShowingPanelCount", nCount);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void destroy() {
    }
}

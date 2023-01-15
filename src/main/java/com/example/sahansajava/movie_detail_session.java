package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "movie_detail_session", value = "/movie_detail_session")
public class movie_detail_session extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if(session != null) {

            String MTitle = request.getParameter("movie_title");
            String MPrice = request.getParameter("movie_price");

            session.setAttribute("Movie_name",MTitle);
            session.setAttribute("Movie_price",MPrice);

            RequestDispatcher dispatcher = request.getRequestDispatcher("tselector.jsp");
            dispatcher.forward(request, response);
        } else {

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}

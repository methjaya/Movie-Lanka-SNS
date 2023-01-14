package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "seats_session", value = "/seats_session")
public class seats_session extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the seats in the session
        String Sel_Seats = request.getParameter("seats");

        HttpSession session = request.getSession();

        session.setAttribute("Seats",Sel_Seats);
    }
}

package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "tselect_session", value = "/tselect_session")
public class tselect_session extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Get the Selected Date, Time and Theatre.
        String S_Date = request.getParameter("SelectedDate");
        String S_Time = request.getParameter("SelectedTime");
        String T_Name = request.getParameter("SelectedTheatre");

        HttpSession session = request.getSession();

        session.setAttribute("Date",S_Date);
        session.setAttribute("Time",S_Time);
        session.setAttribute("Name",T_Name);
    }
}

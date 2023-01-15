package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "remove_records", value = "/remove_records")
public class remove_records extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String Selected_Theatre = (String) session.getAttribute("Name");
        String Invoice_No = (String) session.getAttribute("Invoice_Number");

        dbcon_booking objbooking = new dbcon_booking();
        SMTP_Gmail sendMail = new SMTP_Gmail();

        if(objbooking.Cancel_Booking(Invoice_No,Selected_Theatre))
        {
            // Clear Session
            session.invalidate();

            // Email User

            // Redirect to the home page
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            // Send Mail
            sendMail.SendGMail("nethun223@gmail.com","Take immediate action !","Remove  : "+Invoice_No+"");

            // Email User

            // Clear Session
            session.invalidate();

            // Redirect to the home page
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}

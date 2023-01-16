package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "contact_us", value = "/contact_us")
public class contact_us extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String F_Name = request.getParameter("name");
        String Mail = request.getParameter("email");
        String Msg = request.getParameter("message");

        SMTP_Gmail sendmail = new SMTP_Gmail();
        String Body = String.format("Name : %s\nEmail : %s\nFeedBack :\n\n %s",F_Name,Mail,Msg);

        try
        {
            sendmail.SendGMail("voice.meth@gmail.com","Customer FeedBack !",Body);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception ex)
        {
            log(String.valueOf(ex));
        }
    }
}

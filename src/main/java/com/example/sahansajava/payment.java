package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "payment", value = "/payment")
public class payment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Fname = request.getParameter("Fname");
        String Lname = request.getParameter("Lname");
        String NIC = request.getParameter("NIC");
        String U_Email = request.getParameter("Email");
        String Invoice_no = request.getParameter("INvoize");

        HttpSession session = request.getSession();

        String Selected_Date = (String) session.getAttribute("Date");
        String Selected_Time = (String) session.getAttribute("Time");
        String Selected_Theatre = (String) session.getAttribute("Name");
        String Movie_Name = "Harry Potter And The Deathly Hallows: Part 1";

        String Time_Date = String.format("2023-%s %s:00",Selected_Date,Selected_Time);
        List<String> Seats = new ArrayList<>();

        dbcon_booking objbooking = new dbcon_booking();

        boolean MainCheck = false;
        boolean PermLock = true;
        boolean PermUnlock = true;

        int Payment_Status = Integer.parseInt(request.getParameter("PStatus"));

        if(session.getAttribute("Seats") != null)
        {
            String Seat_String = session.getAttribute("Seats").toString();
            Seats = Arrays.asList(Seat_String.split(","));
            MainCheck = true;
        }else
        {
            log("Seats Session Lost - booking");
        }

        if(Payment_Status == 0 && MainCheck)
        {
            for(String seat : Seats)
            {
                if(!objbooking.PermLock(Selected_Theatre, Movie_Name, Time_Date, seat, Fname, Lname, NIC, Invoice_no))
                {
                    PermLock = false;
                    break;
                }
            }

            if(!PermLock)
            {
                for(String seat : Seats)
                {
                    if(!objbooking.TempUnHold(Selected_Theatre,Movie_Name,Time_Date,seat))
                    {
                        PermUnlock = false;
                        break;
                    }
                }

                // Send a mail to the developer
            }
            else
            {
                // Successfully
                RequestDispatcher dispatcher = request.getRequestDispatcher("final.jsp");
                dispatcher.forward(request, response);
            }
        }

        else if (Payment_Status == 1)
        {
            for(String seat : Seats)
            {
                if(!objbooking.TempUnHold(Selected_Theatre,Movie_Name,Time_Date,seat))
                {
                    break;
                }
            }

            // If fails Send a mail to the developer

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }

        else if (Payment_Status == 2)
        {
            for(String seat : Seats)
            {
                if(!objbooking.TempUnHold(Selected_Theatre,Movie_Name,Time_Date,seat))
                {
                    break;
                }
            }

            // If fails Send a mail to the developer

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}

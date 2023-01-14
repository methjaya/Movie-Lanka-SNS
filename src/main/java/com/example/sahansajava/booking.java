package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.io.IOException;

@WebServlet(name = "booking", value = "/booking")
public class booking extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Get the Seat Numbers
        HttpSession session = request.getSession();

        String Selected_Date = (String) session.getAttribute("Date");
        String Selected_Time = (String) session.getAttribute("Time");
        String Selected_Theatre = (String) session.getAttribute("Name");
        String Movie_Name = "Harry Potter And The Deathly Hallows: Part 1";

        String Time_Date = String.format("2023-%s %s:00",Selected_Date,Selected_Time);
        List<String> Seats = new ArrayList<>();
        dbcon_booking objbooking = new dbcon_booking();

        boolean MainCheck = false;
        boolean AvailabilityCheck = true;
        boolean Temp_Hold_Check = true;

        if (session != null)
        {
            if(session.getAttribute("Seats") != null)
            {
                String Seat_String = session.getAttribute("Seats").toString();
                Seats = Arrays.asList(Seat_String.split(","));
                MainCheck = true;
            }else
            {
                log("Seats Session Lost - booking");
            }
        }
        else
        {
            log("Session Lost - booking");
        }

        // Booking Process

        if(MainCheck)
        {
            // Check Seat Availability
            for(String seat : Seats)
            {
                if(!objbooking.CheckSelected(Selected_Theatre,Movie_Name,Time_Date,seat))
                {
                    AvailabilityCheck = false;
                    break;
                }
            }

            if(AvailabilityCheck)
            {
                // Temporary hold the selected seats
                for(String seat : Seats)
                {
                    if(!objbooking.TempHold(Selected_Theatre,Movie_Name,Time_Date,seat))
                    {
                        Temp_Hold_Check = false;
                        break;
                    }
                }

                if(Temp_Hold_Check)
                {
                    // Redirect to the payment page
                    RequestDispatcher disptacher = request.getRequestDispatcher("payment.jsp");
                    disptacher.include(request,response);
                }
                else
                {
                    // Undo the temporary holds in case of an error
                    for(String seat : Seats)
                    {
                        if(!objbooking.TempUnHold(Selected_Theatre,Movie_Name,Time_Date,seat))
                        {
                            // Email the developers.
                            String Error_Seats = String.join(",",Seats);
                            break;
                        }
                    }

                    // Redirect back to seat selection
                    RequestDispatcher disptacher = request.getRequestDispatcher("seatsel.js");
                    disptacher.include(request,response);
                }
            }
            else
            {
                log("Un-available");

                // Redirect back to seat selection
                RequestDispatcher disptacher = request.getRequestDispatcher("seatsel.js");
                disptacher.include(request,response);
            }
        }
    }
}

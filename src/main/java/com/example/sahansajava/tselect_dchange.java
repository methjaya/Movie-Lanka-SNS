package com.example.sahansajava;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@WebServlet(name = "tselect_dchange", value = "/tselect_dchange")
public class tselect_dchange extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dbcon_booking objbooking = new dbcon_booking();
        String Selected_Date = request.getParameter("selectedDate");
        String Formatted_Date = "2023-"+Selected_Date;

        ConcurrentMap<String, List<String>> Theatre_Details = new ConcurrentHashMap<>();
        Theatre_Details =  objbooking.Load_Times(Formatted_Date);
        StringBuilder Time_Cont = new StringBuilder();

        for (Map.Entry<String, List<String>> theatre : Theatre_Details.entrySet()) {
            String name = theatre.getKey();
            List<String> times = theatre.getValue();

            Time_Cont.append("<div class=\"ttselector-theatre\">");
            Time_Cont.append("<span class=\"T-name\">"+name+"</span>");
            Time_Cont.append("<hr>");
            Time_Cont.append("<div class=\"t-available-times\">");

            for(String time : times){
                String[] t_split = time.split(":");
                String Formatted_Time = t_split[0] + ":" + t_split[1];
                Time_Cont.append("<div class=\"time\">"+Formatted_Time+"</div>");
            }

            Time_Cont.append("</div>");
            Time_Cont.append("</div>");
        }

        response.getWriter().write(Time_Cont.toString());
    }
}

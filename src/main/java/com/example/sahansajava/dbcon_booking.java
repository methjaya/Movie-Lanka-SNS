package com.example.sahansajava;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import static java.lang.System.out;
public class dbcon_booking {
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;


    public List<String> Load_Dates(){
        List<String> Available_Dates = new ArrayList<>();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "SELECT dates FROM theatre_timeschedule WHERE movie_name = 'movie1'";

            rs = st.executeQuery(Query);

            while (rs.next())
            {
                String m_date = rs.getString("dates").toString();

                if(!Available_Dates.contains(m_date)){
                    Available_Dates.add(m_date);
                }
            }
        }
        catch (Exception e)
        {
            out.print(e);
        }

        return Available_Dates;
    }

    public ConcurrentMap<String, List<String>> Load_Times(String Selected_Date){

        ConcurrentMap<String, List<String>> TD = new ConcurrentHashMap<>();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "SELECT theatre_name,time FROM theatre_timeschedule WHERE movie_name = 'movie1' AND dates = '"+Selected_Date+"'";

            rs = st.executeQuery(Query);

            while (rs.next())
            {
                //Append Or Create New Values
                TD.computeIfAbsent(rs.getString("theatre_name"),k-> new ArrayList<>()).add(rs.getString("time").toString());
            }
        }
        catch (Exception e)
        {
            out.println(e);
        }

        return TD;
    }

    public Map<String, String> Load_Theatre_Layout(String T_Name){
        Map<String, String> Theatre_Seat_Layout = new HashMap<>();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "SELECT s_tot,s_divide,s_perrow FROM `theatre_details` WHERE tname = '"+T_Name+"'";

            rs = st.executeQuery(Query);

            while (rs.next())
            {
                // Get Theatre Details
                Theatre_Seat_Layout.put("Seats",rs.getString("s_tot").toString());
                Theatre_Seat_Layout.put("Divide",rs.getString("s_divide").toString());
                Theatre_Seat_Layout.put("prow",rs.getString("s_perrow").toString());
            }
        }
        catch (Exception e)
        {
            out.println(e);
        }
        return Theatre_Seat_Layout;
    }

    public Map<String, String> Set_SeatStatus(String T_Name, String M_Name, String T_D)
    {
        Map<String, String> Seat_Status = new HashMap<>();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "SELECT seat_no,lock_unlock FROM `"+T_Name+"_seats` WHERE movie = '"+M_Name+"' AND timedate = '"+T_D+"'";


            rs = st.executeQuery(Query);

            while (rs.next())
            {
                // Get Seat Status
                Seat_Status.put(rs.getString("seat_no"),rs.getString("lock_unlock").toString());
            }
        }
        catch (Exception e)
        {
            out.println(e);
        }

        return Seat_Status;
    }

    public boolean CheckSelected(String Theatre_Name, String Movie_Name, String T_D, String S_N)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "SELECT lock_unlock FROM "+Theatre_Name+"_seats WHERE movie = '"+Movie_Name+"' AND timedate = '"+T_D+"' AND seat_no = '"+S_N+"'";

            rs = st.executeQuery(Query);

            if (rs.next())
            {
                // Check selected seats availability
                return false;
            }
        }
        catch (Exception e)
        {
            out.println(e);
        }

        return true;
    }
    public boolean TempHold(String Theatre_Name, String Movie_Name, String T_D, String S_N)
    {
        // If available Temporary hold (0)
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "INSERT INTO "+Theatre_Name+"_seats(seat_no,movie,timedate,lock_unlock) VALUES('"+S_N+"','"+Movie_Name+"','"+T_D+"',0)";
            st.executeUpdate(Query);
        }
        catch (Exception e)
        {
            out.println(e);
            return false;
        }

        return true;
    }

    public boolean TempUnHold(String Theatre_Name, String Movie_Name, String T_D, String S_N)
    {
        // Delete Entries
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "DELETE FROM "+Theatre_Name+"_seats WHERE seat_no = '"+S_N+"' AND movie = '"+Movie_Name+"' AND timedate = '"+T_D+"'";
            st.executeUpdate(Query);
        }
        catch (Exception e)
        {
            out.println(e);
            return false;
        }

        return true;
    }

    public boolean PermLock(String Theatre_Name, String Movie_Name, String T_D, String S_N, String F_name, String L_name, String NIC_N, String Receipt_N)
    {
        // Permanent  lock
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            st = con.createStatement();

            String Query = "UPDATE "+Theatre_Name+"_seats SET lock_unlock = 1 , fname = '"+F_name+"' , lname = '"+L_name+"' , nic = '"+NIC_N+"' , receipt_no = "+Receipt_N+" WHERE seat_no = '"+S_N+"' AND movie = '"+Movie_Name+"' AND timedate = '"+T_D+"'";
            st.executeUpdate(Query);
        }
        catch (Exception e)
        {
            out.println(e);
            return false;
        }

        return true;
    }
}

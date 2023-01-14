//package com.example.sahansajava;
//
//import jakarta.mail.*;
//import jakarta.mail.internet.InternetAddress;
//import jakarta.mail.internet.MimeMessage;
//
//import java.util.Properties;
//
//public class SMTP_Gmail {
//    public int SendGMail(String To, String Subject, String Body) {
//
//        final String username = "snsmovietickets@gmail.com";
//        final String password = "aucwoczzmdzdwpph";
//
//        Properties prop = new Properties();
//        prop.put("mail.smtp.host", "smtp.gmail.com");
//        prop.put("mail.smtp.port", "465");
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.socketFactory.port", "465");
//        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//
//        Session session = Session.getInstance(prop,
//                new jakarta.mail.Authenticator() {
//                    protected PasswordAuthentication getPasswordAuthentication() {
//                        return new PasswordAuthentication(username, password);
//                    }
//                });
//
//        try {
//
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress("rsmtmanagement@gmail.com"));
//            message.setRecipients(
//                    Message.RecipientType.TO,
//                    InternetAddress.parse(To)
//            );
//            message.setSubject(Subject);
//            message.setText(Body);
//
//            Transport.send(message);
//            return 1;
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//            return 0;
//
//        }
//    }
//}

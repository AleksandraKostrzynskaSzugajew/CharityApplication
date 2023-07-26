package pl.coderslab.charity.email;

public interface EmailService {

    String sendMail(String to, String subject, String body);
}

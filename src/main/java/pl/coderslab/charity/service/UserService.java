package pl.coderslab.charity.service;

import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.email.EmailServiceImpl;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.security.RegistrationService;

import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    private final RoleService roleService;

    private final EmailServiceImpl emailService;
    private final JavaMailSender javaMailSender;
    private final RegistrationService registrationService;

//    private final Logger logger = LoggerFactory.getLogger(UserService.class);

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder, RoleService roleService, EmailServiceImpl emailService, JavaMailSender javaMailSender, RegistrationService registrationService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
        this.emailService = emailService;
        this.javaMailSender = javaMailSender;
        this.registrationService = registrationService;
    }


    public void save(User user) {
        user.setRole(roleService.findByName("ROLE_USER"));
        String newPass = passwordEncoder.encode(user.getPassword());
        user.setPassword(newPass);
        userRepository.save(user);
    }

    public Long findByEmail(String email) {
        Optional<User> user = userRepository.findByEmail(email);
        if (user.isPresent()) {
            return user.get().getId();
        } else {
            return -1L;
        }
    }

    public Long getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName(); // Assuming the userId is stored as the username
        Long userId = findByEmail(email);
        return userId;
    }

    public User findById(Long id) {
        return userRepository.findById(id).get();
    }


    public void edit(User user) {
        userRepository.save(user);
    }

    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    public void blockUser(Long id) {
        User user = findById(id);
        user.setEnabled(false);
    }

    public void unblockUser(long id) {

        User user = findById(id);
        user.setEnabled(true);
    }

    @Async
    public void sendActivationEmail(User user) {
        String activationLink = createActivationLink(user.getUniqueToken());
        SimpleMailMessage message = new SimpleMailMessage();
        String subject = "Witaj w CharityApp! Aktywuj swoje konto juz teraz!";
        String to = user.getEmail();
        String body = String.format(
                        "%s , witamy w CharityApp! Jesteśmy bardzo zadowoleni, że do nas dołączyłeś. Zacznij oddawać " +
                        "rzeczy już dzisiaj!\n\n" +
                        "Aby aktywować swoje konto, kliknij proszę w poniższy link aktywacyjny:\n" +
                        "%s"+"\n"+
                        "Dziękujemy za zaufanie i dołączenie do naszej społeczności. Jeśli masz jakiekolwiek pytania, nie wahaj się skontaktować z nami.\n\n" +
                        "\n" +
                        "Zespół CharityApp",
                user.getName(), activationLink
        );


        message.setText(body);
        message.setTo(to);
        message.setSubject(subject);

        javaMailSender.send(message);
    }

    public String createActivationLink(String token) {
        String baseUrl = "http://localhost:8080"; // Zmienic na rzeczywisty adres URL swojej aplikacji na serwerze produkcyjnym
        String activationEndpoint = "/home/activate";

        return baseUrl + activationEndpoint + "?token=" + token;
    }

    public String createResetPasswordLink(String token) {

        String baseUrl = "http://localhost:8080"; // Zmienic na rzeczywisty adres URL swojej aplikacji na serwerze produkcyjnym
        String activationEndpoint = "/home/resetpassfm";

        return baseUrl + activationEndpoint + "?token=" + token;
    }

    public User findByUniqueToken(String token) {
        return userRepository.findByUniqueToken(token);
    }

    public User findByResetToken(String token) {
        return userRepository.findByResetToken(token);
    }

    public String resetPass(String email) {
        // Inicjalizacja loggera dla klasy, w której znajduje się metoda.


        Long userId = findByEmail(email);
        User user = findById(userId);
        if (user != null) {
            String token = registrationService.generateUniqueToken();
            user.setResetToken(token);
            edit(user);
            sendResetPassEmail(user);
            // Logowanie informacji o wysłaniu emaila resetującego hasło.
//            logger.info("Wysłano email resetujący hasło dla użytkownika o adresie email: {}", email);
            return "user/resetMailSent";
        } else {
            // Logowanie informacji o nieznalezieniu użytkownika o podanym emailu.
//            logger.warn("Nie znaleziono użytkownika o adresie email: {}", email);
            return "user/noSuchUser";
        }
    }



    @Async
    public void sendResetPassEmail(User user) {
        String activationLink = createResetPasswordLink(user.getResetToken());
        SimpleMailMessage message = new SimpleMailMessage();
        String subject = "Tu w CharityApp! Reset hasla ";
        String to = user.getEmail();
        String body = String.format(
                "Witaj %s,\n\n" +
                        "Aby zresetowac swoje haslo kliknij w pozniszy link " +

                        "%s\n" +

                        "\n" +
                        "Zespół CharityApp",
                user.getName(), activationLink
        );


        message.setText(body);
        message.setTo(to);
        message.setSubject(subject);

        javaMailSender.send(message);
    }
}

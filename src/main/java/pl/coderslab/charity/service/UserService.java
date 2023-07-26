package pl.coderslab.charity.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.email.EmailServiceImpl;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.security.RegistrationService;

import java.util.Optional;

@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    private final RoleService roleService;

    private final EmailServiceImpl emailService;
    private final JavaMailSender javaMailSender;
    private final RegistrationService registrationService;

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

    public void sendActivationEmail(User user) {
        String activationLink = createActivationLink(user.getUniqueToken());
        SimpleMailMessage message = new SimpleMailMessage();
        String subject = "Witaj w CharityApp! Aktywuj swoje konto juz teraz!";
        String to = user.getEmail();
        String body = String.format(
                "Drogi %s,\n\n" +
                        "Witamy w CharityApp! Jesteśmy bardzo zadowoleni, że do nas dołączyłeś. Zacznij oddawać " +
                        "rzeczy już dzisiaj!\n\n" +
                        "Aby aktywować swoje konto, kliknij proszę w poniższy link aktywacyjny:\n" +
                        "<a href=\"%s\">Aktywuj konto</a>\n\n" + // Wstawiamy link jako hiperłącze
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

    public User findByUniqueToken(String token) {
        return userRepository.findByUniqueToken(token);
    }
}

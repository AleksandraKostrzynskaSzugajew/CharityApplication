package pl.coderslab.charity.service;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import java.util.Optional;

@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    private final RoleService roleService;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder, RoleService roleService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
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
}

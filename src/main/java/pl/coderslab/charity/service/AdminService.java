package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import java.util.List;

@Service
@Transactional
public class AdminService {

    private final UserRepository userRepository;

    public AdminService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> findAllByRoleId(Long id) {
        return userRepository.findAllByRoleId(id);
    }

    public List<User> findAllAdmins(Long roleId) {
        return findAllByRoleId(1L);
    }
}

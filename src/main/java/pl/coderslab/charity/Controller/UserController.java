package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.AdminService;
import pl.coderslab.charity.service.RoleService;
import pl.coderslab.charity.service.UserService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/user")
public class UserController {


    private final UserService userService;
    private final AdminService adminService;
    private final RoleService roleService;

    public UserController(UserService userService, AdminService adminService, RoleService roleService) {
        this.userService = userService;
        this.adminService = adminService;
        this.roleService = roleService;
    }

    @ModelAttribute("users")
    public List<User> admins() {
        return adminService.findAllAdmins(2L);
    }


    @GetMapping("/findall")
    public String findAllUsersView() {
        return "user/findAll";
    }


    @GetMapping("edit")
    public String edit(Model model, @RequestParam Long id) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "user/edit";
    }

    @PostMapping("edit")
    public String edited(User user) {
        userService.edit(user);
        return "user/findAll";
    }


    @GetMapping("/remove")
    public String remove(@RequestParam Long id) {
        userService.deleteById(id);
        return "user/findAll";
    }

    @GetMapping("/block")
    public String block(@RequestParam long id) {
        userService.blockUser(id);
        return "user/findAll";
    }

    @GetMapping("/unblock")
    public String unblock(@RequestParam long id) {
        userService.unblockUser(id);
        return "user/findAll";
    }

    @GetMapping("/activate")
    public String activateAccount(@RequestParam String token) {
        User user = userService.findByUniqueToken(token);

        if (user != null) {
            // Aktywuj konto użytkownika
            user.setEnabled(true);
            return "activated"; // Zwraca widok z potwierdzeniem aktywacji konta
        } else {
            // Token jest nieprawidłowy lub wygasł
            return "invalidToken"; // Zwraca widok z komunikatem o nieprawidłowym lub wygasłym tokenie
        }
    }
}

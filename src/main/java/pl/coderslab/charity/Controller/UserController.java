package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.AdminService;
import pl.coderslab.charity.service.RoleService;
import pl.coderslab.charity.service.UserService;

import java.util.List;

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

}

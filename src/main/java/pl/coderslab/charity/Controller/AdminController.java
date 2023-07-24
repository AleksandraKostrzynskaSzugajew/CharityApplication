package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.Role;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.AdminService;
import pl.coderslab.charity.service.RoleService;
import pl.coderslab.charity.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/admin/admin")
public class AdminController {

    private final UserService userService;
    private final AdminService adminService;

    private final RoleService roleService;

    public AdminController(UserService userService, AdminService adminService, RoleService roleService) {
        this.userService = userService;
        this.adminService = adminService;
        this.roleService = roleService;
    }


    @ModelAttribute("admins")
    public List<User> admins() {
        return adminService.findAllAdmins(1L);
    }

    @GetMapping("/findall")
    public String findAllAdmins() {
        return "adminView/findAll";
    }

    @GetMapping("/save")
    public String save(Model model) {
        model.addAttribute("user", new User());
        return "adminView/save";
    }

    @PostMapping("/save")
    public String saved(@ModelAttribute User user) {
        Role role = roleService.findById(1L);
        System.out.println("=====================================================");
        System.out.println(role);

        userService.save(user);
        user.setRole(role);
        userService.edit(user);
        return "redirect:findall";
    }

//    @GetMapping("/findall")
//    public String findAllUsers() {
//        return "adminView/findAll";
//    }

    @GetMapping("/edit")
    public String edit(Model model, @RequestParam Long id) {
        User user = userService.findById(id);
        model.addAttribute("adminToEdit", user);
        return "adminView/edit";
    }

    @PostMapping("/edit")
    public String edited(User user) {
        userService.edit(user);
        return "redirect:findall";
    }


    @GetMapping("/remove")
    public String remove(@RequestParam Long id) {
        userService.deleteById(id);
        return "redirect:findall";
    }

}

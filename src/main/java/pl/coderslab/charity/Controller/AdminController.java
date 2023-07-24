package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
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
    public List<User> findAllAdmins() {
        return adminService.findAllAdmins(1L);
    }

    @GetMapping("/save")
    public String save(Model model) {
        model.addAttribute("admin", new User());
        return "adminView/save";
    }

    @PostMapping("/save")
    public String saved(@ModelAttribute User user) {
        user.setRole(roleService.findByName("ROLE_ADMIN"));
        userService.save(user);
        return "redirect:findall";
    }

//    @GetMapping("/findall")
//    public String findAllUsers() {
//        return "adminView/findAll";
//    }

    @GetMapping("edit")
    public String edit(Model model, @RequestParam Long id) {
        User user = userService.findById(id);
        model.addAttribute("admin", user);
        return "adminView/edit";
    }

    @PostMapping("edit")
    public String edited(Model model, @RequestParam Long id) {
        User user = (User) model.getAttribute("admin");
        userService.edit(user);
        return "redirect:findAll";
    }


    @GetMapping("/remove")
    public String remove(@RequestParam Long id) {
        userService.deleteById(id);
        return "redirect:findAll";
    }

}

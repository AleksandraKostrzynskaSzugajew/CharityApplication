package pl.coderslab.charity.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;

@Controller
@RequestMapping("/admin/inst")
public class InstitutionsController {

    private final InstitutionService institutionService;

    public InstitutionsController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }


    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionService.findAll();
    }

    @GetMapping("/save")
    public String save(Model model) {
        model.addAttribute("institution", new Institution());
        return "institution/save";
    }

    @PostMapping("/save")
    public String saved(@ModelAttribute Institution institution) {
        institutionService.save(institution);
        return "redirect:findall";
    }

    @GetMapping("/findall")
    public String findAll() {
        return "institution/findAll";
    }

    @GetMapping("edit")
    public String edit(Model model, @RequestParam Long id) {
        Institution institution = institutionService.findById(id);
        model.addAttribute("institution", institution);
        return "institution/edit";
    }

    @PostMapping("edit")
    public String edited(Model model, @RequestParam Long id) {
        Institution institution = (Institution) model.getAttribute("institution");
        institutionService.edit(institution);
        return "redirect:findAll";
    }


    @GetMapping("/remove")
    public String remove(@RequestParam Long id) {
        institutionService.deleteById(id);
        return "redirect:findAll";
    }
}

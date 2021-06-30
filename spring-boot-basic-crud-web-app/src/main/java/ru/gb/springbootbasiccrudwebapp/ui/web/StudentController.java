package ru.gb.springbootbasiccrudwebapp.ui.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.gb.springbootbasiccrudwebapp.entity.Student;
import ru.gb.springbootbasiccrudwebapp.service.StudentService;

@Controller
public class StudentController {
    private static final String STUDENT_LIST_PAGE = "student_list";
    private static final String STUDENT_FORM_PAGE = "student_form";
    private final StudentService service;

    @Autowired
    public StudentController(StudentService service) {
        this.service = service;
    }

    public StudentService getService() {
        return service;
    }

    @GetMapping("/")
    public String showAll(Model model) {
        model.addAttribute("entities", this.service.getAll());
        return STUDENT_LIST_PAGE;
    }

    @GetMapping("/{id}")
    public String showById(Model model, @PathVariable long id) {
        if (id > 0) model.addAttribute("entity", this.service.getById(id));
        return STUDENT_FORM_PAGE;
    }

    @DeleteMapping("/{id}")
    public String deleteById(@PathVariable long id) {
        this.service.deleteById(id);
        return this.getRedirectToMain();
    }

    @PostMapping(value = "/")
    public String save(Student student) {
        this.service.save(student);
        return this.getRedirectToMain();
    }

    @GetMapping({"/(?!\\d)(?!sw.js)(?!favicon.ico).*$", "/*/**",})
    private String getRedirectToMain() {
        return "redirect:/";
    }

    @GetMapping({"/favicon.ico", "/sw.js"})
    @ResponseBody
    private byte[] getFavicon() {
        return new byte[]{0};
    }
}

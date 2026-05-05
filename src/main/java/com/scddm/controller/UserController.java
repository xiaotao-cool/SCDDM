package com.scddm.controller;

import com.scddm.model.User;
import com.scddm.service.UserService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService service;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list",service.list());
        return "userList";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/addPage")
    public String addPage(){
        return "userAdd";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/add")
    public String add(User user){
        service.add(user);
        return "redirect:/user/list";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        service.delete(id);
        return "redirect:/user/list";
    }
}

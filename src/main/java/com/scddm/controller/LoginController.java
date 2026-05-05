package com.scddm.controller;

import com.scddm.model.User;
import com.scddm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String doRegister(User user) {
        userService.register(user);
        return "redirect:/login";
    }
//    @GetMapping("/login")
//    public String loginPage() {
//        return "login";
//    }
//
//    @PostMapping("/doLogin")
//    public String doLogin(String username,
//                          String password,
//                          HttpSession session,
//                          Model model) {
//
//        User user = userService.login(username, password);
//        if (user == null) {
//            model.addAttribute("error", "用户名或密码错误");
//            return "login";
//        }
//
//        session.setAttribute("loginUser", user);
//        return "redirect:/index";
//    }
//
//    @GetMapping("/register")
//    public String registerPage() {
//        return "register";
//    }
//
//    @GetMapping("/index")
//    public String index(HttpSession session) {
//        if (session.getAttribute("loginUser") == null) {
//            return "redirect:/login";
//        }
//        return "index";
//    }
}

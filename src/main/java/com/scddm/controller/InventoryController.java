package com.scddm.controller;

import com.scddm.model.InventoryCheck;
import com.scddm.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inventory")
public class InventoryController {

    @Autowired
    private InventoryService service;

    @GetMapping("/checkPage")
    public String checkPage(){
        return "inventoryCheck";
    }

    @PostMapping("/check")
    public String check(InventoryCheck check){
        service.check(check);
        return "redirect:/inventory/list";
    }

    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("list",service.list());
        return "inventoryList";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/delete")
    public String delete(Integer id){
        service.delete(id);
        return "redirect:/inventory/list";
    }
}

package com.scddm.controller;

import com.scddm.model.AllocationApply;
import com.scddm.service.AllocationService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/allocation")
public class AllocationController {

    private final AllocationService service;

    public AllocationController(AllocationService service){
        this.service = service;
    }

    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("list",service.list());
        return "allocationList";
    }

    @GetMapping("/applyPage")
    public String applyPage() {
        return "allocationApply";
    }

    @PostMapping("/apply")
    public String apply(AllocationApply apply){
        service.apply(apply);
        return "redirect:/allocation/list";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/approve")
    public String approve(Integer id,boolean pass){
        service.approve(id,pass);
        return "redirect:/allocation/list";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/delete")
    public String delete(Integer id){
        service.delete(id);
        return "redirect:/allocation/list";
    }
}

package com.scddm.controller;

import com.scddm.model.Maintenance;
import com.scddm.service.MaintenanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/maintenance")
public class MaintenanceController {

    @Autowired
    private MaintenanceService maintenanceService;

    //维修记录列表
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list",maintenanceService.listAll());
        return "maintenanceList";
    }

    //跳转新增维修页面
    @GetMapping("/add")
    public String addPage(Integer deviceId, Model model){
        model.addAttribute("deviceId", deviceId);
        return "maintenanceAdd";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/delete")
    public String delete(@RequestParam Integer id){
        maintenanceService.deleteById(id);
        return "redirect:/maintenance/list";
    }
    //提交维修记录
    @PostMapping("/add")
    public String add(Maintenance maintenance){
        maintenanceService.add(maintenance);
        return "redirect:/maintenance/list";
    }
}

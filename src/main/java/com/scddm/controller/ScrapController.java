package com.scddm.controller;

import com.scddm.service.ScrapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/scrap")
public class ScrapController {

    @Autowired
    private ScrapService scrapService;

    //跳转报废申请页面
    @GetMapping("/apply")
    public String applyPage(@RequestParam Integer deviceId, Model model) {
        model.addAttribute("deviceId", deviceId);
        return "scrapApply";
    }

    //报废申请记录列表
    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("scraps", scrapService.listAll());
        return "scrapApprove";
    }

    @PostMapping("/apply")
    public String apply(Integer deviceId,String reason){
        scrapService.apply(deviceId,reason);
        return "redirect:/devices/list";
    }

    //审批通过
    @PostMapping("/approve")
    @PreAuthorize("hasRole('ADMIN')")
    public String approve(@RequestParam("scrapId") Integer scrapId){
        scrapService.approve(scrapId);
        return "redirect:/scrap/list";
    }

    //审批删除
    @PostMapping("/delete")
    @PreAuthorize("hasRole('ADMIN')")
    public String delete(@RequestParam("id") Integer id){
        scrapService.delete(id);
        return "redirect:/scrap/list";
    }
}

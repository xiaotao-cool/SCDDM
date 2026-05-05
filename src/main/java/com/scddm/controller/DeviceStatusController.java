package com.scddm.controller;

import com.scddm.model.DeviceStatusLog;
import com.scddm.model.Devices;
import com.scddm.service.DeviceStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/device/status")
public class DeviceStatusController {

    @Autowired
    private DeviceStatusService service;

    @GetMapping
    public String statusPage(@RequestParam("deviceId") Integer deviceId, Model model){

        Devices device = service.getDeviceById(deviceId);

        List<DeviceStatusLog> logs = service.listLogs(deviceId);

        model.addAttribute("logs", logs);
        model.addAttribute("device", device);
        model.addAttribute("deviceId", deviceId);
        return "deviceStatus";
    }

    @GetMapping("/deviceStatusHistory")
    public String deviceStatusHistory(Integer deviceId, Model model){
        List<DeviceStatusLog> logs = service.listLogs(deviceId);
        model.addAttribute("deviceId",deviceId);
        model.addAttribute("logs", logs);
        return "deviceStatusHistory";
    }

    @PostMapping("/update")
    public String update(@RequestParam Integer deviceId,
                         @RequestParam String status,
                         @RequestParam String operator){

        System.out.println(deviceId + " " + status + " " + operator);

        service.changeStatus(deviceId,status,operator);
        return "redirect:/device/status?deviceId="+deviceId;
    }
}
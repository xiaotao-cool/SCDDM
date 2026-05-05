package com.scddm.controller;

import com.scddm.model.Devices;
import com.scddm.service.DeviceService;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/devices")
public class DeviceController {
    @Autowired
    private DeviceService deviceService;
    //get add页面
    @GetMapping("/add")
    public String showAddDevice(Model model){
        model.addAttribute("device",new Devices());
        return "deviceForm";
    }

    //添加数据
    @PostMapping("/add")
    public String addDevice(@ModelAttribute Devices device){
        deviceService.addDevice(device);
        return "redirect:/devices/list";
    }

    //查询数据
    @GetMapping("/list")
    public String listDevice(@RequestParam(value = "name",required = false) String name,
                             @RequestParam(value = "model",required = false) String model,
                             @RequestParam(value = "status",required = false) String status,Model mod){
        List<Devices> devices = deviceService.searchDevices(name,model,status);
        mod.addAttribute("devices",devices);
        return "deviceList";
    }

    //编辑数据界面
    @GetMapping("/edit/{id}")
    public String showEditDevice(Model model,@PathVariable Integer id){
        Devices device = deviceService.getDeviceById(id);
        model.addAttribute("device", device);
        return "deviceForm";
    }

    //编辑数据
    @PostMapping("/edit")
    public String editDevice(@ModelAttribute Devices device){
        deviceService.updateDevice(device);
        return "redirect:/devices/list";
    }

    //删除某个数据界面
    @GetMapping("/delete/{id}")
    public String deleteDevice(@PathVariable Integer id){
        deviceService.deleteDevice(id);
        return "redirect:/devices/list";
    }

    //导出数据
    @GetMapping("/export")
    public void exportDevice(@RequestParam(required = false)String name,
                             @RequestParam(required = false)String model,
                             @RequestParam(required = false)String status,
                             HttpServletResponse res) throws Exception {

        //查询数据
        List<Devices> devices = deviceService.searchDevices(name, model, status);

        //创建Excel
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("设备列表");

        //表头
        Row headerRow = sheet.createRow(0);
        String[] headers = {"设备名称","型号","规格","购置日期","供应商","状态"};
        for (int i = 0; i < headers.length; i++) {
            headerRow.createCell(i).setCellValue(headers[i]);
        }

        //数据行
        int rowNum = 1;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (Devices d : devices) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(d.getName());
            row.createCell(1).setCellValue(d.getModel());
            row.createCell(2).setCellValue(d.getSpecification());
            row.createCell(3).setCellValue(
                    d.getPurchaseDate() == null ? "" : sdf.format(d.getPurchaseDate()));
            row.createCell(4).setCellValue(d.getSupplier());
            row.createCell(5).setCellValue(d.getStatus());
        }

        //设置响应头
        res.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        String fileName = URLEncoder.encode("设备列表.xlsx", StandardCharsets.UTF_8);
        res.setHeader(
                "Content-Disposition",
                "attachment;filename*=utf-8''" + fileName
        );

        //输出
        workbook.write(res.getOutputStream());
        workbook.close();
    }
}
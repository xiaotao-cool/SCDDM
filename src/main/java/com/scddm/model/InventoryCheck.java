package com.scddm.model;

import java.time.LocalDateTime;

public class InventoryCheck {
    private Integer id;
    private Integer deviceId;
    private Integer systemQty;
    private Integer actualQty;
    private Integer diffQty;
    private String result;
    private String checker;
    private LocalDateTime checkTime;

    public InventoryCheck() {}

    public InventoryCheck(Integer id, Integer deviceId, Integer systemQty, Integer actualQty, Integer diffQty, String result,String checker,LocalDateTime checkTime) {
        this.id = id;
        this.deviceId = deviceId;
        this.systemQty = systemQty;
        this.actualQty = actualQty;
        this.diffQty = diffQty;
        this.result = result;
        this.checker = checker;
        this.checkTime = LocalDateTime.now();
    }

    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}

    public Integer getDeviceId() {return deviceId;}
    public void setDeviceId(Integer deviceId) {this.deviceId = deviceId;}

    public Integer getSystemQty() {return systemQty;}
    public void setSystemQty(Integer systemQty) {this.systemQty = systemQty;}

    public Integer getActualQty() {return actualQty;}
    public void setActualQty(Integer actualQty) {this.actualQty = actualQty;}

    public Integer getDiffQty() {return diffQty;}
    public void setDiffQty(Integer diffQty) {this.diffQty = diffQty;}

    public String getResult() {return result;}
    public void setResult(String result) {this.result = result;}

    public String getChecker() {return checker;}
    public void setChecker(String checker) {this.checker = checker;}

    public LocalDateTime getCheckTime() {return checkTime;}
    public void setCheckTime(LocalDateTime checkTime) {this.checkTime = checkTime;}
}

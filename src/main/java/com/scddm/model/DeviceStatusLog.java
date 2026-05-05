package com.scddm.model;

import java.time.LocalDateTime;

//设备状态管理
public class DeviceStatusLog {
    private Integer id;
    private Integer deviceId;
    private String oldStatus;
    private String newStatus;
    private String operator;
    private LocalDateTime changeTime;

    public DeviceStatusLog (){}

    public DeviceStatusLog ( Integer id, Integer deviceId, String oldStatus, String newStatus, String operator, LocalDateTime changeTime) {
        this.id = id;
        this.deviceId = deviceId;
        this.oldStatus = oldStatus;
        this.newStatus = newStatus;
        this.operator = operator;
        this.changeTime = changeTime;
    }

    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}

    public Integer getDeviceId() {return deviceId;}
    public void setDeviceId(Integer deviceId) {this.deviceId = deviceId;}

    public String getOldStatus() {return oldStatus;}
    public void setOldStatus(String oldStatus) {this.oldStatus = oldStatus;}

    public String getNewStatus() {return newStatus;}
    public void setNewStatus(String newStatus) {this.newStatus = newStatus;}

    public String getOperator() {return operator;}
    public void setOperator(String operator) {this.operator = operator;}

    public LocalDateTime getChangeTime() {return changeTime;}
    public void setChangeTime(LocalDateTime changeTime) {this.changeTime = changeTime;}
}
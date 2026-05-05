package com.scddm.model;

import java.time.LocalDateTime;

public class AllocationApply {
    private Integer id;
    private Integer deviceId;
    private String fromDept;
    private String toDept;
    private String reason;
    private String status;
    private LocalDateTime applyTime;

    public AllocationApply() {}

    public AllocationApply(Integer id, Integer deviceId, String fromDept, String toDept, String reason, String status) {
        this.id = id;
        this.deviceId = deviceId;
        this.fromDept = fromDept;
        this.toDept = toDept;
        this.reason = reason;
        this.status = status;
        this.applyTime = LocalDateTime.now();
    }

    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}

    public Integer getDeviceId() {return deviceId;}
    public void setDeviceId(Integer deviceId) {this.deviceId = deviceId;}

    public String getFromDept() {return fromDept;}
    public void setFromDept(String fromDept) {this.fromDept = fromDept;}

    public String getToDept() {return toDept;}
    public void setToDept(String toDept) {this.toDept = toDept;}

    public String getReason() {return reason;}
    public void setReason(String reason) {this.reason = reason;}

    public String getStatus() {return status;}
    public void setStatus(String status) {this.status = status;}

    public LocalDateTime getApplyTime() {return applyTime;}
    public void setApplyTime(LocalDateTime applyTime) {this.applyTime = applyTime;}
}

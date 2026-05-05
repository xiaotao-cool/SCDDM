package com.scddm.model;

import java.time.LocalDateTime;

public class Scrap {
    private Integer id;
    private Integer deviceId;
    private String reason;
    private LocalDateTime applyTime;
    private LocalDateTime approveTime;
    private String approveStatus;
    private String processInstanceId;

    public  Scrap() {}

    public Scrap(Integer id, Integer deviceId, String reason, LocalDateTime applyTime, LocalDateTime approveTime, String approveStatus, String processInstanceId) {
        this.id = id;
        this.deviceId = deviceId;
        this.reason = reason;
        this.applyTime = applyTime;
        this.approveTime = approveTime;
        this.approveStatus = approveStatus;
        this.processInstanceId = processInstanceId;
    }

    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}

    public Integer getDeviceId() {return deviceId;}
    public void setDeviceId(Integer deviceId) {this.deviceId = deviceId;}

    public String getReason() {return reason;}
    public void setReason(String reason) {this.reason = reason;}

    public LocalDateTime getApplyTime() {return applyTime;}
    public void setApplyTime(LocalDateTime applyTime) {this.applyTime = applyTime;}

    public LocalDateTime getApproveTime() {return approveTime;}
    public void setApproveTime(LocalDateTime approveTime) {this.approveTime = approveTime;}

    public String getApproveStatus() {return approveStatus;}
    public void setApproveStatus(String approveStatus) {this.approveStatus = approveStatus;}

    public String getProcessInstanceId() {return processInstanceId;}
    public void setProcessInstanceId(String processInstanceId) {this.processInstanceId = processInstanceId;}
}

package com.scddm.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Maintenance {
    private Integer id;
    private Integer deviceId;
    private String reason;
    private String maintainer;
    private BigDecimal cost;
    private String status;
    private LocalDateTime startTime;
    private LocalDateTime endTime;

    public Maintenance() {}

    public Maintenance(Integer id, Integer deviceId, String reason, String maintainer,
                       BigDecimal cost, String status, LocalDateTime startTime, LocalDateTime endTime) {
        this.id = id;
        this.deviceId = deviceId;
        this.reason = reason;
        this.maintainer = maintainer;
        this.cost = cost;
        this.status = status;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}

    public Integer getDeviceId() {return deviceId;}
    public void setDeviceId(Integer deviceId) {this.deviceId = deviceId;}

    public String getReason() {return reason;}
    public void setReason(String reason) {this.reason = reason;}

    public String getMaintainer() {return maintainer;}
    public void setMaintainer(String maintainer) {this.maintainer = maintainer;}

    public BigDecimal getCost() {return cost;}
    public void setCost(BigDecimal cost) {this.cost = cost;}

    public String getStatus() {return status;}
    public void setStatus(String status) {this.status = status;}

    public LocalDateTime getStartTime() {return startTime;}
    public void setStartTime(LocalDateTime startTime) {this.startTime = startTime;}

    public LocalDateTime getEndTime() {return endTime;}
    public void setEndTime(LocalDateTime endTime) {this.endTime = endTime;}
}

package com.scddm.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Devices {
    private Integer id;
    private String name;
    private String model;
    private String specification;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date purchaseDate;
    private String supplier;
    private String status;

    public Devices() {}

    public Devices(String name, String model, String specification, Date purchaseDate, String supplier, String status) {
        this.name = name;
        this.model = model;
        this.specification = specification;
        this.purchaseDate = purchaseDate;
        this.supplier = supplier;
        this.status = status;
    }

    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}

    public String getName() {return name;}
    public void setName(String name) {this.name = name;}

    public String getModel() {return model;}
    public void setModel(String model) {this.model = model;}

    public String getSpecification() {return specification;}
    public void setSpecification(String specification) {this.specification = specification;}

    public Date getPurchaseDate() {return purchaseDate;}
    public void setPurchaseDate(Date purchaseDate) {this.purchaseDate = purchaseDate;}

    public String getSupplier() {return supplier;}
    public void setSupplier(String supplier) {this.supplier = supplier;}

    public String getStatus() {return status;}
    public void setStatus(String status) {this.status = status;}
}

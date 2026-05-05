package com.scddm.model;

public class User {

    private Integer id;
    private String username;
    private String password;
    private String role;
    private String department;
    private Integer enabled;

    public User(){}

    public User(Integer id, String username, String password, String role, String department, Integer enabled) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.department = department;
        this.enabled = enabled;
    }

    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}

    public String getUsername() {return username;}
    public void setUsername(String username) {this.username = username;}

    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}

    public String getRole() {return role;}
    public void setRole(String role) {this.role = role;}

    public String getDepartment() {return department;}
    public void setDepartment(String department) {this.department = department;}

    public Integer getEnabled() {return enabled;}
    public void setEnabled(Integer enabled) {this.enabled = enabled;}
}

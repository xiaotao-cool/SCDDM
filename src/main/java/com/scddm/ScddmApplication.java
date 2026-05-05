package com.scddm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.scddm.mapper")
public class ScddmApplication {
    public static void main(String[] args) {
        SpringApplication.run(ScddmApplication.class, args);
    }
}

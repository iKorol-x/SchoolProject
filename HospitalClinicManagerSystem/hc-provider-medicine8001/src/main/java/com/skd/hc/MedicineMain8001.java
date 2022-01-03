package com.skd.hc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class MedicineMain8001 {
    public static void main(String[] args) {
        SpringApplication.run(MedicineMain8001.class,args);
    }
}

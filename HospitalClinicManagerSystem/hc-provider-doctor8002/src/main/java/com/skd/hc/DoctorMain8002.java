package com.skd.hc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class DoctorMain8002 {
    public static void main(String[] args) {
        SpringApplication.run(DoctorMain8002.class,args);
    }
}

package com.skd.hc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class RegisterMain8004 {
    public static void main(String[] args) {
        SpringApplication.run(RegisterMain8004.class,args);
    }
}

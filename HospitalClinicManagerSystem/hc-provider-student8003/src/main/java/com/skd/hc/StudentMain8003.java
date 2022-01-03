package com.skd.hc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class StudentMain8003 {
    public static void main(String[] args) {
        SpringApplication.run(StudentMain8003.class,args);
    }
}

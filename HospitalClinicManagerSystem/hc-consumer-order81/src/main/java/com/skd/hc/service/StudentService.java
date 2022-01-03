package com.skd.hc.service;

import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(value = "HC-STUDENT-SERVER")
public interface StudentService {
}

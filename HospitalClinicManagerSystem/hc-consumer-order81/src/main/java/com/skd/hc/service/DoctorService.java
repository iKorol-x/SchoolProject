package com.skd.hc.service;

import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(value = "HC-DOCTOR-SERVER")
public interface DoctorService {
}

package com.skd.hc.service;

import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(value = "HC-REGISTER-SERVER")
public interface RegisterService {
}

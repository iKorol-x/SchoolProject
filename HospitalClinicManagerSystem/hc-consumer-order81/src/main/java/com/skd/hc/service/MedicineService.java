package com.skd.hc.service;

import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(value = "HC-MEDICINE-SERVER")
public interface MedicineService {

}

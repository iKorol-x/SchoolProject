package com.skd.hc.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@Slf4j
public class DoctorController {
    public static final String PAYMENT_URL = "http://HC-DOCTOR-SERVER";
    @Autowired
    private RestTemplate restTemplate;

    public String asa() {
        return null;
    }
}

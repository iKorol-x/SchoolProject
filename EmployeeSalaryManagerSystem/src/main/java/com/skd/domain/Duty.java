package com.skd.domain;

public class Duty {
    private int id;
    private String name;
    private int attend_day;
    private double attend_rate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAttend_day() {
        return attend_day;
    }

    public void setAttend_day(int attend_day) {
        this.attend_day = attend_day;
    }

    public double getAttend_rate() {
        return attend_rate;
    }

    public void setAttend_rate(double attend_rate) {
        this.attend_rate = attend_rate;
    }
}

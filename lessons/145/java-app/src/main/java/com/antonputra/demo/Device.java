package com.antonputra.demo;

public class Device {
    private final String uuid;
    private final String mac;
    private final String firmware;

    public Device(String uuid, String mac, String firmware) {
        this.uuid = uuid;
        this.mac = mac;
        this.firmware = firmware;
    }

    public String getUuid() {
        return uuid;
    }

    public String getMac() {
        return mac;
    }

    public String getFirmware() {
        return firmware;
    }
}

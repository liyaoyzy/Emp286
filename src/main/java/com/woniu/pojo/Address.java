package com.woniu.pojo;

public class Address {

    private Integer aid;

    private String address;

    private Addressimg addressimg;

    public Addressimg getAddressimg() {
        return addressimg;
    }

    public void setAddressimg(Addressimg addressimg) {
        this.addressimg = addressimg;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Address{" +
                "aid=" + aid +
                ", address='" + address + '\'' +
                '}';
    }
}
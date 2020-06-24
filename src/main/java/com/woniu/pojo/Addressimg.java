package com.woniu.pojo;

public class Addressimg {
    private Integer addid;

    private Integer aid;

    private String addimg;

    private  Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Integer getAddid() {
        return addid;
    }

    public void setAddid(Integer addid) {
        this.addid = addid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAddimg() {
        return addimg;
    }

    public void setAddimg(String addimg) {
        this.addimg = addimg;
    }

    @Override
    public String toString() {
        return "Addressimg{" +
                "addid=" + addid +
                ", aid=" + aid +
                ", addimg='" + addimg + '\'' +
                '}';
    }
}
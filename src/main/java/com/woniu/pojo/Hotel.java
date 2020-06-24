package com.woniu.pojo;

public class Hotel {
    private Integer hid;

    private String hname;

    private Integer levelid;

    private Double price;

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public Integer getLevelid() {
        return levelid;
    }

    public void setLevelid(Integer levelid) {
        this.levelid = levelid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "hid=" + hid +
                ", hname='" + hname + '\'' +
                ", levelid=" + levelid +
                ", price=" + price +
                '}';
    }
}
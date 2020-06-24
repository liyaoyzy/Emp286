package com.woniu.pojo;

public class Tour {
    private Integer tid;

    private Integer aid;

    private String tname;

    private String times;

    private Double price;

    private Address address;

    private  Tourimg tourimg;

    public Tourimg getTourimg() {
        return tourimg;
    }

    public void setTourimg(Tourimg tourimg) {
        this.tourimg = tourimg;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Tour{" +
                "tid=" + tid +
                ", aid=" + aid +
                ", tname='" + tname + '\'' +
                ", times='" + times + '\'' +
                ", price=" + price +
                '}';
    }
}
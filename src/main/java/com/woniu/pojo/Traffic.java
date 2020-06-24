package com.woniu.pojo;

public class Traffic {
    private Integer trid;

    private String trname;

    private Double price;

    public Integer getTrid() {
        return trid;
    }

    public void setTrid(Integer trid) {
        this.trid = trid;
    }

    public String getTrname() {
        return trname;
    }

    public void setTrname(String trname) {
        this.trname = trname;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Traffic{" +
                "trid=" + trid +
                ", trname='" + trname + '\'' +
                ", price=" + price +
                '}';
    }
}
package com.woniu.pojo;

import java.util.Date;

public class Orders {
    private Integer orid;

    private Integer uid;

    private Integer eid;

    private Integer oid;

    private Date time;

    private Double price;

    private String odno;

    private Date starttime;

    public Integer getOrid() {
        return orid;
    }

    public void setOrid(Integer orid) {
        this.orid = orid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getOdno() {
        return odno;
    }

    public void setOdno(String odno) {
        this.odno = odno;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orid=" + orid +
                ", uid=" + uid +
                ", eid=" + eid +
                ", oid=" + oid +
                ", time=" + time +
                ", price=" + price +
                ", odno='" + odno + '\'' +
                ", starttime=" + starttime +
                '}';
    }
}
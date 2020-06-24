package com.woniu.pojo;

public class Orderpeople {
    private Integer ouid;

    private Integer uid;

    private Integer orid;

    public Integer getOuid() {
        return ouid;
    }

    public void setOuid(Integer ouid) {
        this.ouid = ouid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getOrid() {
        return orid;
    }

    public void setOrid(Integer orid) {
        this.orid = orid;
    }

    @Override
    public String toString() {
        return "Orderpeople{" +
                "ouid=" + ouid +
                ", uid=" + uid +
                ", orid=" + orid +
                '}';
    }
}
package com.woniu.pojo;

public class Orderdetails {
    private Integer oid;

    private Integer tid;

    private Integer hid;

    private Integer trid;

    private Integer fid;

    private Integer status;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public Integer getTrid() {
        return trid;
    }

    public void setTrid(Integer trid) {
        this.trid = trid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Orderdetails{" +
                "oid=" + oid +
                ", tid=" + tid +
                ", hid=" + hid +
                ", trid=" + trid +
                ", fid=" + fid +
                ", status=" + status +
                '}';
    }
}
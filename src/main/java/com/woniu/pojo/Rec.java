package com.woniu.pojo;

public class Rec {
    private Integer recid;

    private Integer eid;

    private Integer oid;

    public Integer getRecid() {
        return recid;
    }

    public void setRecid(Integer recid) {
        this.recid = recid;
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

    @Override
    public String toString() {
        return "Rec{" +
                "recid=" + recid +
                ", eid=" + eid +
                ", oid=" + oid +
                '}';
    }
}
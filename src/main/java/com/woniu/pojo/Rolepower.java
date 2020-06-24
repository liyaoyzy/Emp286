package com.woniu.pojo;

public class Rolepower {
    private Integer rpid;

    private Integer pid;

    private Integer rid;

    public Integer getRpid() {
        return rpid;
    }

    public void setRpid(Integer rpid) {
        this.rpid = rpid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    @Override
    public String toString() {
        return "Rolepower{" +
                "rpid=" + rpid +
                ", pid=" + pid +
                ", rid=" + rid +
                '}';
    }
}
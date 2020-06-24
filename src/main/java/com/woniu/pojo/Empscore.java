package com.woniu.pojo;

import java.util.Date;

public class Empscore {
    private Integer sid;

    private Integer eid;

    private Integer mgrid;

    private Date time;

    private Integer score;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getMgrid() {
        return mgrid;
    }

    public void setMgrid(Integer mgrid) {
        this.mgrid = mgrid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Empscore{" +
                "sid=" + sid +
                ", eid=" + eid +
                ", mgrid=" + mgrid +
                ", time=" + time +
                ", score=" + score +
                '}';
    }
}
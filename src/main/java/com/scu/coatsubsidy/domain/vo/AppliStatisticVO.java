package com.scu.coatsubsidy.domain.vo;

public class AppliStatisticVO {
    private Integer count;
    private Integer passCount;
    private Integer failCount;
    private Integer pendCount;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getPassCount() {
        return passCount;
    }

    public void setPassCount(Integer passCount) {
        this.passCount = passCount;
    }

    public Integer getFailCount() {
        return failCount;
    }

    public void setFailCount(Integer failCount) {
        this.failCount = failCount;
    }

    public Integer getPendCount() {
        return pendCount;
    }

    public void setPendCount(Integer pendCount) {
        this.pendCount = pendCount;
    }
}

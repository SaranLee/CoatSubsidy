package com.scu.coatsubsidy.common;

public interface Constant {
    //登陆时，返回给浏览器的信息
    String LOGIN_RTN_MSG = "loginRtnMsg";

    //数据库记录没有被删除
    Integer NOT_DELETED = 0;

    //Dictionary Type Difficulty
    String DT_DIFFICULTY = "DIFFICULTY";

    //学生RoleId
    Long ROLE_STUDENT = 1L;
    Long ROLE_SCHOOL = 2L;
    Long ROLE_COLLEGE = 3L;
    Long ROLE_INSTRUCTOR = 4L;

    //困难等级
    String DIFF_LEVEL_BKN = "BKN";
    String DIFF_LEVEL_YBKN = "YBKN";
    String DIFF_LEVEL_TSKN = "TSKN";

    //审核流程
    Integer AUDIT_NODE_1 = 1;
    Integer AUDIT_NODE_2 = 2;
    Integer AUDIT_NODE_3 = 3;
    Integer AUDIT_NODE_4 = 4;
    Integer AUDIT_NODE_0 = 0;

    //审核状态
    String AUDIT_STATUS_TG = "TG";
    String AUDIT_STATUS_BTG = "BTG";
    String AUDIT_STATUS_DSH = "DSH";

    //前端传来的是否同意的参数值
    String AGREE = "T";
    String DISAGREE = "F";
}

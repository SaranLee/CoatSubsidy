package com.scu.coatsubsidy.domain;

public class UserManage {
    private String username;

    private String userSn;

    private Long organizationId;

    private String organizationName;

    private String organizationSn;

    private Long roleId;

    private String roleName;

    private Byte organizationType;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserSn() {
        return userSn;
    }

    public void setUserSn(String userSn) {
        this.userSn = userSn == null ? null : userSn.trim();
    }

    public Long getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Long organizationId) {
        this.organizationId = organizationId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName == null ? null : organizationName.trim();
    }

    public String getOrganizationSn() {
        return organizationSn;
    }

    public void setOrganizationSn(String organizationSn) {
        this.organizationSn = organizationSn == null ? null : organizationSn.trim();
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Byte getOrganizationType() {
        return organizationType;
    }

    public void setOrganizationType(Byte organizationType) {
        this.organizationType = organizationType;
    }
}
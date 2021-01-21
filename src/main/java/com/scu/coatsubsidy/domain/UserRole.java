package com.scu.coatsubsidy.domain;

import java.util.Objects;

public class UserRole {
    private Long id;

    private String userSn;

    private Long roleId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserSn() {
        return userSn;
    }

    public void setUserSn(String userSn) {
        this.userSn = userSn == null ? null : userSn.trim();
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserRole userRole = (UserRole) o;
        return Objects.equals(userSn, userRole.userSn) &&
                Objects.equals(roleId, userRole.roleId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userSn, roleId);
    }
}
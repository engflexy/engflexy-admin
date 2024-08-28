package ma.zs.alc.service.impl.migration.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoleMigration implements GrantedAuthority {

    private Long id;

    private Date updatedAt;

    private String authority;

    private Date createdAt;

    private List<PermissionMigration> permissions = new ArrayList<>();

    private List<UserMigration> users = new ArrayList<>();
    public String getAuthority() {
        return this.authority;
    }

    public RoleMigration(String authority) {
        this.authority = authority;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public List<PermissionMigration> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<PermissionMigration> permissions) {
        this.permissions = permissions;
    }

    public List<UserMigration> getUsers() {
        return users;
    }

    public void setUsers(List<UserMigration> users) {
        this.users = users;
    }
}

package ma.zs.alc.service.impl.migration.dto;

import java.util.ArrayList;
import java.util.List;

public class PermissionMigration {
    private Long id;
    private String name;

    List<RoleMigration> roles = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<RoleMigration> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleMigration> roles) {
        this.roles = roles;
    }
}

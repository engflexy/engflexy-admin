package ma.zs.alc.zynerator.security.ws.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.ws.dto.inscriptionref.LangueDto;
import ma.zs.alc.zynerator.dto.AuditBaseDto;

import java.util.List;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserDto extends AuditBaseDto {

    protected Boolean credentialsNonExpired;
    protected Boolean enabled;
    protected String email;
    protected Boolean accountNonExpired;
    protected Boolean accountNonLocked;
    protected String username;
    protected String password;
    protected Boolean passwordChanged;
    protected String about;
    protected String country;
    protected String fullName;
    protected String phone;
    protected String avatar;
    protected LangueDto langue;

    protected List<ModelPermissionUserDto> modelPermissionUsers;
    protected List<RoleUserDto> roleUsers;

    public UserDto() {
        super();
    }

    public Boolean getCredentialsNonExpired() {
        return this.credentialsNonExpired;
    }

    public void setCredentialsNonExpired(Boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }


    public Boolean getEnabled() {
        return this.enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }


    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getAccountNonExpired() {
        return this.accountNonExpired;
    }

    public void setAccountNonExpired(Boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }

    public Boolean getAccountNonLocked() {
        return this.accountNonLocked;
    }

    public void setAccountNonLocked(Boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getPasswordChanged() {
        return this.passwordChanged;
    }

    public void setPasswordChanged(Boolean passwordChanged) {
        this.passwordChanged = passwordChanged;
    }

    public List<ModelPermissionUserDto> getModelPermissionUsers() {
        return this.modelPermissionUsers;
    }

    public void setModelPermissionUsers(List<ModelPermissionUserDto> modelPermissionUsers) {
        this.modelPermissionUsers = modelPermissionUsers;
    }

    public LangueDto getLangue() {
        return langue;
    }

    public void setLangue(LangueDto langue) {
        this.langue = langue;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public List<RoleUserDto> getRoleUsers() {
        return this.roleUsers;
    }

    public void setRoleUsers(List<RoleUserDto> roleUsers) {
        this.roleUsers = roleUsers;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}

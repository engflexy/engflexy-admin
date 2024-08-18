package ma.zs.alc.zynerator.security.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "user")
@JsonInclude(JsonInclude.Include.NON_NULL)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class User extends AuditBusinessObject implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected Long id;

    protected boolean enabled = true;
    protected LocalDateTime createdAt;
    protected LocalDateTime updatedAt;
    protected String email;
    protected boolean accountNonExpired = true;
    protected boolean accountNonLocked = true;
    protected boolean passwordChanged = false;
    protected boolean credentialsNonExpired = true;

    protected boolean communicationEnabled = true;
    protected boolean securityEnabled = true;
    protected boolean lessonReminderEnabled = true;
    protected boolean classroomEnabled = true;

    public boolean isCommunicationEnabled() {
        return communicationEnabled;
    }

    public void setCommunicationEnabled(boolean communicationEnabled) {
        this.communicationEnabled = communicationEnabled;
    }

    public boolean isSecurityEnabled() {
        return securityEnabled;
    }

    public void setSecurityEnabled(boolean securityEnabled) {
        this.securityEnabled = securityEnabled;
    }

    public boolean isLessonReminderEnabled() {
        return lessonReminderEnabled;
    }

    public void setLessonReminderEnabled(boolean lessonReminderEnabled) {
        this.lessonReminderEnabled = lessonReminderEnabled;
    }

    public boolean isClassroomEnabled() {
        return classroomEnabled;
    }

    public void setClassroomEnabled(boolean classroomEnabled) {
        this.classroomEnabled = classroomEnabled;
    }

    public boolean isPasswordChangedNotificationEnabled() {
        return passwordChangedNotificationEnabled;
    }

    public void setPasswordChangedNotificationEnabled(boolean passwordChangedNotificationEnabled) {
        this.passwordChangedNotificationEnabled = passwordChangedNotificationEnabled;
    }

    public boolean isContactNotificationEnabled() {
        return contactNotificationEnabled;
    }

    public void setContactNotificationEnabled(boolean contactNotificationEnabled) {
        this.contactNotificationEnabled = contactNotificationEnabled;
    }

    protected boolean passwordChangedNotificationEnabled = true;
    protected boolean contactNotificationEnabled = true;
    protected String username;
    protected String password;

    protected String fullName;
    protected String validationCode;
    protected String avatar;
    protected String phone;
    protected String country;
    protected String about;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "langue")
    protected Langue langue;

    @Transient
    protected Collection<GrantedAuthority> authorities;
    @OneToMany(mappedBy = "user")
    @JsonIgnore
    protected List<ModelPermissionUser> modelPermissionUsers;
    @OneToMany(mappedBy = "user")
    protected List<RoleUser> roleUsers;



    public User() {
        super();
    }

    public User(String username) {
        this.username = username;
        this.password = username;
        this.email = username;
    }



    public User(Long id, String fullName) {
		super();
		this.id = id;
		this.fullName = fullName;
	}

	public String getValidationCode() {
        return validationCode;
    }

    public void setValidationCode(String validationCode) {
        this.validationCode = validationCode;
    }

    public Langue getLangue() {
        return this.langue;
    }

    public void setLangue(Langue langue) {
        this.langue = langue;
    }


    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean getCredentialsNonExpired() {
        return credentialsNonExpired;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public boolean getAccountNonExpired() {
        return accountNonExpired;
    }

    public boolean getAccountNonLocked() {
        return accountNonLocked;
    }

    public boolean getPasswordChanged() {
        return passwordChanged;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isCredentialsNonExpired() {
        return credentialsNonExpired;
    }

    public void setCredentialsNonExpired(boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isAccountNonExpired() {
        return accountNonExpired;
    }

    public void setAccountNonExpired(boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }

    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    public void setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String firstName) {
        this.fullName = firstName;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public Collection<GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    public void setAuthorities(Collection<GrantedAuthority> authorities) {
        this.authorities = authorities;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isPasswordChanged() {
        return passwordChanged;
    }

    public void setPasswordChanged(boolean passwordChanged) {
        this.passwordChanged = passwordChanged;
    }


    @JsonIgnore
    public List<ModelPermissionUser> getModelPermissionUsers() {
        return this.modelPermissionUsers;
    }

    public void setModelPermissionUsers(List<ModelPermissionUser> modelPermissionUsers) {
        this.modelPermissionUsers = modelPermissionUsers;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public List<RoleUser> getRoleUsers() {
        return this.roleUsers;
    }

    public void setRoleUsers(List<RoleUser> roleUsers) {
        this.roleUsers = roleUsers;
    }


    @Transient
    public String getLabel() {
        label = email;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id != null && id.equals(user.id);
    }


    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}

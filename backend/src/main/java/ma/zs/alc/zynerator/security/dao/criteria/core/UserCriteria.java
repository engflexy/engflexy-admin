package ma.zs.alc.zynerator.security.dao.criteria.core;


import ma.zs.alc.zynerator.criteria.BaseCriteria;

public class UserCriteria extends BaseCriteria {

    protected Boolean credentialsNonExpired;
    protected Boolean enabled;
    protected String email;
    protected String emailLike;
    protected Boolean accountNonExpired;
    protected Boolean accountNonLocked;
    protected String username;
    protected String usernameLike;
    protected String password;
    protected String passwordLike;
    protected Boolean passwordChanged;
    protected String fullName;
    protected String fullNameLike;
    protected String phone;
    protected String phoneLike;


    public UserCriteria() {
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

    public String getEmailLike() {
        return this.emailLike;
    }

    public void setEmailLike(String emailLike) {
        this.emailLike = emailLike;
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

    public String getUsernameLike() {
        return this.usernameLike;
    }

    public void setUsernameLike(String usernameLike) {
        this.usernameLike = usernameLike;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordLike() {
        return this.passwordLike;
    }

    public void setPasswordLike(String passwordLike) {
        this.passwordLike = passwordLike;
    }

    public String getFullName() {
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getFullNameLike() {
        return this.fullNameLike;
    }

    public void setFullNameLike(String fullNameLike) {
        this.fullNameLike = fullNameLike;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhoneLike() {
        return this.phoneLike;
    }

    public void setPhoneLike(String phoneLike) {
        this.phoneLike = phoneLike;
    }

    public Boolean getPasswordChanged() {
        return this.passwordChanged;
    }

    public void setPasswordChanged(Boolean passwordChanged) {
        this.passwordChanged = passwordChanged;
    }

}

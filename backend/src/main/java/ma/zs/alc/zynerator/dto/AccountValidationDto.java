package ma.zs.alc.zynerator.dto;

import org.springframework.web.bind.annotation.RequestParam;

public class AccountValidationDto {
    private String username;
    private String password;
    private String validationCode;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getValidationCode() {
        return validationCode;
    }

    public void setValidationCode(String validationCode) {
        this.validationCode = validationCode;
    }
}

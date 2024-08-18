export class AccountValidationDto {
    public username:string;
    public validationCode:string;
    public password:string;

    constructor(username: string, validationCode: string,password:string) {
        this.username = username;
        this.validationCode = validationCode;
        this.password=password;
    }
}

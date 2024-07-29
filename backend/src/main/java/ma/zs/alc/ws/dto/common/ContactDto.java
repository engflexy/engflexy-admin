package  ma.zs.alc.ws.dto.common;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import com.fasterxml.jackson.annotation.JsonFormat;


import ma.zs.alc.ws.dto.collab.CollaboratorDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class ContactDto  extends AuditBaseDto {

    private String name  ;
    private String email  ;
    private String phone  ;
    private String setFrom  ;
    private String dateContact ;
    private Boolean replied  ;
    private String message  ;

    private CollaboratorDto collaborator ;



    public ContactDto(){
        super();
    }



    @Log
    public String getName(){
        return this.name;
    }
    public void setName(String name){
        this.name = name;
    }

    @Log
    public String getEmail(){
        return this.email;
    }
    public void setEmail(String email){
        this.email = email;
    }

    @Log
    public String getPhone(){
        return this.phone;
    }
    public void setPhone(String phone){
        this.phone = phone;
    }

    @Log
    public String getSetFrom(){
        return this.setFrom;
    }
    public void setSetFrom(String setFrom){
        this.setFrom = setFrom;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getDateContact(){
        return this.dateContact;
    }
    public void setDateContact(String dateContact){
        this.dateContact = dateContact;
    }

    @Log
    public Boolean getReplied(){
        return this.replied;
    }
    public void setReplied(Boolean replied){
        this.replied = replied;
    }

    @Log
    public String getMessage(){
        return this.message;
    }
    public void setMessage(String message){
        this.message = message;
    }


    public CollaboratorDto getCollaborator(){
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorDto collaborator){
        this.collaborator = collaborator;
    }






}

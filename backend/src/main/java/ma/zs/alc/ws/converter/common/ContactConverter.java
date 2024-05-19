package  ma.zs.alc.ws.converter.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.alc.ws.converter.vocab.CollaboratorConverter;

import ma.zs.alc.bean.core.vocab.Collaborator;


import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.common.Contact;
import ma.zs.alc.ws.dto.common.ContactDto;

@Component
public class ContactConverter extends AbstractConverter<Contact, ContactDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter ;
    private boolean collaborator;

    public  ContactConverter() {
        super(Contact.class, ContactDto.class);
        init(true);
    }

    @Override
    public Contact toItem(ContactDto dto) {
        if (dto == null) {
            return null;
        } else {
        Contact item = new Contact();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getName()))
                item.setName(dto.getName());
            if(StringUtil.isNotEmpty(dto.getEmail()))
                item.setEmail(dto.getEmail());
            if(StringUtil.isNotEmpty(dto.getPhone()))
                item.setPhone(dto.getPhone());
            if(StringUtil.isNotEmpty(dto.getSetFrom()))
                item.setSetFrom(dto.getSetFrom());
            if(StringUtil.isNotEmpty(dto.getDateContact()))
                item.setDateContact(DateUtil.stringEnToDate(dto.getDateContact()));
            if(dto.getReplied() != null)
                item.setReplied(dto.getReplied());
            if(StringUtil.isNotEmpty(dto.getMessage()))
                item.setMessage(dto.getMessage());
            if(dto.getCollaborator() != null && dto.getCollaborator().getId() != null){
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }




        return item;
        }
    }

    @Override
    public ContactDto toDto(Contact item) {
        if (item == null) {
            return null;
        } else {
            ContactDto dto = new ContactDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getName()))
                dto.setName(item.getName());
            if(StringUtil.isNotEmpty(item.getEmail()))
                dto.setEmail(item.getEmail());
            if(StringUtil.isNotEmpty(item.getPhone()))
                dto.setPhone(item.getPhone());
            if(StringUtil.isNotEmpty(item.getSetFrom()))
                dto.setSetFrom(item.getSetFrom());
            if(item.getDateContact()!=null)
                dto.setDateContact(DateUtil.dateTimeToString(item.getDateContact()));
                dto.setReplied(item.getReplied());
            if(StringUtil.isNotEmpty(item.getMessage()))
                dto.setMessage(item.getMessage());
            if(this.collaborator && item.getCollaborator()!=null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator())) ;

            }


        return dto;
        }
    }

    public void copy(ContactDto dto, Contact t) {
    super.copy(dto, t);
    if (dto.getCollaborator() != null)
        collaboratorConverter.copy(dto.getCollaborator(), t.getCollaborator());
    }



    public void initObject(boolean value) {
        this.collaborator = value;
    }


    public CollaboratorConverter getCollaboratorConverter(){
        return this.collaboratorConverter;
    }
    public void setCollaboratorConverter(CollaboratorConverter collaboratorConverter ){
        this.collaboratorConverter = collaboratorConverter;
    }
    public boolean  isCollaborator(){
        return this.collaborator;
    }
    public void  setCollaborator(boolean collaborator){
        this.collaborator = collaborator;
    }
}

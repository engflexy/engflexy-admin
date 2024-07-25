package  ma.zs.alc.ws.converter.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.alc.ws.converter.collab.CollaboratorConverter;
import ma.zs.alc.bean.core.collab.Collaborator;

import ma.zs.alc.bean.core.collab.Collaborator;


import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.common.ClassAverageBonus;
import ma.zs.alc.ws.dto.common.ClassAverageBonusDto;

@Component
public class ClassAverageBonusConverter extends AbstractConverter<ClassAverageBonus, ClassAverageBonusDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter ;
    private boolean collaborator;

    public  ClassAverageBonusConverter() {
        super(ClassAverageBonus.class, ClassAverageBonusDto.class);
        init(true);
    }

    @Override
    public ClassAverageBonus toItem(ClassAverageBonusDto dto) {
        if (dto == null) {
            return null;
        } else {
        ClassAverageBonus item = new ClassAverageBonus();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getCode()))
                item.setCode(dto.getCode());
            if(StringUtil.isNotEmpty(dto.getNombreSession()))
                item.setNombreSession(dto.getNombreSession());
            if(StringUtil.isNotEmpty(dto.getPrix()))
                item.setPrix(dto.getPrix());
            if(dto.getCollaborator() != null && dto.getCollaborator().getId() != null){
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }




        return item;
        }
    }

    @Override
    public ClassAverageBonusDto toDto(ClassAverageBonus item) {
        if (item == null) {
            return null;
        } else {
            ClassAverageBonusDto dto = new ClassAverageBonusDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getCode()))
                dto.setCode(item.getCode());
            if(StringUtil.isNotEmpty(item.getNombreSession()))
                dto.setNombreSession(item.getNombreSession());
            if(StringUtil.isNotEmpty(item.getPrix()))
                dto.setPrix(item.getPrix());
            if(this.collaborator && item.getCollaborator()!=null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator())) ;

            }


        return dto;
        }
    }

    public void copy(ClassAverageBonusDto dto, ClassAverageBonus t) {
    super.copy(dto, t);
    if(t.getCollaborator() == null && dto.getCollaborator() != null) {
        t.setCollaborator(new Collaborator());
    }
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

package  ma.zs.alc.ws.converter.price;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.alc.ws.converter.vocab.CollaboratorConverter;

import ma.zs.alc.bean.core.common.Collaborator;


import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.bean.core.price.Price;
import ma.zs.alc.ws.dto.price.PriceDto;

@Component
public class PriceConverter extends AbstractConverter<Price, PriceDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter ;
    private boolean collaborator;

    public  PriceConverter() {
        super(Price.class, PriceDto.class);
        init(true);
    }

    @Override
    public Price toItem(PriceDto dto) {
        if (dto == null) {
            return null;
        } else {
        Price item = new Price();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getPrice()))
                item.setPrice(dto.getPrice());
            if(StringUtil.isNotEmpty(dto.getOldPrice()))
                item.setOldPrice(dto.getOldPrice());
            if(StringUtil.isNotEmpty(dto.getLib()))
                item.setLib(dto.getLib());
            if(StringUtil.isNotEmpty(dto.getNreCourse()))
                item.setNreCourse(dto.getNreCourse());
            if(StringUtil.isNotEmpty(dto.getNreHours()))
                item.setNreHours(dto.getNreHours());
            if(StringUtil.isNotEmpty(dto.getNreMonth()))
                item.setNreMonth(dto.getNreMonth());
            if(dto.getForGroup() != null)
                item.setForGroup(dto.getForGroup());
            if(dto.getCollaborator() != null && dto.getCollaborator().getId() != null){
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }




        return item;
        }
    }

    @Override
    public PriceDto toDto(Price item) {
        if (item == null) {
            return null;
        } else {
            PriceDto dto = new PriceDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getPrice()))
                dto.setPrice(item.getPrice());
            if(StringUtil.isNotEmpty(item.getOldPrice()))
                dto.setOldPrice(item.getOldPrice());
            if(StringUtil.isNotEmpty(item.getLib()))
                dto.setLib(item.getLib());
            if(StringUtil.isNotEmpty(item.getNreCourse()))
                dto.setNreCourse(item.getNreCourse());
            if(StringUtil.isNotEmpty(item.getNreHours()))
                dto.setNreHours(item.getNreHours());
            if(StringUtil.isNotEmpty(item.getNreMonth()))
                dto.setNreMonth(item.getNreMonth());
                dto.setForGroup(item.getForGroup());
            if(this.collaborator && item.getCollaborator()!=null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator())) ;

            }


        return dto;
        }
    }

    public void copy(PriceDto dto, Price t) {
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

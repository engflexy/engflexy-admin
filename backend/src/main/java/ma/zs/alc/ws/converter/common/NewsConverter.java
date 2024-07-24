package  ma.zs.alc.ws.converter.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.alc.ws.converter.vocab.CollaboratorConverter;

import ma.zs.alc.bean.core.common.Collaborator;


import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.common.News;
import ma.zs.alc.ws.dto.common.NewsDto;

@Component
public class NewsConverter extends AbstractConverter<News, NewsDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter ;
    private boolean collaborator;

    public  NewsConverter() {
        super(News.class, NewsDto.class);
        init(true);
    }

    @Override
    public News toItem(NewsDto dto) {
        if (dto == null) {
            return null;
        } else {
        News item = new News();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getRef()))
                item.setRef(dto.getRef());
            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if(StringUtil.isNotEmpty(dto.getImage()))
                item.setImage(dto.getImage());
            if(StringUtil.isNotEmpty(dto.getDescription()))
                item.setDescription(dto.getDescription());
            if(StringUtil.isNotEmpty(dto.getDateNews()))
                item.setDateNews(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_ENG_WITH_TIME_ZONE,dto.getDateNews()));
            if(StringUtil.isNotEmpty(dto.getDateDebut()))
                item.setDateDebut(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_ENG_WITH_TIME_ZONE,dto.getDateDebut()));
            if(StringUtil.isNotEmpty(dto.getDateFin()))
                item.setDateFin(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_ENG_WITH_TIME_ZONE,dto.getDateFin()));
            if(StringUtil.isNotEmpty(dto.getNumeroOrdre()))
                item.setNumeroOrdre(dto.getNumeroOrdre());
            if(StringUtil.isNotEmpty(dto.getDestinataire()))
                item.setDestinataire(dto.getDestinataire());
            if(dto.getCollaborator() != null && dto.getCollaborator().getId() != null){
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }




        return item;
        }
    }

    @Override
    public NewsDto toDto(News item) {
        if (item == null) {
            return null;
        } else {
            NewsDto dto = new NewsDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getRef()))
                dto.setRef(item.getRef());
            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if(StringUtil.isNotEmpty(item.getImage()))
                dto.setImage(item.getImage());
            if(StringUtil.isNotEmpty(item.getDescription()))
                dto.setDescription(item.getDescription());
            if(item.getDateNews()!=null)
                dto.setDateNews(DateUtil.dateTimeToString(item.getDateNews()));
            if(item.getDateDebut()!=null)
                dto.setDateDebut(DateUtil.dateTimeToString(item.getDateDebut()));
            if(item.getDateFin()!=null)
                dto.setDateFin(DateUtil.dateTimeToString(item.getDateFin()));
            if(StringUtil.isNotEmpty(item.getNumeroOrdre()))
                dto.setNumeroOrdre(item.getNumeroOrdre());
            if(StringUtil.isNotEmpty(item.getDestinataire()))
                dto.setDestinataire(item.getDestinataire());
            if(this.collaborator && item.getCollaborator()!=null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator())) ;

            }


        return dto;
        }
    }

    public void copy(NewsDto dto, News t) {
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

package ma.zs.alc.ws.converter.course;

import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.ws.converter.homework.HomeWorkConverter;
import ma.zs.alc.ws.converter.vocab.CollaboratorConverter;
import ma.zs.alc.ws.dto.course.ParcoursDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.zynerator.util.ListUtil;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ParcoursConverter extends AbstractConverter<Parcours, ParcoursDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter;
    @Autowired
    private SectionConverter sectionConverter;
    @Autowired
    private CoursConverter coursConverter;
    @Autowired
    private HomeWorkConverter homeWorkConverter;
    private boolean collaborator;
    private boolean courss;

    public ParcoursConverter() {
        super(Parcours.class, ParcoursDto.class);
        init(true);
    }

    @Override
    public Parcours toItem(ParcoursDto dto) {
        if (dto == null) {
            return null;
        } else {
            Parcours item = new Parcours();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if (StringUtil.isNotEmpty(dto.getDatePublication()))
                item.setDatePublication(DateUtil.stringEnToDate(dto.getDatePublication()));
            if (StringUtil.isNotEmpty(dto.getDateCreation()))
                item.setDateCreation(DateUtil.stringEnToDate(dto.getDateCreation()));
            if (StringUtil.isNotEmpty(dto.getDescription()))
                item.setDescription(dto.getDescription());


            if (StringUtil.isNotEmpty(dto.getCode()))
                item.setCode(dto.getCode());


            if (StringUtil.isNotEmpty(dto.getColor()))
                item.setColor(dto.getColor());


            if (StringUtil.isNotEmpty(dto.getUrl()))
                item.setUrl(dto.getUrl());


            if (StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if (StringUtil.isNotEmpty(dto.getNumeroOrder()))
                item.setNumeroOrder(dto.getNumeroOrder());
            if (StringUtil.isNotEmpty(dto.getNombreCours()))
                item.setNombreCours(dto.getNombreCours());
            if (dto.getCollaborator() != null && dto.getCollaborator().getId() != null) {
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }


            if (this.courss && ListUtil.isNotEmpty(dto.getCourss()))
                item.setCourss(coursConverter.toItem(dto.getCourss()));


            return item;
        }
    }

    @Override
    public ParcoursDto toDto(Parcours item) {
        if (item == null) {
            return null;
        } else {
            ParcoursDto dto = new ParcoursDto();
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if (item.getDatePublication() != null)
                dto.setDatePublication(DateUtil.dateTimeToString(item.getDatePublication()));
            if (item.getDateCreation() != null)
                dto.setDateCreation(DateUtil.dateTimeToString(item.getDateCreation()));
            if (StringUtil.isNotEmpty(item.getDescription()))
                dto.setDescription(item.getDescription());

            if (StringUtil.isNotEmpty(item.getCode()))
                dto.setCode(item.getCode());


            if (StringUtil.isNotEmpty(item.getColor()))
                dto.setColor(item.getColor());


            if (StringUtil.isNotEmpty(item.getUrl()))
                dto.setUrl(item.getUrl());


            if (StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());

            if (StringUtil.isNotEmpty(item.getNumeroOrder()))
                dto.setNumeroOrder(item.getNumeroOrder());
            if (StringUtil.isNotEmpty(item.getNombreCours()))
                dto.setNombreCours(item.getNombreCours());
            if (this.collaborator && item.getCollaborator() != null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator()));

            }
            if (this.courss && ListUtil.isNotEmpty(item.getCourss())) {
                coursConverter.init(true);
                coursConverter.setParcours(false);
                dto.setCourss(coursConverter.toDto(item.getCourss()));
                coursConverter.setParcours(true);

            }


            return dto;
        }
    }

    public void copy(ParcoursDto dto, Parcours t) {
        super.copy(dto, t);
        if (dto.getCourss() != null)
            t.setCourss(coursConverter.copy(dto.getCourss()));
        if (dto.getCollaborator() != null)
            collaboratorConverter.copy(dto.getCollaborator(), t.getCollaborator());
    }


    public void initList(boolean value) {
        this.courss = value;
    }

    public void initObject(boolean value) {
        this.collaborator = value;
    }


    public CollaboratorConverter getCollaboratorConverter() {
        return this.collaboratorConverter;
    }

    public void setCollaboratorConverter(CollaboratorConverter collaboratorConverter) {
        this.collaboratorConverter = collaboratorConverter;
    }

    public SectionConverter getSectionConverter() {
        return this.sectionConverter;
    }

    public void setSectionConverter(SectionConverter sectionConverter) {
        this.sectionConverter = sectionConverter;
    }

    public CoursConverter getCoursConverter() {
        return this.coursConverter;
    }

    public void setCoursConverter(CoursConverter coursConverter) {
        this.coursConverter = coursConverter;
    }

    public HomeWorkConverter getHomeWorkConverter() {
        return this.homeWorkConverter;
    }

    public void setHomeWorkConverter(HomeWorkConverter homeWorkConverter) {
        this.homeWorkConverter = homeWorkConverter;
    }

    public boolean isCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(boolean collaborator) {
        this.collaborator = collaborator;
    }

    public boolean isCourss() {
        return this.courss;
    }

    public void setCourss(boolean courss) {
        this.courss = courss;
    }
}

package ma.zs.alc.ws.converter.collab;

import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.ws.converter.inscriptionref.LangueConverter;
import ma.zs.alc.ws.dto.collab.CollaboratorDto;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ma.zs.alc.zynerator.util.ListUtil;

import ma.zs.alc.ws.converter.course.ParcoursConverter;
import ma.zs.alc.ws.converter.course.CoursConverter;


import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;

import java.util.Collection;

@Component
public class CollaboratorConverter extends AbstractConverter<Collaborator, CollaboratorDto> {

    @Autowired
    private LangueConverter langueConverter;
    @Autowired
    private ParcoursConverter parcoursConverter;
    @Autowired
    private CoursConverter coursConverter;
    @Autowired
    private ManagerConverter managerConverter;
    private boolean parcourss;
    private boolean langue;
    private boolean managers;

    public CollaboratorConverter() {
        super(Collaborator.class, CollaboratorDto.class);
        init(true);
    }

    @Override
    public Collaborator toItem(CollaboratorDto dto) {
        if (dto == null) {
            return null;
        } else {
            Collaborator item = new Collaborator();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if (StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if (StringUtil.isNotEmpty(dto.getDescription()))
                item.setDescription(dto.getDescription());
            item.setCredentialsNonExpired(dto.getCredentialsNonExpired());
            item.setEnabled(dto.getEnabled());
            item.setAccountNonExpired(dto.getAccountNonExpired());
            item.setAccountNonLocked(dto.getAccountNonLocked());
            item.setPasswordChanged(dto.getPasswordChanged());
            if (StringUtil.isNotEmpty(dto.getUsername()))
                item.setUsername(dto.getUsername());
            if (StringUtil.isNotEmpty(dto.getPassword()))
                item.setPassword(dto.getPassword());
            if (StringUtil.isNotEmpty(dto.getAvatar()))
                item.setAvatar(dto.getAvatar());
            if (StringUtil.isNotEmpty(dto.getFullName()))
                item.setFullName(dto.getFullName());
            if (StringUtil.isNotEmpty(dto.getAbout()))
                item.setAbout(dto.getAbout());

            if (StringUtil.isNotEmpty(dto.getPhone()))
                item.setPhone(dto.getPhone());

            if (StringUtil.isNotEmpty(dto.getEmail()))
                item.setEmail(dto.getEmail());

            if (StringUtil.isNotEmpty(dto.getCountry()))
                item.setCountry(dto.getCountry());

            if (this.langue && dto.getLangue()!=null)
                item.setLangue(langueConverter.toItem(dto.getLangue()));

            item.setCountry(dto.getCountry());

            if (this.parcourss && ListUtil.isNotEmpty(dto.getParcourss()))
                item.setParcourss(parcoursConverter.toItem(dto.getParcourss()));
            if (this.managers && ListUtil.isNotEmpty(dto.getManagers()))
                item.setManagers(managerConverter.toItem(dto.getManagers()));

            //item.setRoles(dto.getRoles());

            return item;
        }
    }

    @Override
    public CollaboratorDto toDto(Collaborator item) {
        if (item == null) {
            return null;
        } else {
            CollaboratorDto dto = new CollaboratorDto();
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if (StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if (StringUtil.isNotEmpty(item.getDescription()))
                dto.setDescription(item.getDescription());
            if (StringUtil.isNotEmpty(item.getCredentialsNonExpired()))
                dto.setCredentialsNonExpired(item.getCredentialsNonExpired());
            if (StringUtil.isNotEmpty(item.getEnabled()))
                dto.setEnabled(item.getEnabled());
            if (StringUtil.isNotEmpty(item.getAccountNonExpired()))
                dto.setAccountNonExpired(item.getAccountNonExpired());
            if (StringUtil.isNotEmpty(item.getAccountNonLocked()))
                dto.setAccountNonLocked(item.getAccountNonLocked());
            if (StringUtil.isNotEmpty(item.getPasswordChanged()))
                dto.setPasswordChanged(item.getPasswordChanged());
            if (StringUtil.isNotEmpty(item.getUsername()))
                dto.setUsername(item.getUsername());
            if (StringUtil.isNotEmpty(item.getAvatar()))
                dto.setAvatar(item.getAvatar());
            if (StringUtil.isNotEmpty(item.getFullName()))
                dto.setFullName(item.getFullName());
            if (StringUtil.isNotEmpty(item.getPhone()))
                dto.setPhone(item.getPhone());
            if (StringUtil.isNotEmpty(item.getEmail()))
                dto.setEmail(item.getEmail());
            if (StringUtil.isNotEmpty(item.getAbout()))
                dto.setAbout(item.getAbout());
            if (this.parcourss && ListUtil.isNotEmpty(item.getParcourss())) {
                parcoursConverter.init(true);
                parcoursConverter.setCollaborator(false);
                dto.setParcourss(parcoursConverter.toDto(item.getParcourss()));
                parcoursConverter.setCollaborator(true);

            }
            if (this.managers && ListUtil.isNotEmpty(item.getManagers())) {
                managerConverter.init(true);
                managerConverter.setCollaborator(false);
                dto.setManagers(managerConverter.toDto(item.getManagers()));
                managerConverter.setCollaborator(true);

            }
            if (this.langue && item.getLangue()!=null)
                dto.setLangue(langueConverter.toDto(item.getLangue()));

            dto.setCountry(item.getCountry());


            return dto;
        }
    }

    public void copy(CollaboratorDto dto, Collaborator t) {
        super.copy(dto, t);
        if (dto.getParcourss() != null)
            t.setParcourss(parcoursConverter.copy(dto.getParcourss()));
        if (dto.getManagers() != null)
            t.setManagers(managerConverter.copy(dto.getManagers()));
        if (dto.getLangue() != null)
           BeanUtils.copyProperties(t.getLangue(),dto.getLangue());
    }


    public void initList(boolean value) {
        this.parcourss = value;
        this.managers = value;
    }

    public void initObject(boolean value) {
        langue = true;
    }


    public ParcoursConverter getParcoursConverter() {
        return this.parcoursConverter;
    }

    public void setParcoursConverter(ParcoursConverter parcoursConverter) {
        this.parcoursConverter = parcoursConverter;
    }

    public CoursConverter getCoursConverter() {
        return this.coursConverter;
    }

    public void setCoursConverter(CoursConverter coursConverter) {
        this.coursConverter = coursConverter;
    }

    public ManagerConverter getManagerConverter() {
        return this.managerConverter;
    }

    public void setManagerConverter(ManagerConverter managerConverter) {
        this.managerConverter = managerConverter;
    }

    public boolean isParcourss() {
        return this.parcourss;
    }

    public void setParcourss(boolean parcourss) {
        this.parcourss = parcourss;
    }

    public boolean isManagers() {
        return this.managers;
    }

    public void setManagers(boolean managers) {
        this.managers = managers;
    }

    public boolean isLangue() {
        return langue;
    }

    public void setLangue(boolean langue) {
        this.langue = langue;
    }
}

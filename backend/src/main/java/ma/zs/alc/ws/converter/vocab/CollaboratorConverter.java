package ma.zs.alc.ws.converter.vocab;

import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.ws.converter.course.CoursConverter;
import ma.zs.alc.ws.converter.course.ParcoursConverter;
import ma.zs.alc.ws.converter.prof.TypeCollaboratorConverter;
import ma.zs.alc.ws.dto.vocab.CollaboratorDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.ListUtil;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CollaboratorConverter extends AbstractConverter<Collaborator, CollaboratorDto> {

    @Autowired
    private ParcoursConverter parcoursConverter;
    @Autowired
    private CoursConverter coursConverter;
    @Autowired
    private TypeCollaboratorConverter typeCollaboratorConverter;
    private boolean typeCollaborator;
    private boolean parcourss;

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
            if (this.typeCollaborator && dto.getTypeCollaborator() != null)
                item.setTypeCollaborator(typeCollaboratorConverter.toItem(dto.getTypeCollaborator()));
            if (dto.getCredentialsNonExpired() != null)
                item.setCredentialsNonExpired(dto.getCredentialsNonExpired());
            if (dto.getEnabled() != null)
                item.setEnabled(dto.getEnabled());
            if (StringUtil.isNotEmpty(dto.getEmail()))
                item.setEmail(dto.getEmail());
            if (dto.getAccountNonExpired() != null)
                item.setAccountNonExpired(dto.getAccountNonExpired());
            if (dto.getAccountNonLocked() != null)
                item.setAccountNonLocked(dto.getAccountNonLocked());
            if (StringUtil.isNotEmpty(dto.getUsername()))
                item.setUsername(dto.getUsername());
            if (dto.getPasswordChanged() != null)
                item.setPasswordChanged(dto.getPasswordChanged());
            if (StringUtil.isNotEmpty(dto.getFullName()))
                item.setFullName(dto.getFullName());
            if (StringUtil.isNotEmpty(dto.getPhone()))
                item.setPhone(dto.getPhone());
            if (this.parcourss && ListUtil.isNotEmpty(dto.getParcourss()))
                item.setParcourss(parcoursConverter.toItem(dto.getParcourss()));

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

            if (StringUtil.isNotEmpty(item.getFullName()))
                dto.setFullName(item.getFullName());

            if (this.typeCollaborator && item.getTypeCollaborator() != null) {
                dto.setTypeCollaborator(typeCollaboratorConverter.toDto(item.getTypeCollaborator()));

            }
            if (this.parcourss && ListUtil.isNotEmpty(item.getParcourss())) {
                parcoursConverter.init(true);
                parcoursConverter.setCollaborator(false);
                dto.setParcourss(parcoursConverter.toDto(item.getParcourss()));
                parcoursConverter.setCollaborator(true);

            }


            return dto;
        }
    }

    public void copy(CollaboratorDto dto, Collaborator t) {
        super.copy(dto, t);
        if (dto.getTypeCollaborator() != null)
            typeCollaboratorConverter.copy(dto.getTypeCollaborator(), t.getTypeCollaborator());
        if (dto.getParcourss() != null)
            t.setParcourss(parcoursConverter.copy(dto.getParcourss()));
    }


    public void initList(boolean value) {
        this.parcourss = value;
    }

    public void initObject(boolean value) {
        this.typeCollaborator = value;
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

    public TypeCollaboratorConverter getTypeCollaboratorConverter() {
        return this.typeCollaboratorConverter;
    }

    public void setTypeCollaboratorConverter(TypeCollaboratorConverter typeCollaboratorConverter) {
        this.typeCollaboratorConverter = typeCollaboratorConverter;
    }

    public boolean isTypeCollaborator() {
        return this.typeCollaborator;
    }

    public void setTypeCollaborator(boolean typeCollaborator) {
        this.typeCollaborator = typeCollaborator;
    }

    public boolean isParcourss() {
        return this.parcourss;
    }

    public void setParcourss(boolean parcourss) {
        this.parcourss = parcourss;
    }
}

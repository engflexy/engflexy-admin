package ma.zs.alc.ws.converter.collab;

import ma.zs.alc.bean.core.collab.Manager;
import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.ws.dto.collab.ManagerDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ManagerConverter extends AbstractConverter<Manager, ManagerDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter;
    private boolean collaborator;

    public ManagerConverter() {
        super(Manager.class, ManagerDto.class);
        init(true);
    }

    @Override
    public Manager toItem(ManagerDto dto) {
        if (dto == null) {
            return null;
        } else {
            Manager item = new Manager();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
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
            if (dto.getCollaborator() != null && dto.getCollaborator().getId() != null) {
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }


            //item.setRoles(dto.getRoles());

            return item;
        }
    }

    @Override
    public ManagerDto toDto(Manager item) {
        if (item == null) {
            return null;
        } else {
            ManagerDto dto = new ManagerDto();
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
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
            if (StringUtil.isNotEmpty(item.getAbout()))
                dto.setAbout(item.getAbout());
            if (this.collaborator && item.getCollaborator() != null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator()));

            }


            return dto;
        }
    }

    public void copy(ManagerDto dto, Manager t) {
        super.copy(dto, t);
        if (t.getCollaborator() == null && dto.getCollaborator() != null) {
            t.setCollaborator(new Collaborator());
        }
        if (dto.getCollaborator() != null)
            collaboratorConverter.copy(dto.getCollaborator(), t.getCollaborator());
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

    public boolean isCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(boolean collaborator) {
        this.collaborator = collaborator;
    }
}

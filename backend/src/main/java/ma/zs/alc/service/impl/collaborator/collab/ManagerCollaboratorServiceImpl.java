package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.Manager;
import ma.zs.alc.dao.criteria.core.collab.ManagerCriteria;
import ma.zs.alc.dao.facade.core.collab.ManagerDao;
import ma.zs.alc.dao.specification.core.collab.ManagerSpecification;
import ma.zs.alc.service.facade.collaborator.collab.ManagerCollaboratorService;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.service.facade.ModelPermissionUserService;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ManagerCollaboratorServiceImpl extends AbstractServiceImpl<Manager, ManagerCriteria, ManagerDao> implements ManagerCollaboratorService {







    public void findOrSaveAssociatedObject(Manager t){
        if( t != null) {
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Manager> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }





    @Override
    public Manager create(Manager t) {
        if (findByUsername(t.getUsername()) != null || t.getPassword() == null) return null;
        t.setPassword(userService.cryptPassword(t.getPassword()));
        t.setEnabled(true);
        t.setAccountNonExpired(true);
        t.setAccountNonLocked(true);
        t.setCredentialsNonExpired(true);
        t.setPasswordChanged(false);

        Role role = new Role();
        role.setAuthority(AuthoritiesConstants.COLLABORATOR);
        role.setCreatedAt(LocalDateTime.now());
        roleService.create(role);
        RoleUser roleUser = new RoleUser();
        roleUser.setRole(role);
        if (t.getRoleUsers() == null)
        t.setRoleUsers(new ArrayList<>());

        t.getRoleUsers().add(roleUser);
        if (t.getModelPermissionUsers() == null)
        t.setModelPermissionUsers(new ArrayList<>());

        t.setModelPermissionUsers(modelPermissionUserService.initModelPermissionUser());

        Manager mySaved = (Manager) userService.create(t);

        return mySaved;
     }

    public Manager findByUsername(String username){
    return dao.findByUsername(username);
    }

    public boolean changePassword(String username, String newPassword) {
    return userService.changePassword(username, newPassword);
    }

    public void configure() {
        super.configure(Manager.class, ManagerSpecification.class);
    }

    private @Autowired UserService userService;
    private @Autowired RoleService roleService;
    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private CollaboratorCollaboratorService collaboratorService ;

    public ManagerCollaboratorServiceImpl(ManagerDao dao) {
        super(dao);
    }

}
package ma.zs.alc.service.impl.manager.collab;


import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.CollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.CollaboratorSpecification;
import ma.zs.alc.service.facade.manager.collab.CollaboratorManagerService;
import ma.zs.alc.service.facade.manager.collab.ManagerManagerService;
import ma.zs.alc.service.facade.manager.course.ParcoursManagerService;
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

@Service
public class CollaboratorManagerServiceImpl extends AbstractServiceImpl<Collaborator, CollaboratorCriteria, CollaboratorDao> implements CollaboratorManagerService {













    @Override
    public Collaborator create(Collaborator t) {
        if (findByUsername(t.getUsername()) != null || t.getPassword() == null) return null;
        t.setPassword(userService.cryptPassword(t.getPassword()));
        t.setEnabled(true);
        t.setAccountNonExpired(true);
        t.setAccountNonLocked(true);
        t.setCredentialsNonExpired(true);
        t.setPasswordChanged(false);

        Role role = new Role();
        role.setAuthority(AuthoritiesConstants.MANAGER);
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

        Collaborator mySaved = (Collaborator) userService.create(t);

        if (t.getParcourss() != null) {
        t.getParcourss().forEach(element-> {
            element.setCollaborator(mySaved);
            parcoursService.create(element);
        });
        }
        if (t.getManagers() != null) {
        t.getManagers().forEach(element-> {
            element.setCollaborator(mySaved);
            managerService.create(element);
        });
        }
        return mySaved;
     }

    public Collaborator findByUsername(String username){
    return dao.findByUsername(username);
    }

    public boolean changePassword(String username, String newPassword) {
    return userService.changePassword(username, newPassword);
    }

    public void configure() {
        super.configure(Collaborator.class, CollaboratorSpecification.class);
    }

    private @Autowired UserService userService;
    private @Autowired RoleService roleService;
    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private ParcoursManagerService parcoursService ;
    @Autowired
    private ManagerManagerService managerService ;

    public CollaboratorManagerServiceImpl(CollaboratorDao dao) {
        super(dao);
    }

}

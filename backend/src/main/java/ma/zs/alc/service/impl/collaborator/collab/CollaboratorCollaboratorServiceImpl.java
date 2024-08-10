package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.collab.TypeCollaborator;
import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.CollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.CollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.collab.TypeCollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.service.facade.ModelPermissionUserService;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.service.facade.RoleUserService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.transverse.emailling.EmailRequest;
import ma.zs.alc.zynerator.transverse.emailling.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CollaboratorCollaboratorServiceImpl extends AbstractServiceImpl<Collaborator, CollaboratorCriteria, CollaboratorDao> implements CollaboratorCollaboratorService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public boolean deleteById(Long id) {
        modelPermissionUserService.deleteByUserId(id);
        roleUserService.deleteByUserIdForCollaborator(id);
        dao.deleteById(id);
        return true;
    }

    public void findOrSaveAssociatedObject(Collaborator t) {
        if (t != null) {
            t.setTypeCollaborator(typeCollaboratorService.findOrSave(t.getTypeCollaborator()));
        }
    }

    public List<Collaborator> findByTypeCollaboratorId(Long id) {
        return dao.findByTypeCollaboratorId(id);
    }

    public int deleteByTypeCollaboratorId(Long id) {
        return dao.deleteByTypeCollaboratorId(id);
    }

    public long countByTypeCollaboratorCode(String code) {
        return dao.countByTypeCollaboratorCode(code);
    }

    @Override
    public boolean findByUsernameAndValidationCode(String username, String validationCode) {
        if (username == null || validationCode == null) {
            return false;
        }
        User user = dao.findByUsername(username);
        return user != null && validationCode.equals(user.getValidationCode());
    }


    @Override
    public Collaborator create(Collaborator t) {
        t.setValidationCode(System.currentTimeMillis() + "");
        System.out.println("hanaaaaa");
        if (findByUsername(t.getUsername()) != null || t.getPassword() == null)
            return null;
        t.setPassword(userService.cryptPassword(t.getPassword()));
        t.setEnabled(true);
        t.setAccountNonExpired(true);
        t.setAccountNonLocked(true);
        t.setCredentialsNonExpired(true);
        t.setPasswordChanged(false);

        Role role = new Role();
        role.setAuthority(AuthoritiesConstants.COLLABORATOR);
        role.setCreatedAt(LocalDateTime.now());
        Role savedRole = roleService.findOrSave(role);
        RoleUser roleUser = new RoleUser();
        roleUser.setRole(savedRole);


        if (t.getRoleUsers() == null) t.setRoleUsers(new ArrayList<>());

        t.getRoleUsers().add(roleUser);
        if (t.getModelPermissionUsers() == null) t.setModelPermissionUsers(new ArrayList<>());

        if (t.getTypeCollaborator() != null) {
            TypeCollaborator type = typeCollaboratorService.findOrSave(t.getTypeCollaborator());
            t.setTypeCollaborator(type);
        }

        //       t.setModelPermissionUsers(modelPermissionUserService.initModelPermissionUser());

        Collaborator mySaved = (Collaborator) userService.create(t);

        if (t.getParcourss() != null) {
            t.getParcourss().forEach(element -> {
                element.setCollaborator(mySaved);
                parcoursService.create(element);
            });
        }
        emailService.sendSimpleMessage(new EmailRequest("Engflexy Verficiation Code","Your username is "+t.getUsername()+" your verification code is "+t.getValidationCode(),t.getEmail()));
        return mySaved;
    }

    public Collaborator findByUsername(String username) {
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
    private @Autowired RoleUserService roleUserService;

    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private ParcoursCollaboratorService parcoursService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private TypeCollaboratorCollaboratorService typeCollaboratorService;

    public CollaboratorCollaboratorServiceImpl(CollaboratorDao dao) {
        super(dao);
    }

}

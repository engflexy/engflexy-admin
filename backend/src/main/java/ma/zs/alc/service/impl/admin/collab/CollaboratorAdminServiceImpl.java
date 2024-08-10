package ma.zs.alc.service.impl.admin.collab;


import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.collab.TypeCollaborator;
import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.CollaboratorDao;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.dao.specification.core.collab.CollaboratorSpecification;
import ma.zs.alc.service.facade.admin.collab.CollaboratorAdminService;
import ma.zs.alc.service.facade.admin.collab.TypeCollaboratorAdminService;
import ma.zs.alc.service.facade.admin.course.ParcoursAdminService;
import ma.zs.alc.service.facade.collaborator.inscriptionref.LangueCollaboratorService;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.service.facade.ModelPermissionUserService;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.transverse.emailling.EmailRequest;
import ma.zs.alc.zynerator.transverse.emailling.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CollaboratorAdminServiceImpl extends AbstractServiceImpl<Collaborator, CollaboratorCriteria, CollaboratorDao> implements CollaboratorAdminService {


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
    public Page<UserPageable> findAllByCriteria(Pageable pageable) {
        return dao.findAllByCriteria(pageable);
    }


    @Override
    public Collaborator create(Collaborator t) {
        if (t.getUsername() == null || findByUsername(t.getUsername()) != null)
            return null;
        t.setPassword(t.getUsername());
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

        t.setModelPermissionUsers(modelPermissionUserService.initModelPermissionUser());
        if (t.getTypeCollaborator() != null) {
            TypeCollaborator type = typeCollaboratorService.findOrSave(t.getTypeCollaborator());
            t.setTypeCollaborator(type);
        }

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

    @Override
    public Collaborator update(Collaborator t) {
        Collaborator collaborator = this.findById(t.getId());
        if (collaborator == null) {
            throw new RuntimeException("Account not found.");
        } else {
            collaborator.setFullName(t.getFullName());
            collaborator.setAvatar(t.getAvatar());
            collaborator.setEmail(t.getEmail());
            collaborator.setPhone(t.getPhone());
            collaborator.setCountry(t.getCountry());
            collaborator.setAbout(t.getAbout());
            collaborator.setLibelle(t.getLibelle());
            collaborator.setDescription(t.getDescription());

            if (t.getLangue() != null && t.getLangue().getId() != null) {
                Langue langue = langueService.findById(t.getLangue().getId());
                collaborator.setLangue(langue);
            }

            if (t.getTypeCollaborator() != null && t.getTypeCollaborator().getId() != null) {
                TypeCollaborator type = typeCollaboratorService.findById(t.getTypeCollaborator().getId());
                collaborator.setTypeCollaborator(type);
            }

            return dao.save(collaborator);
        }
    }

    public Collaborator findByUsername(String username) {
        return dao.findByUsername(username);
    }

    public boolean changePassword(String username, String newPassword) {
        return userService.changePassword(username, newPassword);
    }

    public List<Collaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }

    public void configure() {
        super.configure(Collaborator.class, CollaboratorSpecification.class);
    }

    private @Autowired UserService userService;
    private @Autowired RoleService roleService;
    private @Autowired ModelPermissionUserService modelPermissionUserService;
    @Autowired
    private LangueCollaboratorService langueService;

    @Autowired
    private ParcoursAdminService parcoursService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private TypeCollaboratorAdminService typeCollaboratorService;

    public CollaboratorAdminServiceImpl(CollaboratorDao dao) {
        super(dao);
    }

}

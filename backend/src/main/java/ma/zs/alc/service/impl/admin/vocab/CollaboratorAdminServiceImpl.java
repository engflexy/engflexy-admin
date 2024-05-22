package ma.zs.alc.service.impl.admin.vocab;


import ma.zs.alc.bean.core.vocab.Collaborator;
import ma.zs.alc.dao.criteria.core.vocab.CollaboratorCriteria;
import ma.zs.alc.dao.facade.core.vocab.CollaboratorDao;
import ma.zs.alc.dao.specification.core.vocab.CollaboratorSpecification;
import ma.zs.alc.service.facade.admin.vocab.CollaboratorAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.service.facade.admin.course.ParcoursAdminService ;
import ma.zs.alc.bean.core.course.Parcours ;
import ma.zs.alc.service.facade.admin.prof.TypeCollaboratorAdminService ;
import ma.zs.alc.bean.core.prof.TypeCollaborator ;

import java.time.LocalDateTime;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.service.facade.ModelPermissionUserService;
import java.util.Collection;
import java.util.List;
@Service
public class CollaboratorAdminServiceImpl extends AbstractServiceImpl<Collaborator, CollaboratorCriteria, CollaboratorDao> implements CollaboratorAdminService {






    public void findOrSaveAssociatedObject(Collaborator t){
        if( t != null) {
            t.setTypeCollaborator(typeCollaboratorService.findOrSave(t.getTypeCollaborator()));
        }
    }

    public List<Collaborator> findByTypeCollaboratorId(Long id){
        return dao.findByTypeCollaboratorId(id);
    }
    public int deleteByTypeCollaboratorId(Long id){
        return dao.deleteByTypeCollaboratorId(id);
    }
    public long countByTypeCollaboratorCode(String code){
        return dao.countByTypeCollaboratorCode(code);
    }





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
        role.setAuthority(AuthoritiesConstants.ADMIN);
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
    private ParcoursAdminService parcoursService ;
    @Autowired
    private TypeCollaboratorAdminService typeCollaboratorService ;

    public CollaboratorAdminServiceImpl(CollaboratorDao dao) {
        super(dao);
    }

}
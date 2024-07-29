package ma.zs.alc.service.impl.manager.prof;


import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.dao.criteria.core.prof.ProfCriteria;
import ma.zs.alc.dao.facade.core.prof.ProfDao;
import ma.zs.alc.dao.specification.core.prof.ProfSpecification;
import ma.zs.alc.service.facade.manager.collab.CollaboratorManagerService;
import ma.zs.alc.service.facade.manager.course.ParcoursManagerService;
import ma.zs.alc.service.facade.manager.prof.CategorieProfManagerService;
import ma.zs.alc.service.facade.manager.prof.ProfManagerService;
import ma.zs.alc.service.facade.manager.prof.TrancheHoraireProfManagerService;
import ma.zs.alc.service.facade.manager.prof.TypeTeacherManagerService;
import ma.zs.alc.service.facade.manager.recomrecla.RecommendTeacherManagerService;
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
public class ProfManagerServiceImpl extends AbstractServiceImpl<Prof, ProfCriteria, ProfDao> implements ProfManagerService {







    public Prof findByReferenceEntity(Prof t){
        return t==null? null : dao.findByRef(t.getRef());
    }
    public void findOrSaveAssociatedObject(Prof t){
        if( t != null) {
            t.setParcours(parcoursService.findOrSave(t.getParcours()));
            t.setCategorieProf(categorieProfService.findOrSave(t.getCategorieProf()));
            t.setTypeTeacher(typeTeacherService.findOrSave(t.getTypeTeacher()));
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Prof> findByParcoursId(Long id){
        return dao.findByParcoursId(id);
    }
    public int deleteByParcoursId(Long id){
        return dao.deleteByParcoursId(id);
    }
    public long countByParcoursCode(String code){
        return dao.countByParcoursCode(code);
    }
    public List<Prof> findByCategorieProfId(Long id){
        return dao.findByCategorieProfId(id);
    }
    public int deleteByCategorieProfId(Long id){
        return dao.deleteByCategorieProfId(id);
    }
    public long countByCategorieProfCode(String code){
        return dao.countByCategorieProfCode(code);
    }
    public List<Prof> findByTypeTeacherId(Long id){
        return dao.findByTypeTeacherId(id);
    }
    public int deleteByTypeTeacherId(Long id){
        return dao.deleteByTypeTeacherId(id);
    }
    public long countByTypeTeacherCode(String code){
        return dao.countByTypeTeacherCode(code);
    }
    public List<Prof> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }

    public List<Prof> findAllOptimized() {
        return dao.findAllOptimized();
    }




    @Override
    public Prof create(Prof t) {
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

        Prof mySaved = (Prof) userService.create(t);

        if (t.getTrancheHoraireProfs() != null) {
        t.getTrancheHoraireProfs().forEach(element-> {
            element.setProf(mySaved);
            trancheHoraireProfService.create(element);
        });
        }
        if (t.getRecommendTeachers() != null) {
        t.getRecommendTeachers().forEach(element-> {
            element.setProf(mySaved);
            recommendTeacherService.create(element);
        });
        }
        return mySaved;
     }

    public Prof findByUsername(String username){
    return dao.findByUsername(username);
    }

    public boolean changePassword(String username, String newPassword) {
    return userService.changePassword(username, newPassword);
    }

    public void configure() {
        super.configure(Prof.class, ProfSpecification.class);
    }

    private @Autowired UserService userService;
    private @Autowired RoleService roleService;
    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private CollaboratorManagerService collaboratorService ;
    @Autowired
    private ParcoursManagerService parcoursService ;
    @Autowired
    private TypeTeacherManagerService typeTeacherService ;
    @Autowired
    private RecommendTeacherManagerService recommendTeacherService ;
    @Autowired
    private CategorieProfManagerService categorieProfService ;
    @Autowired
    private TrancheHoraireProfManagerService trancheHoraireProfService ;

    public ProfManagerServiceImpl(ProfDao dao) {
        super(dao);
    }

}

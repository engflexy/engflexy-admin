package ma.zs.alc.service.impl.collaborator.prof;


import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.dao.criteria.core.prof.ProfCriteria;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.dao.facade.core.prof.ProfDao;
import ma.zs.alc.dao.specification.core.prof.ProfSpecification;
import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.inscriptionref.LangueCollaboratorService;
import ma.zs.alc.service.facade.collaborator.prof.CategorieProfCollaboratorService;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService;
import ma.zs.alc.service.facade.collaborator.prof.TrancheHoraireProfCollaboratorService;
import ma.zs.alc.service.facade.collaborator.prof.TypeTeacherCollaboratorService;
import ma.zs.alc.service.facade.collaborator.recomrecla.RecommendTeacherCollaboratorService;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.service.facade.ModelPermissionUserService;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProfCollaboratorServiceImpl extends AbstractServiceImpl<Prof, ProfCriteria, ProfDao> implements ProfCollaboratorService {


    public Prof findByReferenceEntity(Prof t) {
        return t == null ? null : dao.findByRef(t.getRef());
    }

    public void findOrSaveAssociatedObject(Prof t) {
        if (t != null) {
            t.setParcours(parcoursService.findOrSave(t.getParcours()));
            t.setCategorieProf(categorieProfService.findOrSave(t.getCategorieProf()));
            t.setTypeTeacher(typeTeacherService.findOrSave(t.getTypeTeacher()));
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Prof> findByParcoursId(Long id) {
        return dao.findByParcoursId(id);
    }

    public int deleteByParcoursId(Long id) {
        return dao.deleteByParcoursId(id);
    }

    public long countByParcoursCode(String code) {
        return dao.countByParcoursCode(code);
    }

    public List<Prof> findByCategorieProfId(Long id) {
        return dao.findByCategorieProfId(id);
    }

    public int deleteByCategorieProfId(Long id) {
        return dao.deleteByCategorieProfId(id);
    }

    public long countByCategorieProfCode(String code) {
        return dao.countByCategorieProfCode(code);
    }

    public List<Prof> findByTypeTeacherId(Long id) {
        return dao.findByTypeTeacherId(id);
    }

    public int deleteByTypeTeacherId(Long id) {
        return dao.deleteByTypeTeacherId(id);
    }

    public long countByTypeTeacherCode(String code) {
        return dao.countByTypeTeacherCode(code);
    }

    public List<Prof> findByCollaboratorId(Long id) {
        return dao.findByCollaboratorId(id);
    }

    @Override
    public Page<UserPageable> findByCollaboratorId(Long id, Pageable pageable) {
        return dao.findByCollaboratorId(id, pageable);
    }


    public int deleteByCollaboratorId(Long id) {
        return dao.deleteByCollaboratorId(id);
    }

    public long countByCollaboratorId(Long id) {
        return dao.countByCollaboratorId(id);
    }

    public List<Prof> findAllOptimized() {
        List<Prof> allOptimized = dao.findAllOptimized();
        return allOptimized;
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
        role.setAuthority(AuthoritiesConstants.TEACHER);
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
            t.getTrancheHoraireProfs().forEach(element -> {
                element.setProf(mySaved);
                trancheHoraireProfService.create(element);
            });
        }
        if (t.getRecommendTeachers() != null) {
            t.getRecommendTeachers().forEach(element -> {
                element.setProf(mySaved);
                recommendTeacherService.create(element);
            });
        }
        return mySaved;
    }

    @Override
    public Prof update(Prof t) {
        Prof prof = this.findById(t.getId());
        if (prof == null) {
            throw new RuntimeException("Account not found.");
        } else {
            prof.setFullName(t.getFullName());
            prof.setAvatar(t.getAvatar());
            prof.setEmail(t.getEmail());
            prof.setPhone(t.getPhone());
            prof.setCountry(t.getCountry());
            prof.setAbout(t.getAbout());

            if (t.getLangue() != null && t.getLangue().getId() != null) {
                Langue langue = langueService.findById(t.getLangue().getId());
                prof.setLangue(langue);
            }
            return dao.save(prof);
        }
    }

    public Prof findByUsername(String username) {
        return dao.findByUsername(username);
    }

    @Override
    public boolean changePassword(String username, String newPassword) {
        Prof prof = findByUsername(username);
        if (prof != null) {
            prof.setPassword(newPassword);
            dao.save(prof);
            return true;
        }
        return false;
    }
    @Override
    public boolean updatePasswordChangedStatus(Long id, boolean passwordChanged) {
        Prof prof = findById(id);
        if (prof != null) {
            prof.setPasswordChanged(passwordChanged);
            dao.save(prof);
            return true;
        }
        return false;
    }
    @Override
    public boolean updateCredentialsNonExpiredStatus(Long id, boolean credentialsNonExpired) {
        Prof prof = findById(id);
        if (prof != null) {
            prof.setCredentialsNonExpired(credentialsNonExpired);
            dao.save(prof);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAccountStatus(Long id, boolean enabled) {
        Prof prof = findById(id);
        if (prof != null) {
            prof.setEnabled(enabled);
            dao.save(prof);
            return true;
        }
        return false;
    }
    @Override
    public boolean updateAccountNonExpiredStatus(Long id, boolean accountNonExpired) {
        Prof prof = findById(id);
        if (prof != null) {
            prof.setAccountNonExpired(accountNonExpired);
            dao.save(prof);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAccountLockStatus(Long id, boolean accountNonLocked) {
        Prof prof = findById(id);
        if (prof != null) {
            prof.setAccountNonLocked(accountNonLocked);
            dao.save(prof);
            return true;
        }
        return false;
    }
    public void configure() {
        super.configure(Prof.class, ProfSpecification.class);
    }

    private @Autowired UserService userService;
    private @Autowired RoleService roleService;
    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private CollaboratorCollaboratorService collaboratorService;
    @Autowired
    private ParcoursCollaboratorService parcoursService;
    @Autowired
    private TypeTeacherCollaboratorService typeTeacherService;
    @Autowired
    private RecommendTeacherCollaboratorService recommendTeacherService;
    @Autowired
    private CategorieProfCollaboratorService categorieProfService;
    @Autowired
    private TrancheHoraireProfCollaboratorService trancheHoraireProfService;
    @Autowired
    private LangueCollaboratorService langueService;

    public ProfCollaboratorServiceImpl(ProfDao dao) {
        super(dao);
    }

}

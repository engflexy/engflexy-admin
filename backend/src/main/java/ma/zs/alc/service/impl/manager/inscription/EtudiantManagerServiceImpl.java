package ma.zs.alc.service.impl.manager.inscription;


import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.dao.criteria.core.inscription.EtudiantCriteria;
import ma.zs.alc.dao.facade.core.inscription.EtudiantDao;
import ma.zs.alc.dao.specification.core.inscription.EtudiantSpecification;
import ma.zs.alc.service.facade.manager.collab.CollaboratorManagerService;
import ma.zs.alc.service.facade.manager.course.ParcoursManagerService;
import ma.zs.alc.service.facade.manager.grpe.GroupeEtudeManagerService;
import ma.zs.alc.service.facade.manager.grpe.GroupeEtudiantDetailManagerService;
import ma.zs.alc.service.facade.manager.inscription.EtudiantManagerService;
import ma.zs.alc.service.facade.manager.inscriptionref.*;
import ma.zs.alc.service.facade.manager.pack.PackStudentManagerService;
import ma.zs.alc.service.facade.manager.quizetudiant.QuizEtudiantManagerService;
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
public class EtudiantManagerServiceImpl extends AbstractServiceImpl<Etudiant, EtudiantCriteria, EtudiantDao> implements EtudiantManagerService {


    public void findOrSaveAssociatedObject(Etudiant t) {
        if (t != null) {
            t.setTeacherLocality(teacherLocalityService.findOrSave(t.getTeacherLocality()));
            t.setParcours(parcoursService.findOrSave(t.getParcours()));
            t.setGroupeEtude(groupeEtudeService.findOrSave(t.getGroupeEtude()));
            t.setPackStudent(packStudentService.findOrSave(t.getPackStudent()));
            t.setStatutSocial(statutSocialService.findOrSave(t.getStatutSocial()));
            t.setInteretEtudiant(interetEtudiantService.findOrSave(t.getInteretEtudiant()));
            t.setNiveauEtude(niveauEtudeService.findOrSave(t.getNiveauEtude()));
            t.setSkill(skillService.findOrSave(t.getSkill()));
            t.setFonction(fonctionService.findOrSave(t.getFonction()));
            t.setLangue(langueService.findOrSave(t.getLangue()));
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Etudiant> findByTeacherLocalityId(Long id) {
        return dao.findByTeacherLocalityId(id);
    }

    public int deleteByTeacherLocalityId(Long id) {
        return dao.deleteByTeacherLocalityId(id);
    }

    public long countByTeacherLocalityCode(String code) {
        return dao.countByTeacherLocalityCode(code);
    }

    public List<Etudiant> findByParcoursId(Long id) {
        return dao.findByParcoursId(id);
    }

    public int deleteByParcoursId(Long id) {
        return dao.deleteByParcoursId(id);
    }

    public long countByParcoursCode(String code) {
        return dao.countByParcoursCode(code);
    }

    public List<Etudiant> findByGroupeEtudeId(Long id) {
        return dao.findByGroupeEtudeId(id);
    }

    public int deleteByGroupeEtudeId(Long id) {
        return dao.deleteByGroupeEtudeId(id);
    }

    public long countByGroupeEtudeId(Long id) {
        return dao.countByGroupeEtudeId(id);
    }

    public List<Etudiant> findByPackStudentId(Long id) {
        return dao.findByPackStudentId(id);
    }

    public int deleteByPackStudentId(Long id) {
        return dao.deleteByPackStudentId(id);
    }

    public long countByPackStudentCode(String code) {
        return dao.countByPackStudentCode(code);
    }

    public List<Etudiant> findByStatutSocialId(Long id) {
        return dao.findByStatutSocialId(id);
    }

    public int deleteByStatutSocialId(Long id) {
        return dao.deleteByStatutSocialId(id);
    }

    public long countByStatutSocialCode(String code) {
        return dao.countByStatutSocialCode(code);
    }

    public List<Etudiant> findByInteretEtudiantId(Long id) {
        return dao.findByInteretEtudiantId(id);
    }

    public int deleteByInteretEtudiantId(Long id) {
        return dao.deleteByInteretEtudiantId(id);
    }

    public long countByInteretEtudiantCode(String code) {
        return dao.countByInteretEtudiantCode(code);
    }

    public List<Etudiant> findByNiveauEtudeId(Long id) {
        return dao.findByNiveauEtudeId(id);
    }

    public int deleteByNiveauEtudeId(Long id) {
        return dao.deleteByNiveauEtudeId(id);
    }

    public long countByNiveauEtudeCode(String code) {
        return dao.countByNiveauEtudeCode(code);
    }

    public List<Etudiant> findBySkillId(Long id) {
        return dao.findBySkillId(id);
    }

    public int deleteBySkillId(Long id) {
        return dao.deleteBySkillId(id);
    }

    public long countBySkillCode(String code) {
        return dao.countBySkillCode(code);
    }

    public List<Etudiant> findByFonctionId(Long id) {
        return dao.findByFonctionId(id);
    }

    public int deleteByFonctionId(Long id) {
        return dao.deleteByFonctionId(id);
    }

    public long countByFonctionCode(String code) {
        return dao.countByFonctionCode(code);
    }

    public int deleteByCollaboratorId(Long id) {
        return dao.deleteByCollaboratorId(id);
    }

    public long countByCollaboratorId(Long id) {
        return dao.countByCollaboratorId(id);
    }


    @Override
    public Etudiant create(Etudiant t) {
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

        Etudiant mySaved = (Etudiant) userService.create(t);

        if (t.getQuizEtudiants() != null) {
            t.getQuizEtudiants().forEach(element -> {
                element.setEtudiant(mySaved);
                quizEtudiantService.create(element);
            });
        }
        if (t.getGroupeEtudiantDetails() != null) {
            t.getGroupeEtudiantDetails().forEach(element -> {
                element.setEtudiant(mySaved);
                groupeEtudiantDetailService.create(element);
            });
        }
        return mySaved;
    }

    public Etudiant findByUsername(String username) {
        return dao.findByUsername(username);
    }

    public boolean changePassword(String username, String newPassword) {
        return userService.changePassword(username, newPassword);
    }

    public void configure() {
        super.configure(Etudiant.class, EtudiantSpecification.class);
    }

    private @Autowired UserService userService;
    private @Autowired RoleService roleService;
    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private ParcoursManagerService parcoursService;
    @Autowired
    private QuizEtudiantManagerService quizEtudiantService;
    @Autowired
    private InteretEtudiantManagerService interetEtudiantService;
    @Autowired
    private StatutSocialManagerService statutSocialService;
    @Autowired
    private LangueManagerService langueService;
    @Autowired
    private GroupeEtudeManagerService groupeEtudeService;
    @Autowired
    private CollaboratorManagerService collaboratorService;
    @Autowired
    private SkillManagerService skillService;
    @Autowired
    private FonctionManagerService fonctionService;
    @Autowired
    private GroupeEtudiantDetailManagerService groupeEtudiantDetailService;
    @Autowired
    private PackStudentManagerService packStudentService;
    @Autowired
    private TeacherLocalityManagerService teacherLocalityService;
    @Autowired
    private NiveauEtudeManagerService niveauEtudeService;

    public EtudiantManagerServiceImpl(EtudiantDao dao) {
        super(dao);
    }

}

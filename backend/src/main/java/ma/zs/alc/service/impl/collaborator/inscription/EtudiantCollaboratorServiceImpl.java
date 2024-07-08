package ma.zs.alc.service.impl.collaborator.inscription;


import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.bean.core.grpe.GroupeEtude;
import ma.zs.alc.bean.core.grpe.Inscription;
import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.bean.core.inscriptionref.*;
import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.dao.criteria.core.inscription.EtudiantCriteria;
import ma.zs.alc.dao.facade.core.inscription.EtudiantDao;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.dao.specification.core.inscription.EtudiantSpecification;
import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.grpe.GroupeEtudeCollaboratorService;
import ma.zs.alc.service.facade.collaborator.grpe.GroupeEtudiantDetailCollaboratorService;
import ma.zs.alc.service.facade.collaborator.grpe.InscriptionCollaboratorService;
import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService;
import ma.zs.alc.service.facade.collaborator.inscriptionref.*;
import ma.zs.alc.service.facade.collaborator.pack.PackStudentCollaboratorService;
import ma.zs.alc.service.facade.collaborator.quizetudiant.QuizEtudiantCollaboratorService;
import ma.zs.alc.service.facade.collaborator.vocab.CollaboratorCollaboratorService;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.service.facade.ModelPermissionUserService;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.DateUtil;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class EtudiantCollaboratorServiceImpl extends AbstractServiceImpl<Etudiant, EtudiantCriteria, EtudiantDao> implements EtudiantCollaboratorService {


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



    public List<UserPageable> findByCollaboratorId(Long id) {
        return dao.findByCollaboratorId(id);
    }

    public Page<UserPageable> findByCollaboratorId(Long id, Pageable pageable) {
        return dao.findByCollaboratorId(id, pageable);
    }

    public int deleteByCollaboratorId(Long id) {
        return dao.deleteByCollaboratorId(id);
    }

    public long countByCollaboratorId(Long id) {
        return dao.countByCollaboratorId(id);
    }


    @Override
    public Etudiant create(Etudiant t) {
        if (t.getUsername() == null || findByUsername(t.getUsername()) != null) {
            throw new RuntimeException("Email already exist.");
        }
        String password = null;
        if (t.getPassword() != null) password = t.getPassword();
        else password = generatePassword();
        t.setPassword(password);
        t.setEnabled(true);
        t.setAccountNonExpired(true);
        t.setAccountNonLocked(true);
        t.setCredentialsNonExpired(true);
        t.setPasswordChanged(false);
        Role role = new Role();
        role.setAuthority(AuthoritiesConstants.STUDENT);
        role.setCreatedAt(LocalDateTime.now());
        roleService.create(role);
        RoleUser roleUser = new RoleUser();
        roleUser.setRole(role);
        if (t.getRoleUsers() == null) t.setRoleUsers(new ArrayList<>());

        t.getRoleUsers().add(roleUser);
        if (t.getModelPermissionUsers() == null) t.setModelPermissionUsers(new ArrayList<>());

        t.setModelPermissionUsers(modelPermissionUserService.initModelPermissionUser());

        if (t.getCollaborator() != null) {
            System.out.println("COLLABORATOR==> " + t.getCollaborator().getId());
            Collaborator c = collaboratorService.findById(t.getCollaborator().getId());
            if (c == null) {
                throw new RuntimeException("Collaborator account with username '" + t.getCollaborator().getUsername() + "' not found");
            }
            System.out.println("COLLABORATOR==> " + c);
            t.setCollaborator(c);
        }

        Etudiant mySaved = (Etudiant) userService.create(t);
        //create student inscription
        Inscription ins = new Inscription();
        ins.setEtudiant(mySaved);
        ins.setDatedebutinscription(DateUtil.getCurrentDateTime());
        ins.setEtatInscription(new EtatInscription( 1L));
        ins.setNumeroInscription(1);
        ins.setSubscriptionFinished(false);
        inscriptionService.create(ins);

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
        if (t.getInscriptions() != null) {
            t.getInscriptions().forEach(element -> {
                element.setEtudiant(mySaved);
                inscriptionService.create(element);
            });
        }
        System.out.println("mySaved = " + mySaved);
        mySaved.setModelPermissionUsers(null);
        System.out.println("mySaved = " + mySaved);
        return mySaved;
    }

    @Override
    public Etudiant update(Etudiant t) {
        Etudiant student = this.findById(t.getId());
        if (student == null) {
            throw new RuntimeException("Account not found.");
        } else {
            student.setFullName(t.getFullName());
            student.setAvatar(t.getAvatar());
            student.setEmail(t.getEmail());
            student.setPhone(t.getPhone());
            student.setCountry(t.getCountry());
            student.setAbout(t.getAbout());

            if (t.getLangue() != null && t.getLangue().getId() != null) {
                Langue langue = langueService.findById(t.getLangue().getId());
                student.setLangue(langue);
            }

            if (t.getParcours() != null && t.getParcours().getId() != null) {
                Parcours parcours = parcoursService.findById(t.getParcours().getId());
                student.setParcours(parcours);
            }

            if (t.getTeacherLocality() != null && t.getTeacherLocality().getId() != null) {
                TeacherLocality locality = teacherLocalityService.findById(t.getTeacherLocality().getId());
                student.setTeacherLocality(locality);
            }


            if (t.getStatutSocial() != null && t.getStatutSocial().getId() != null) {
                StatutSocial statutSocial = statutSocialService.findById(t.getStatutSocial().getId());
                student.setStatutSocial(statutSocial);
            }


            if (t.getGroupeEtude() != null && t.getGroupeEtude().getId() != null) {
                GroupeEtude groupeEtude = groupeEtudeService.findById(t.getGroupeEtude().getId());
                student.setGroupeEtude(groupeEtude);
            }

            if (t.getSkill() != null && t.getSkill().getId() != null) {
                Skill skill = skillService.findById(t.getSkill().getId());
                student.setSkill(skill);
            }

            if (t.getFonction() != null && t.getFonction().getId() != null) {
                Fonction fonction = fonctionService.findById(t.getFonction().getId());
                student.setFonction(fonction);
            }

            if (t.getInteretEtudiant() != null && t.getInteretEtudiant().getId() != null) {
                InteretEtudiant interetEtudiant = interetEtudiantService.findById(t.getInteretEtudiant().getId());
                student.setInteretEtudiant(interetEtudiant);
            }
            return dao.save(student);
        }
    }

    public Etudiant findByUsername(String username) {
        return dao.findByUsername(username);
    }

    public boolean changePassword(String username, String newPassword) {
        return userService.changePassword(username, newPassword);
    }

    public String generatePassword() {
        return RandomStringUtils.randomAlphanumeric(10);
    }


    public void configure() {
        super.configure(Etudiant.class, EtudiantSpecification.class);
    }

    private @Autowired UserService userService;
    private @Autowired RoleService roleService;
    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private ParcoursCollaboratorService parcoursService;
    @Autowired
    private QuizEtudiantCollaboratorService quizEtudiantService;
    @Autowired
    private InteretEtudiantCollaboratorService interetEtudiantService;
    @Autowired
    private InscriptionCollaboratorService inscriptionService;
    @Autowired
    private StatutSocialCollaboratorService statutSocialService;
    @Autowired
    private LangueCollaboratorService langueService;
    @Autowired
    private GroupeEtudeCollaboratorService groupeEtudeService;
    @Autowired
    private CollaboratorCollaboratorService collaboratorService;
    @Autowired
    private SkillCollaboratorService skillService;
    @Autowired
    private FonctionCollaboratorService fonctionService;
    @Autowired
    private GroupeEtudiantDetailCollaboratorService groupeEtudiantDetailService;
    @Autowired
    private PackStudentCollaboratorService packStudentService;
    @Autowired
    private TeacherLocalityCollaboratorService teacherLocalityService;
    @Autowired
    private NiveauEtudeCollaboratorService niveauEtudeService;

    public EtudiantCollaboratorServiceImpl(EtudiantDao dao) {
        super(dao);
    }

}

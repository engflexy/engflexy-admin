package ma.zs.alc.ws.converter.inscription;

import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.bean.core.grpe.GroupeEtude;
import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.bean.core.inscriptionref.*;
import ma.zs.alc.bean.core.pack.PackStudent;
import ma.zs.alc.ws.converter.collab.CollaboratorConverter;
import ma.zs.alc.ws.converter.course.ParcoursConverter;
import ma.zs.alc.ws.converter.grpe.GroupeEtudeConverter;
import ma.zs.alc.ws.converter.grpe.GroupeEtudiantConverter;
import ma.zs.alc.ws.converter.grpe.GroupeEtudiantDetailConverter;
import ma.zs.alc.ws.converter.inscriptionref.*;
import ma.zs.alc.ws.converter.pack.PackStudentConverter;
import ma.zs.alc.ws.converter.quiz.QuizConverter;
import ma.zs.alc.ws.converter.quizetudiant.QuizEtudiantConverter;
import ma.zs.alc.ws.converter.quizetudiant.ReponseEtudiantConverter;
import ma.zs.alc.ws.dto.inscription.EtudiantDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.ListUtil;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EtudiantConverter extends AbstractConverter<Etudiant, EtudiantDto> {

    @Autowired
    private ParcoursConverter parcoursConverter;
    @Autowired
    private QuizEtudiantConverter quizEtudiantConverter;
    @Autowired
    private InteretEtudiantConverter interetEtudiantConverter;
    @Autowired
    private StatutSocialConverter statutSocialConverter;
    @Autowired
    private GroupeEtudiantConverter groupeEtudiantConverter;
    @Autowired
    private LangueConverter langueConverter;
    @Autowired
    private ReponseEtudiantConverter reponseEtudiantConverter;
    @Autowired
    private GroupeEtudeConverter groupeEtudeConverter;
    @Autowired
    private CollaboratorConverter collaboratorConverter;
    @Autowired
    private QuizConverter quizConverter;
    @Autowired
    private SkillConverter skillConverter;
    @Autowired
    private FonctionConverter fonctionConverter;
    @Autowired
    private GroupeEtudiantDetailConverter groupeEtudiantDetailConverter;
    @Autowired
    private PackStudentConverter packStudentConverter;
    @Autowired
    private TeacherLocalityConverter teacherLocalityConverter;
    @Autowired
    private NiveauEtudeConverter niveauEtudeConverter;
    private boolean teacherLocality;
    private boolean parcours;
    private boolean groupeEtude;
    private boolean packStudent;
    private boolean statutSocial;
    private boolean interetEtudiant;
    private boolean niveauEtude;
    private boolean skill;
    private boolean fonction;
    private boolean langue;
    private boolean collaborator;
    private boolean quizEtudiants;
    private boolean groupeEtudiantDetails;

    public EtudiantConverter() {
        super(Etudiant.class, EtudiantDto.class);
        init(true);
    }

    @Override
    public Etudiant toItem(EtudiantDto dto) {
        if (dto == null) {
            return null;
        } else {
            Etudiant item = new Etudiant();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if (StringUtil.isNotEmpty(dto.getGroupOption()))
                item.setGroupOption(dto.getGroupOption());
            if (dto.getSubscribe() != null)
                item.setSubscribe(dto.getSubscribe());
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
            if (this.teacherLocality && dto.getTeacherLocality() != null)
                item.setTeacherLocality(teacherLocalityConverter.toItem(dto.getTeacherLocality()));

            if (dto.getParcours() != null && dto.getParcours().getId() != null) {
                item.setParcours(new Parcours());
                item.getParcours().setId(dto.getParcours().getId());
                item.getParcours().setLibelle(dto.getParcours().getLibelle());
            }

            if (this.groupeEtude && dto.getGroupeEtude() != null)
                item.setGroupeEtude(groupeEtudeConverter.toItem(dto.getGroupeEtude()));

            if (this.packStudent && dto.getPackStudent() != null)
                item.setPackStudent(packStudentConverter.toItem(dto.getPackStudent()));

            if (this.statutSocial && dto.getStatutSocial() != null)
                item.setStatutSocial(statutSocialConverter.toItem(dto.getStatutSocial()));

            if (this.interetEtudiant && dto.getInteretEtudiant() != null)
                item.setInteretEtudiant(interetEtudiantConverter.toItem(dto.getInteretEtudiant()));

            if (this.niveauEtude && dto.getNiveauEtude() != null)
                item.setNiveauEtude(niveauEtudeConverter.toItem(dto.getNiveauEtude()));

            if (this.skill && dto.getSkill() != null)
                item.setSkill(skillConverter.toItem(dto.getSkill()));

            if (this.fonction && dto.getFonction() != null)
                item.setFonction(fonctionConverter.toItem(dto.getFonction()));

            if (this.langue && dto.getLangue() != null)
                item.setLangue(langueConverter.toItem(dto.getLangue()));

            if (dto.getCollaborator() != null && dto.getCollaborator().getId() != null) {
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }


            if (this.quizEtudiants && ListUtil.isNotEmpty(dto.getQuizEtudiants()))
                item.setQuizEtudiants(quizEtudiantConverter.toItem(dto.getQuizEtudiants()));
            if (this.groupeEtudiantDetails && ListUtil.isNotEmpty(dto.getGroupeEtudiantDetails()))
                item.setGroupeEtudiantDetails(groupeEtudiantDetailConverter.toItem(dto.getGroupeEtudiantDetails()));

            //item.setRoles(dto.getRoles());

            return item;
        }
    }

    @Override
    public EtudiantDto toDto(Etudiant item) {
        if (item == null) {
            return null;
        } else {
            EtudiantDto dto = new EtudiantDto();
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if (StringUtil.isNotEmpty(item.getGroupOption()))
                dto.setGroupOption(item.getGroupOption());
            dto.setSubscribe(item.getSubscribe());
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
            if (this.teacherLocality && item.getTeacherLocality() != null) {
                dto.setTeacherLocality(teacherLocalityConverter.toDto(item.getTeacherLocality()));

            }
            if (this.parcours && item.getParcours() != null) {
                dto.setParcours(parcoursConverter.toDto(item.getParcours()));

            }
            if (this.groupeEtude && item.getGroupeEtude() != null) {
                dto.setGroupeEtude(groupeEtudeConverter.toDto(item.getGroupeEtude()));

            }
            if (this.packStudent && item.getPackStudent() != null) {
                dto.setPackStudent(packStudentConverter.toDto(item.getPackStudent()));

            }
            if (this.statutSocial && item.getStatutSocial() != null) {
                dto.setStatutSocial(statutSocialConverter.toDto(item.getStatutSocial()));

            }
            if (this.interetEtudiant && item.getInteretEtudiant() != null) {
                dto.setInteretEtudiant(interetEtudiantConverter.toDto(item.getInteretEtudiant()));

            }
            if (this.niveauEtude && item.getNiveauEtude() != null) {
                dto.setNiveauEtude(niveauEtudeConverter.toDto(item.getNiveauEtude()));

            }
            if (this.skill && item.getSkill() != null) {
                dto.setSkill(skillConverter.toDto(item.getSkill()));

            }
            if (this.fonction && item.getFonction() != null) {
                dto.setFonction(fonctionConverter.toDto(item.getFonction()));

            }
            if (this.langue && item.getLangue() != null) {
                dto.setLangue(langueConverter.toDto(item.getLangue()));

            }
            if (this.collaborator && item.getCollaborator() != null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator()));

            }
            if (this.quizEtudiants && ListUtil.isNotEmpty(item.getQuizEtudiants())) {
                quizEtudiantConverter.init(false);
                quizEtudiantConverter.setEtudiant(false);
                dto.setQuizEtudiants(quizEtudiantConverter.toDto(item.getQuizEtudiants()));
                quizEtudiantConverter.setEtudiant(true);

            }

            if (this.groupeEtudiantDetails && ListUtil.isNotEmpty(item.getGroupeEtudiantDetails())) {
                groupeEtudiantDetailConverter.init(false);
                groupeEtudiantDetailConverter.setEtudiant(false);
                dto.setGroupeEtudiantDetails(groupeEtudiantDetailConverter.toDto(item.getGroupeEtudiantDetails()));
                groupeEtudiantDetailConverter.setEtudiant(true);

            }


            return dto;
        }
    }

    public void copy(EtudiantDto dto, Etudiant t) {
        super.copy(dto, t);
        if (t.getTeacherLocality() == null && dto.getTeacherLocality() != null) {
            t.setTeacherLocality(new TeacherLocality());
        }
        if (t.getParcours() == null && dto.getParcours() != null) {
            t.setParcours(new Parcours());
        }
        if (t.getGroupeEtude() == null && dto.getGroupeEtude() != null) {
            t.setGroupeEtude(new GroupeEtude());
        }
        if (t.getPackStudent() == null && dto.getPackStudent() != null) {
            t.setPackStudent(new PackStudent());
        }
        if (t.getStatutSocial() == null && dto.getStatutSocial() != null) {
            t.setStatutSocial(new StatutSocial());
        }
        if (t.getInteretEtudiant() == null && dto.getInteretEtudiant() != null) {
            t.setInteretEtudiant(new InteretEtudiant());
        }
        if (t.getNiveauEtude() == null && dto.getNiveauEtude() != null) {
            t.setNiveauEtude(new NiveauEtude());
        }
        if (t.getSkill() == null && dto.getSkill() != null) {
            t.setSkill(new Skill());
        }
        if (t.getFonction() == null && dto.getFonction() != null) {
            t.setFonction(new Fonction());
        }
        if (t.getLangue() == null && dto.getLangue() != null) {
            t.setLangue(new Langue());
        }
        if (t.getCollaborator() == null && dto.getCollaborator() != null) {
            t.setCollaborator(new Collaborator());
        }
        if (dto.getTeacherLocality() != null)
            teacherLocalityConverter.copy(dto.getTeacherLocality(), t.getTeacherLocality());
        if (dto.getParcours() != null)
            parcoursConverter.copy(dto.getParcours(), t.getParcours());
        if (dto.getQuizEtudiants() != null)
            t.setQuizEtudiants(quizEtudiantConverter.copy(dto.getQuizEtudiants()));
        if (dto.getGroupeEtude() != null)
            groupeEtudeConverter.copy(dto.getGroupeEtude(), t.getGroupeEtude());
        if (dto.getGroupeEtudiantDetails() != null)
            t.setGroupeEtudiantDetails(groupeEtudiantDetailConverter.copy(dto.getGroupeEtudiantDetails()));
        if (dto.getPackStudent() != null)
            packStudentConverter.copy(dto.getPackStudent(), t.getPackStudent());
        if (dto.getStatutSocial() != null)
            statutSocialConverter.copy(dto.getStatutSocial(), t.getStatutSocial());
        if (dto.getInteretEtudiant() != null)
            interetEtudiantConverter.copy(dto.getInteretEtudiant(), t.getInteretEtudiant());
        if (dto.getNiveauEtude() != null)
            niveauEtudeConverter.copy(dto.getNiveauEtude(), t.getNiveauEtude());
        if (dto.getSkill() != null)
            skillConverter.copy(dto.getSkill(), t.getSkill());
        if (dto.getFonction() != null)
            fonctionConverter.copy(dto.getFonction(), t.getFonction());
        if (dto.getLangue() != null)
            langueConverter.copy(dto.getLangue(), t.getLangue());
        if (dto.getCollaborator() != null)
            collaboratorConverter.copy(dto.getCollaborator(), t.getCollaborator());
    }


    public void initList(boolean value) {
        this.quizEtudiants = value;
        this.groupeEtudiantDetails = value;
    }

    public void initObject(boolean value) {
        this.teacherLocality = value;
        this.parcours = value;
        this.groupeEtude = value;
        this.packStudent = value;
        this.statutSocial = value;
        this.interetEtudiant = value;
        this.niveauEtude = value;
        this.skill = value;
        this.fonction = value;
        this.langue = value;
        this.collaborator = value;
    }


    public ParcoursConverter getParcoursConverter() {
        return this.parcoursConverter;
    }

    public void setParcoursConverter(ParcoursConverter parcoursConverter) {
        this.parcoursConverter = parcoursConverter;
    }

    public QuizEtudiantConverter getQuizEtudiantConverter() {
        return this.quizEtudiantConverter;
    }

    public void setQuizEtudiantConverter(QuizEtudiantConverter quizEtudiantConverter) {
        this.quizEtudiantConverter = quizEtudiantConverter;
    }

    public InteretEtudiantConverter getInteretEtudiantConverter() {
        return this.interetEtudiantConverter;
    }

    public void setInteretEtudiantConverter(InteretEtudiantConverter interetEtudiantConverter) {
        this.interetEtudiantConverter = interetEtudiantConverter;
    }

    public StatutSocialConverter getStatutSocialConverter() {
        return this.statutSocialConverter;
    }

    public void setStatutSocialConverter(StatutSocialConverter statutSocialConverter) {
        this.statutSocialConverter = statutSocialConverter;
    }

    public GroupeEtudiantConverter getGroupeEtudiantConverter() {
        return this.groupeEtudiantConverter;
    }

    public void setGroupeEtudiantConverter(GroupeEtudiantConverter groupeEtudiantConverter) {
        this.groupeEtudiantConverter = groupeEtudiantConverter;
    }

    public LangueConverter getLangueConverter() {
        return this.langueConverter;
    }

    public void setLangueConverter(LangueConverter langueConverter) {
        this.langueConverter = langueConverter;
    }

    public ReponseEtudiantConverter getReponseEtudiantConverter() {
        return this.reponseEtudiantConverter;
    }

    public void setReponseEtudiantConverter(ReponseEtudiantConverter reponseEtudiantConverter) {
        this.reponseEtudiantConverter = reponseEtudiantConverter;
    }

    public GroupeEtudeConverter getGroupeEtudeConverter() {
        return this.groupeEtudeConverter;
    }

    public void setGroupeEtudeConverter(GroupeEtudeConverter groupeEtudeConverter) {
        this.groupeEtudeConverter = groupeEtudeConverter;
    }

    public CollaboratorConverter getCollaboratorConverter() {
        return this.collaboratorConverter;
    }

    public void setCollaboratorConverter(CollaboratorConverter collaboratorConverter) {
        this.collaboratorConverter = collaboratorConverter;
    }

    public QuizConverter getQuizConverter() {
        return this.quizConverter;
    }

    public void setQuizConverter(QuizConverter quizConverter) {
        this.quizConverter = quizConverter;
    }

    public SkillConverter getSkillConverter() {
        return this.skillConverter;
    }

    public void setSkillConverter(SkillConverter skillConverter) {
        this.skillConverter = skillConverter;
    }

    public FonctionConverter getFonctionConverter() {
        return this.fonctionConverter;
    }

    public void setFonctionConverter(FonctionConverter fonctionConverter) {
        this.fonctionConverter = fonctionConverter;
    }

    public GroupeEtudiantDetailConverter getGroupeEtudiantDetailConverter() {
        return this.groupeEtudiantDetailConverter;
    }

    public void setGroupeEtudiantDetailConverter(GroupeEtudiantDetailConverter groupeEtudiantDetailConverter) {
        this.groupeEtudiantDetailConverter = groupeEtudiantDetailConverter;
    }

    public PackStudentConverter getPackStudentConverter() {
        return this.packStudentConverter;
    }

    public void setPackStudentConverter(PackStudentConverter packStudentConverter) {
        this.packStudentConverter = packStudentConverter;
    }

    public TeacherLocalityConverter getTeacherLocalityConverter() {
        return this.teacherLocalityConverter;
    }

    public void setTeacherLocalityConverter(TeacherLocalityConverter teacherLocalityConverter) {
        this.teacherLocalityConverter = teacherLocalityConverter;
    }

    public NiveauEtudeConverter getNiveauEtudeConverter() {
        return this.niveauEtudeConverter;
    }

    public void setNiveauEtudeConverter(NiveauEtudeConverter niveauEtudeConverter) {
        this.niveauEtudeConverter = niveauEtudeConverter;
    }

    public boolean isTeacherLocality() {
        return this.teacherLocality;
    }

    public void setTeacherLocality(boolean teacherLocality) {
        this.teacherLocality = teacherLocality;
    }

    public boolean isParcours() {
        return this.parcours;
    }

    public void setParcours(boolean parcours) {
        this.parcours = parcours;
    }

    public boolean isGroupeEtude() {
        return this.groupeEtude;
    }

    public void setGroupeEtude(boolean groupeEtude) {
        this.groupeEtude = groupeEtude;
    }

    public boolean isPackStudent() {
        return this.packStudent;
    }

    public void setPackStudent(boolean packStudent) {
        this.packStudent = packStudent;
    }

    public boolean isStatutSocial() {
        return this.statutSocial;
    }

    public void setStatutSocial(boolean statutSocial) {
        this.statutSocial = statutSocial;
    }

    public boolean isInteretEtudiant() {
        return this.interetEtudiant;
    }

    public void setInteretEtudiant(boolean interetEtudiant) {
        this.interetEtudiant = interetEtudiant;
    }

    public boolean isNiveauEtude() {
        return this.niveauEtude;
    }

    public void setNiveauEtude(boolean niveauEtude) {
        this.niveauEtude = niveauEtude;
    }

    public boolean isSkill() {
        return this.skill;
    }

    public void setSkill(boolean skill) {
        this.skill = skill;
    }

    public boolean isFonction() {
        return this.fonction;
    }

    public void setFonction(boolean fonction) {
        this.fonction = fonction;
    }

    public boolean isLangue() {
        return this.langue;
    }

    public void setLangue(boolean langue) {
        this.langue = langue;
    }

    public boolean isCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(boolean collaborator) {
        this.collaborator = collaborator;
    }

    public boolean isQuizEtudiants() {
        return this.quizEtudiants;
    }

    public void setQuizEtudiants(boolean quizEtudiants) {
        this.quizEtudiants = quizEtudiants;
    }

    public boolean isGroupeEtudiantDetails() {
        return this.groupeEtudiantDetails;
    }

    public void setGroupeEtudiantDetails(boolean groupeEtudiantDetails) {
        this.groupeEtudiantDetails = groupeEtudiantDetails;
    }
}

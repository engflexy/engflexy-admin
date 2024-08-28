package ma.zs.alc.service.facade.collaborator.inscription;

import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.dao.criteria.core.inscription.EtudiantCriteria;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface EtudiantCollaboratorService extends IService<Etudiant, EtudiantCriteria> {
    Etudiant findByUsername(String email);
    boolean updatePasswordChangedStatus(Long id, boolean passwordChanged);
    boolean updateCredentialsNonExpiredStatus(Long id, boolean credentialsNonExpired);
    boolean updateAccountLockStatus(Long id, boolean accountNonLocked);
    boolean updateAccountNonExpiredStatus(Long id, boolean accountNonExpired);
    boolean updateAccountStatus(Long id, boolean enabled);
    boolean onCommunicationEnabled(Long id, boolean communicationEnabled);
    boolean onSecurityEnabled(Long id, boolean securityEnabled);
    boolean onLessonReminderEnabled(Long id, boolean lessonReminderEnabled);
    boolean onClassroomEnabled(Long id, boolean classroomEnabled);
    boolean onPasswordChangedNotificationEnabled(Long id, boolean passwordChangedNotificationEnabled);
    boolean onContactNotificationEnabled(Long id, boolean contactNotificationEnabled);

    boolean changePassword(String username, String newPassword);

    List<Etudiant> findByTeacherLocalityId(Long id);
    List<Etudiant> findAll();


    int deleteByTeacherLocalityId(Long id);

    long countByTeacherLocalityCode(String code);

    List<Etudiant> findByParcoursId(Long id);

    int deleteByParcoursId(Long id);

    long countByParcoursCode(String code);

    List<Etudiant> findByGroupeEtudeId(Long id);

    int deleteByGroupeEtudeId(Long id);

    long countByGroupeEtudeId(Long id);

    List<Etudiant> findByPackStudentId(Long id);

    int deleteByPackStudentId(Long id);

    long countByPackStudentCode(String code);

    List<Etudiant> findByStatutSocialId(Long id);

    int deleteByStatutSocialId(Long id);

    long countByStatutSocialCode(String code);

    List<Etudiant> findByInteretEtudiantId(Long id);

    int deleteByInteretEtudiantId(Long id);

    long countByInteretEtudiantCode(String code);

    List<Etudiant> findByNiveauEtudeId(Long id);

    int deleteByNiveauEtudeId(Long id);

    long countByNiveauEtudeCode(String code);

    List<Etudiant> findBySkillId(Long id);

    int deleteBySkillId(Long id);

    long countBySkillCode(String code);

    List<Etudiant> findByFonctionId(Long id);

    int deleteByFonctionId(Long id);

    long countByFonctionCode(String code);


    List<UserPageable> findByCollaboratorId(Long id);
    Page<UserPageable> findByCollaboratorId(Long id, Pageable pageable);

    int deleteByCollaboratorId(Long id);

    long countByCollaboratorId(Long id);


}

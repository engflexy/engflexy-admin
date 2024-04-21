package ma.zs.zyn.service.facade.admin.inscription;

import java.util.List;
import ma.zs.zyn.bean.core.inscription.Etudiant;
import ma.zs.zyn.dao.criteria.core.inscription.EtudiantCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface EtudiantAdminService extends  IService<Etudiant,EtudiantCriteria>  {
    Etudiant findByUsername(String username);
    boolean changePassword(String username, String newPassword);

    List<Etudiant> findByTeacherLocalityId(Long id);
    int deleteByTeacherLocalityId(Long id);
    long countByTeacherLocalityCode(String code);
    List<Etudiant> findByEtatEtudiantScheduleId(Long id);
    int deleteByEtatEtudiantScheduleId(Long id);
    long countByEtatEtudiantScheduleCode(String code);
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
    List<Etudiant> findByLangueId(Long id);
    int deleteByLangueId(Long id);
    long countByLangueLibelle(String libelle);




}

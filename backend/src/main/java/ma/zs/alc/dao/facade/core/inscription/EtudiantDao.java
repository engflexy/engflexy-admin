package ma.zs.alc.dao.facade.core.inscription;

import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface EtudiantDao extends AbstractRepository<Etudiant, Long> {

    List<Etudiant> findByTeacherLocalityId(Long id);

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

    @Query("select new ma.zs.alc.dao.facade.core.inscription.UserPageable(etd) " +
            "from Etudiant etd where etd.collaborator.id=:id")
    List<UserPageable> findByCollaboratorId(@Param("id") Long id);

    @Query("select new ma.zs.alc.dao.facade.core.inscription.UserPageable(etd) " +
            "from Etudiant etd where etd.collaborator.id=:id")
    Page<UserPageable> findByCollaboratorId(@Param("id") Long id, Pageable pageable);


    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);

    Etudiant findByUsername(String email);


}

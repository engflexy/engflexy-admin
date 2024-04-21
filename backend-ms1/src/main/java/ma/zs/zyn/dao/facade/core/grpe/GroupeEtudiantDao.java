package ma.zs.zyn.dao.facade.core.grpe;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.grpe.GroupeEtudiant;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface GroupeEtudiantDao extends AbstractRepository<GroupeEtudiant,Long>  {

    List<GroupeEtudiant> findByGroupeEtudeId(Long id);
    int deleteByGroupeEtudeId(Long id);
    long countByGroupeEtudeId(Long id);
    List<GroupeEtudiant> findByGroupeTypeId(Long id);
    int deleteByGroupeTypeId(Long id);
    long countByGroupeTypeCode(String code);
    List<GroupeEtudiant> findByGroupeEtatId(Long id);
    int deleteByGroupeEtatId(Long id);
    long countByGroupeEtatCode(String code);
    List<GroupeEtudiant> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);
    List<GroupeEtudiant> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);


}

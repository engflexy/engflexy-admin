package ma.zs.zyn.service.facade.admin.grpe;

import java.util.List;
import ma.zs.zyn.bean.core.grpe.GroupeEtudiant;
import ma.zs.zyn.dao.criteria.core.grpe.GroupeEtudiantCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface GroupeEtudiantAdminService extends  IService<GroupeEtudiant,GroupeEtudiantCriteria>  {

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

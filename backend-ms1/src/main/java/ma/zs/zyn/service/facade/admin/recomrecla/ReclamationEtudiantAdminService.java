package ma.zs.zyn.service.facade.admin.recomrecla;

import java.util.List;
import ma.zs.zyn.bean.core.recomrecla.ReclamationEtudiant;
import ma.zs.zyn.dao.criteria.core.recomrecla.ReclamationEtudiantCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ReclamationEtudiantAdminService extends  IService<ReclamationEtudiant,ReclamationEtudiantCriteria>  {

    List<ReclamationEtudiant> findByTypeReclamationEtudiantId(Long id);
    int deleteByTypeReclamationEtudiantId(Long id);
    long countByTypeReclamationEtudiantCode(String code);




}

package ma.zs.zyn.service.facade.admin.faq;

import java.util.List;
import ma.zs.zyn.bean.core.faq.FaqEtudiant;
import ma.zs.zyn.dao.criteria.core.faq.FaqEtudiantCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface FaqEtudiantAdminService extends  IService<FaqEtudiant,FaqEtudiantCriteria>  {

    List<FaqEtudiant> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);
    List<FaqEtudiant> findByAdminId(Long id);
    int deleteByAdminId(Long id);
    long countByAdminId(Long id);
    List<FaqEtudiant> findByFaqTypeId(Long id);
    int deleteByFaqTypeId(Long id);
    long countByFaqTypeId(Long id);




}

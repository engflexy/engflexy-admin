package ma.zs.alc.service.facade.admin.faq;

import java.util.List;
import ma.zs.alc.bean.core.faq.FaqEtudiant;
import ma.zs.alc.dao.criteria.core.faq.FaqEtudiantCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface FaqEtudiantAdminService extends  IService<FaqEtudiant,FaqEtudiantCriteria>  {

    List<FaqEtudiant> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);
    List<FaqEtudiant> findByFaqTypeId(Long id);
    int deleteByFaqTypeId(Long id);
    long countByFaqTypeId(Long id);




}

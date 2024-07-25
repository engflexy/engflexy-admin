package ma.zs.alc.service.impl.manager.faq;


import ma.zs.alc.bean.core.faq.FaqEtudiant;
import ma.zs.alc.dao.criteria.core.faq.FaqEtudiantCriteria;
import ma.zs.alc.dao.facade.core.faq.FaqEtudiantDao;
import ma.zs.alc.dao.specification.core.faq.FaqEtudiantSpecification;
import ma.zs.alc.service.facade.manager.faq.FaqEtudiantManagerService;
import ma.zs.alc.service.facade.manager.faq.FaqTypeManagerService;
import ma.zs.alc.service.facade.manager.inscription.EtudiantManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqEtudiantManagerServiceImpl extends AbstractServiceImpl<FaqEtudiant, FaqEtudiantCriteria, FaqEtudiantDao> implements FaqEtudiantManagerService {







    public void findOrSaveAssociatedObject(FaqEtudiant t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
            t.setFaqType(faqTypeService.findOrSave(t.getFaqType()));
        }
    }

    public List<FaqEtudiant> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }
    public List<FaqEtudiant> findByFaqTypeId(Long id){
        return dao.findByFaqTypeId(id);
    }
    public int deleteByFaqTypeId(Long id){
        return dao.deleteByFaqTypeId(id);
    }
    public long countByFaqTypeId(Long id){
        return dao.countByFaqTypeId(id);
    }

    public List<FaqEtudiant> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(FaqEtudiant.class, FaqEtudiantSpecification.class);
    }


    @Autowired
    private FaqTypeManagerService faqTypeService ;
    @Autowired
    private EtudiantManagerService etudiantService ;

    public FaqEtudiantManagerServiceImpl(FaqEtudiantDao dao) {
        super(dao);
    }

}

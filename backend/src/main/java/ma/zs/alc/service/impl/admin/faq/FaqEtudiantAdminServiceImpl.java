package ma.zs.alc.service.impl.admin.faq;


import ma.zs.alc.bean.core.faq.FaqEtudiant;
import ma.zs.alc.dao.criteria.core.faq.FaqEtudiantCriteria;
import ma.zs.alc.dao.facade.core.faq.FaqEtudiantDao;
import ma.zs.alc.dao.specification.core.faq.FaqEtudiantSpecification;
import ma.zs.alc.service.facade.admin.faq.FaqEtudiantAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.admin.faq.FaqTypeAdminService ;
import ma.zs.alc.bean.core.faq.FaqType ;
import ma.zs.alc.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.alc.bean.core.inscription.Etudiant ;

import java.util.List;
@Service
public class FaqEtudiantAdminServiceImpl extends AbstractServiceImpl<FaqEtudiant, FaqEtudiantCriteria, FaqEtudiantDao> implements FaqEtudiantAdminService {






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
    private FaqTypeAdminService faqTypeService ;
    @Autowired
    private EtudiantAdminService etudiantService ;

    public FaqEtudiantAdminServiceImpl(FaqEtudiantDao dao) {
        super(dao);
    }

}

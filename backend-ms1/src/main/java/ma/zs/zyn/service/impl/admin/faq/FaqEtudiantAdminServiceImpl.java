package ma.zs.zyn.service.impl.admin.faq;


import ma.zs.zyn.bean.core.faq.FaqEtudiant;
import ma.zs.zyn.dao.criteria.core.faq.FaqEtudiantCriteria;
import ma.zs.zyn.dao.facade.core.faq.FaqEtudiantDao;
import ma.zs.zyn.dao.specification.core.faq.FaqEtudiantSpecification;
import ma.zs.zyn.service.facade.admin.faq.FaqEtudiantAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.faq.FaqTypeAdminService ;
import ma.zs.zyn.bean.core.faq.FaqType ;
import ma.zs.zyn.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.zyn.bean.core.inscription.Etudiant ;
import ma.zs.zyn.service.facade.admin.alc.AdminAdminService ;
import ma.zs.zyn.bean.core.alc.Admin ;

import java.util.List;
@Service
public class FaqEtudiantAdminServiceImpl extends AbstractServiceImpl<FaqEtudiant, FaqEtudiantCriteria, FaqEtudiantDao> implements FaqEtudiantAdminService {






    public void findOrSaveAssociatedObject(FaqEtudiant t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
            t.setAdmin(adminService.findOrSave(t.getAdmin()));
            t.setFaqType(faqTypeService.findOrSave(t.getFaqType()));
        }
    }

    public List<FaqEtudiant> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantRef(String ref){
        return dao.countByEtudiantRef(ref);
    }
    public List<FaqEtudiant> findByAdminId(Long id){
        return dao.findByAdminId(id);
    }
    public int deleteByAdminId(Long id){
        return dao.deleteByAdminId(id);
    }
    public long countByAdminId(Long id){
        return dao.countByAdminId(id);
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
    @Autowired
    private AdminAdminService adminService ;

    public FaqEtudiantAdminServiceImpl(FaqEtudiantDao dao) {
        super(dao);
    }

}

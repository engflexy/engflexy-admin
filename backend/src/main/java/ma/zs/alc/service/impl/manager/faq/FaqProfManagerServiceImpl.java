package ma.zs.alc.service.impl.manager.faq;


import ma.zs.alc.bean.core.faq.FaqProf;
import ma.zs.alc.dao.criteria.core.faq.FaqProfCriteria;
import ma.zs.alc.dao.facade.core.faq.FaqProfDao;
import ma.zs.alc.dao.specification.core.faq.FaqProfSpecification;
import ma.zs.alc.service.facade.manager.faq.FaqProfManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.faq.FaqTypeManagerService ;
import ma.zs.alc.service.facade.manager.prof.ProfManagerService ;

@Service
public class FaqProfManagerServiceImpl extends AbstractServiceImpl<FaqProf, FaqProfCriteria, FaqProfDao> implements FaqProfManagerService {







    public void findOrSaveAssociatedObject(FaqProf t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
            t.setFaqType(faqTypeService.findOrSave(t.getFaqType()));
        }
    }

    public List<FaqProf> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<FaqProf> findByFaqTypeId(Long id){
        return dao.findByFaqTypeId(id);
    }
    public int deleteByFaqTypeId(Long id){
        return dao.deleteByFaqTypeId(id);
    }
    public long countByFaqTypeId(Long id){
        return dao.countByFaqTypeId(id);
    }

    public List<FaqProf> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(FaqProf.class, FaqProfSpecification.class);
    }


    @Autowired
    private FaqTypeManagerService faqTypeService ;
    @Autowired
    private ProfManagerService profService ;

    public FaqProfManagerServiceImpl(FaqProfDao dao) {
        super(dao);
    }

}
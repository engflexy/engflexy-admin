package ma.zs.alc.service.impl.manager.faq;


import ma.zs.alc.bean.core.faq.Faq;
import ma.zs.alc.dao.criteria.core.faq.FaqCriteria;
import ma.zs.alc.dao.facade.core.faq.FaqDao;
import ma.zs.alc.dao.specification.core.faq.FaqSpecification;
import ma.zs.alc.service.facade.manager.faq.FaqManagerService;
import ma.zs.alc.service.facade.manager.faq.FaqTypeManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqManagerServiceImpl extends AbstractServiceImpl<Faq, FaqCriteria, FaqDao> implements FaqManagerService {







    public void findOrSaveAssociatedObject(Faq t){
        if( t != null) {
            t.setFaqType(faqTypeService.findOrSave(t.getFaqType()));
        }
    }

    public List<Faq> findByFaqTypeId(Long id){
        return dao.findByFaqTypeId(id);
    }
    public int deleteByFaqTypeId(Long id){
        return dao.deleteByFaqTypeId(id);
    }
    public long countByFaqTypeId(Long id){
        return dao.countByFaqTypeId(id);
    }

    public List<Faq> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Faq.class, FaqSpecification.class);
    }


    @Autowired
    private FaqTypeManagerService faqTypeService ;

    public FaqManagerServiceImpl(FaqDao dao) {
        super(dao);
    }

}

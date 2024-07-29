package ma.zs.alc.service.impl.manager.faq;


import ma.zs.alc.bean.core.faq.FaqType;
import ma.zs.alc.dao.criteria.core.faq.FaqTypeCriteria;
import ma.zs.alc.dao.facade.core.faq.FaqTypeDao;
import ma.zs.alc.dao.specification.core.faq.FaqTypeSpecification;
import ma.zs.alc.service.facade.manager.faq.FaqTypeManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FaqTypeManagerServiceImpl extends AbstractServiceImpl<FaqType, FaqTypeCriteria, FaqTypeDao> implements FaqTypeManagerService {









    public List<FaqType> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(FaqType.class, FaqTypeSpecification.class);
    }



    public FaqTypeManagerServiceImpl(FaqTypeDao dao) {
        super(dao);
    }

}

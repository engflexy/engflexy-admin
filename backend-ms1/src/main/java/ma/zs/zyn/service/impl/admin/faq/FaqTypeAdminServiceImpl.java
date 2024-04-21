package ma.zs.zyn.service.impl.admin.faq;


import ma.zs.zyn.bean.core.faq.FaqType;
import ma.zs.zyn.dao.criteria.core.faq.FaqTypeCriteria;
import ma.zs.zyn.dao.facade.core.faq.FaqTypeDao;
import ma.zs.zyn.dao.specification.core.faq.FaqTypeSpecification;
import ma.zs.zyn.service.facade.admin.faq.FaqTypeAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FaqTypeAdminServiceImpl extends AbstractServiceImpl<FaqType, FaqTypeCriteria, FaqTypeDao> implements FaqTypeAdminService {








    public List<FaqType> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(FaqType.class, FaqTypeSpecification.class);
    }



    public FaqTypeAdminServiceImpl(FaqTypeDao dao) {
        super(dao);
    }

}

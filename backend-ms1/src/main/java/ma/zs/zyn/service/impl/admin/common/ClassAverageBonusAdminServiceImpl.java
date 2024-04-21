package ma.zs.zyn.service.impl.admin.common;


import ma.zs.zyn.bean.core.common.ClassAverageBonus;
import ma.zs.zyn.dao.criteria.core.common.ClassAverageBonusCriteria;
import ma.zs.zyn.dao.facade.core.common.ClassAverageBonusDao;
import ma.zs.zyn.dao.specification.core.common.ClassAverageBonusSpecification;
import ma.zs.zyn.service.facade.admin.common.ClassAverageBonusAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class ClassAverageBonusAdminServiceImpl extends AbstractServiceImpl<ClassAverageBonus, ClassAverageBonusCriteria, ClassAverageBonusDao> implements ClassAverageBonusAdminService {






    public ClassAverageBonus findByReferenceEntity(ClassAverageBonus t){
        return  dao.findByCode(t.getCode());
    }


    public List<ClassAverageBonus> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(ClassAverageBonus.class, ClassAverageBonusSpecification.class);
    }



    public ClassAverageBonusAdminServiceImpl(ClassAverageBonusDao dao) {
        super(dao);
    }

}

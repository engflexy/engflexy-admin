package ma.zs.alc.service.impl.manager.homework;


import ma.zs.alc.bean.core.homework.TypeHomeWork;
import ma.zs.alc.dao.criteria.core.homework.TypeHomeWorkCriteria;
import ma.zs.alc.dao.facade.core.homework.TypeHomeWorkDao;
import ma.zs.alc.dao.specification.core.homework.TypeHomeWorkSpecification;
import ma.zs.alc.service.facade.manager.homework.TypeHomeWorkManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TypeHomeWorkManagerServiceImpl extends AbstractServiceImpl<TypeHomeWork, TypeHomeWorkCriteria, TypeHomeWorkDao> implements TypeHomeWorkManagerService {







    public TypeHomeWork findByReferenceEntity(TypeHomeWork t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TypeHomeWork> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeHomeWork.class, TypeHomeWorkSpecification.class);
    }



    public TypeHomeWorkManagerServiceImpl(TypeHomeWorkDao dao) {
        super(dao);
    }

}

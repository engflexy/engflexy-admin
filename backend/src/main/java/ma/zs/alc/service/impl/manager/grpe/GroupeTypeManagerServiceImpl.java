package ma.zs.alc.service.impl.manager.grpe;


import ma.zs.alc.bean.core.grpe.GroupeType;
import ma.zs.alc.dao.criteria.core.grpe.GroupeTypeCriteria;
import ma.zs.alc.dao.facade.core.grpe.GroupeTypeDao;
import ma.zs.alc.dao.specification.core.grpe.GroupeTypeSpecification;
import ma.zs.alc.service.facade.manager.grpe.GroupeTypeManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GroupeTypeManagerServiceImpl extends AbstractServiceImpl<GroupeType, GroupeTypeCriteria, GroupeTypeDao> implements GroupeTypeManagerService {







    public GroupeType findByReferenceEntity(GroupeType t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<GroupeType> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(GroupeType.class, GroupeTypeSpecification.class);
    }



    public GroupeTypeManagerServiceImpl(GroupeTypeDao dao) {
        super(dao);
    }

}

package ma.zs.alc.service.impl.manager.grpe;


import ma.zs.alc.bean.core.grpe.GroupeEtat;
import ma.zs.alc.dao.criteria.core.grpe.GroupeEtatCriteria;
import ma.zs.alc.dao.facade.core.grpe.GroupeEtatDao;
import ma.zs.alc.dao.specification.core.grpe.GroupeEtatSpecification;
import ma.zs.alc.service.facade.manager.grpe.GroupeEtatManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GroupeEtatManagerServiceImpl extends AbstractServiceImpl<GroupeEtat, GroupeEtatCriteria, GroupeEtatDao> implements GroupeEtatManagerService {







    public GroupeEtat findByReferenceEntity(GroupeEtat t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<GroupeEtat> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(GroupeEtat.class, GroupeEtatSpecification.class);
    }



    public GroupeEtatManagerServiceImpl(GroupeEtatDao dao) {
        super(dao);
    }

}

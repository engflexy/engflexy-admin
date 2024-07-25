package ma.zs.alc.service.impl.manager.grpe;


import ma.zs.alc.bean.core.grpe.GroupeEtude;
import ma.zs.alc.dao.criteria.core.grpe.GroupeEtudeCriteria;
import ma.zs.alc.dao.facade.core.grpe.GroupeEtudeDao;
import ma.zs.alc.dao.specification.core.grpe.GroupeEtudeSpecification;
import ma.zs.alc.service.facade.manager.grpe.GroupeEtudeManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GroupeEtudeManagerServiceImpl extends AbstractServiceImpl<GroupeEtude, GroupeEtudeCriteria, GroupeEtudeDao> implements GroupeEtudeManagerService {









    public List<GroupeEtude> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(GroupeEtude.class, GroupeEtudeSpecification.class);
    }



    public GroupeEtudeManagerServiceImpl(GroupeEtudeDao dao) {
        super(dao);
    }

}

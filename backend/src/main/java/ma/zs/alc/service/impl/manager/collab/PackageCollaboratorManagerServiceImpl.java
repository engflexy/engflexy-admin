package ma.zs.alc.service.impl.manager.collab;


import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.PackageCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.PackageCollaboratorSpecification;
import ma.zs.alc.service.facade.manager.collab.PackageCollaboratorManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PackageCollaboratorManagerServiceImpl extends AbstractServiceImpl<PackageCollaborator, PackageCollaboratorCriteria, PackageCollaboratorDao> implements PackageCollaboratorManagerService {









    public List<PackageCollaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(PackageCollaborator.class, PackageCollaboratorSpecification.class);
    }



    public PackageCollaboratorManagerServiceImpl(PackageCollaboratorDao dao) {
        super(dao);
    }

}

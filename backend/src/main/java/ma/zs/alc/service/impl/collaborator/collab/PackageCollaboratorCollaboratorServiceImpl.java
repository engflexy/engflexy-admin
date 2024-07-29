package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.PackageCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.PackageCollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.PackageCollaboratorCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;



import java.util.List;
@Service
public class PackageCollaboratorCollaboratorServiceImpl extends AbstractServiceImpl<PackageCollaborator, PackageCollaboratorCriteria, PackageCollaboratorDao> implements PackageCollaboratorCollaboratorService {









    public List<PackageCollaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(PackageCollaborator.class, PackageCollaboratorSpecification.class);
    }



    public PackageCollaboratorCollaboratorServiceImpl(PackageCollaboratorDao dao) {
        super(dao);
    }

}

package ma.zs.alc.service.impl.admin.collab;


import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.PackageCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.PackageCollaboratorSpecification;
import ma.zs.alc.service.facade.admin.collab.PackageCollaboratorAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;



import java.util.List;
@Service
public class PackageCollaboratorAdminServiceImpl extends AbstractServiceImpl<PackageCollaborator, PackageCollaboratorCriteria, PackageCollaboratorDao> implements PackageCollaboratorAdminService {



    public List<PackageCollaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(PackageCollaborator.class, PackageCollaboratorSpecification.class);
    }



    public PackageCollaboratorAdminServiceImpl(PackageCollaboratorDao dao) {
        super(dao);
    }

}

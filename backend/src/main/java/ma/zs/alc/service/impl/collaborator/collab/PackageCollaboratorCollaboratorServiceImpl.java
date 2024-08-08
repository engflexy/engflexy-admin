package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.PackageCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.PackageCollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.PackageCollaboratorCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
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


    private Page<PackageCollaborator> findByPackageType(Boolean school,Pageable pageable){
        return dao.findBySchool(school,pageable);
    }

    @Override
    public Page<PackageCollaborator> findBySchool(Pageable pageable){
        return findByPackageType(true,pageable);
    }

    @Override
    public Page<PackageCollaborator> findByTeacher(PageRequest pageable) {
        return findByPackageType(false,pageable);
    }

}

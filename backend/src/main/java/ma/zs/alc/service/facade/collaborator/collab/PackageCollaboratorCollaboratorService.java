package ma.zs.alc.service.facade.collaborator.collab;

import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;


public interface PackageCollaboratorCollaboratorService extends  IService<PackageCollaborator,PackageCollaboratorCriteria>  {


    Page<PackageCollaborator> findBySchool(Pageable pageable);

    Page<PackageCollaborator> findByTeacher(PageRequest pageable);
}

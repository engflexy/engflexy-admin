package ma.zs.alc.service.facade.admin.collab;

import java.util.List;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


public interface PackageCollaboratorAdminService extends  IService<PackageCollaborator,PackageCollaboratorCriteria>  {


    Page<PackageCollaborator> findForTeacher(Pageable pageable);

    Page<PackageCollaborator> findForSchool(Pageable pageable);
}

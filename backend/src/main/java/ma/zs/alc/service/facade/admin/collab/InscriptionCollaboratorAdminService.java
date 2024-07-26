package ma.zs.alc.service.facade.admin.collab;

import java.util.List;
import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorCriteria;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.stereotype.Service;

public interface InscriptionCollaboratorAdminService extends  IService<InscriptionCollaborator,InscriptionCollaboratorCriteria>  {

    List<InscriptionCollaborator> findByPackageCollaboratorId(Long id);
    int deleteByPackageCollaboratorId(Long id);
    long countByPackageCollaboratorId(Long id);
    List<InscriptionCollaborator> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);
    List<InscriptionCollaborator> findByInscriptionCollaboratorStateCode(String code);
    int deleteByInscriptionCollaboratorStateCode(String code);
    long countByInscriptionCollaboratorStateCode(String code);




}
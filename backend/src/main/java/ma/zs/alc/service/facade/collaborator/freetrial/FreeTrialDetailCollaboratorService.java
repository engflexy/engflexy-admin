package ma.zs.alc.service.facade.collaborator.freetrial;

import java.util.List;
import ma.zs.alc.bean.core.freetrial.FreeTrialDetail;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialDetailCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface FreeTrialDetailCollaboratorService extends  IService<FreeTrialDetail,FreeTrialDetailCriteria>  {

    List<FreeTrialDetail> findByFreeTrialId(Long id);
    int deleteByFreeTrialId(Long id);
    long countByFreeTrialReference(String reference);
    List<FreeTrialDetail> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);




}

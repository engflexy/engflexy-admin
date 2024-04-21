package ma.zs.zyn.service.facade.admin.freetrial;

import java.util.List;
import ma.zs.zyn.bean.core.freetrial.FreeTrialDetail;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialDetailCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface FreeTrialDetailAdminService extends  IService<FreeTrialDetail,FreeTrialDetailCriteria>  {

    List<FreeTrialDetail> findByFreeTrialId(Long id);
    int deleteByFreeTrialId(Long id);
    long countByFreeTrialReference(String reference);
    List<FreeTrialDetail> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);




}

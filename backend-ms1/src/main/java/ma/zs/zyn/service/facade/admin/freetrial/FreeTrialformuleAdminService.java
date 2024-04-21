package ma.zs.zyn.service.facade.admin.freetrial;

import java.util.List;
import ma.zs.zyn.bean.core.freetrial.FreeTrialformule;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialformuleCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface FreeTrialformuleAdminService extends  IService<FreeTrialformule,FreeTrialformuleCriteria>  {

    List<FreeTrialformule> findByInscriptionId(Long id);
    int deleteByInscriptionId(Long id);
    long countByInscriptionId(Long id);




}

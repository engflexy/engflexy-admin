package ma.zs.zyn.service.facade.admin.inscriptionref;

import java.util.List;
import ma.zs.zyn.bean.core.inscriptionref.ConfirmationToken;
import ma.zs.zyn.dao.criteria.core.inscriptionref.ConfirmationTokenCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ConfirmationTokenAdminService extends  IService<ConfirmationToken,ConfirmationTokenCriteria>  {

    List<ConfirmationToken> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);




}

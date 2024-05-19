package ma.zs.alc.service.facade.collaborator.inscriptionref;

import java.util.List;
import ma.zs.alc.bean.core.inscriptionref.ConfirmationToken;
import ma.zs.alc.dao.criteria.core.inscriptionref.ConfirmationTokenCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface ConfirmationTokenCollaboratorService extends  IService<ConfirmationToken,ConfirmationTokenCriteria>  {

    List<ConfirmationToken> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);




}

package ma.zs.alc.service.facade.manager.collab;

import java.util.List;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface PaiementInscriptionCollaboratorManagerService extends  IService<PaiementInscriptionCollaborator,PaiementInscriptionCollaboratorCriteria>  {

    List<PaiementInscriptionCollaborator> findByInscriptionCollaboratorId(Long id);
    int deleteByInscriptionCollaboratorId(Long id);
    long countByInscriptionCollaboratorId(Long id);
    List<PaiementInscriptionCollaborator> findByPaiementInscriptionCollaboratorStateCode(String code);
    int deleteByPaiementInscriptionCollaboratorStateCode(String code);
    long countByPaiementInscriptionCollaboratorStateCode(String code);




}

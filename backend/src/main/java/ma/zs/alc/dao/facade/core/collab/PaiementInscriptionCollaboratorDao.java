package ma.zs.alc.dao.facade.core.collab;

import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaborator;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface PaiementInscriptionCollaboratorDao extends AbstractRepository<PaiementInscriptionCollaborator,Long>  {

    List<PaiementInscriptionCollaborator> findByInscriptionCollaboratorId(Long id);
    int deleteByInscriptionCollaboratorId(Long id);
    long countByInscriptionCollaboratorId(Long id);
    List<PaiementInscriptionCollaborator> findByPaiementInscriptionCollaboratorStateCode(String code);
            public int deleteByPaiementInscriptionCollaboratorStateCode(String code);
    long countByPaiementInscriptionCollaboratorStateCode(String code);


}

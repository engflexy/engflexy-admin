package ma.zs.alc.dao.facade.core.collab;

import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import org.springframework.stereotype.Repository;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import java.util.List;


@Repository
public interface PaiementInscriptionCollaboratorStateDao extends AbstractRepository<PaiementInscriptionCollaboratorState,Long>  {
    PaiementInscriptionCollaboratorState findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW PaiementInscriptionCollaboratorState(item.id,item.libelle) FROM PaiementInscriptionCollaboratorState item")
    List<PaiementInscriptionCollaboratorState> findAllOptimized();

}

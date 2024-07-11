package ma.zs.alc.dao.facade.core.collab;

import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import org.springframework.stereotype.Repository;
import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import java.util.List;


@Repository
public interface InscriptionCollaboratorStateDao extends AbstractRepository<InscriptionCollaboratorState,Long>  {
    InscriptionCollaboratorState findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW InscriptionCollaboratorState(item.id,item.libelle) FROM InscriptionCollaboratorState item")
    List<InscriptionCollaboratorState> findAllOptimized();

}

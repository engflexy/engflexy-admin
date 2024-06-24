package ma.zs.alc.dao.facade.core.vocab;

import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.common.Collaborator;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface CollaboratorDao extends AbstractRepository<Collaborator,Long>  {

    List<Collaborator> findByTypeCollaboratorId(Long id);
    int deleteByTypeCollaboratorId(Long id);
    long countByTypeCollaboratorCode(String code);
    Collaborator findByUsername(String username);


}

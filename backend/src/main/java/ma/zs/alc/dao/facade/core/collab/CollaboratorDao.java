package ma.zs.alc.dao.facade.core.collab;

import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CollaboratorDao extends AbstractRepository<Collaborator, Long> {

    List<Collaborator> findByTypeCollaboratorId(Long id);

    int deleteByTypeCollaboratorId(Long id);

    long countByTypeCollaboratorCode(String code);

    Collaborator findByUsername(String username);


    @Query("select new ma.zs.alc.dao.facade.core.inscription.UserPageable(coll) " +
            "from Collaborator coll")
    Page<UserPageable> findAllByCriteria(Pageable pageable);
}

package ma.zs.alc.dao.facade.core.collab;

import ma.zs.alc.bean.core.collab.Manager;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ManagerDao extends AbstractRepository<Manager,Long>  {

    List<Manager> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);
    Manager findByUsername(String username);


}

package ma.zs.alc.dao.facade.core.collab;

import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface PackageCollaboratorDao extends AbstractRepository<PackageCollaborator,Long>  {


    @Query("SELECT NEW PackageCollaborator(item.id,item.libelle) FROM PackageCollaborator item")
    List<PackageCollaborator> findAllOptimized();

}

package ma.zs.alc.dao.facade.core.collab;

import ma.zs.alc.bean.core.course.Parcours;
import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface PackageCollaboratorDao extends AbstractRepository<PackageCollaborator,Long>  {


    @Override
    @Query("SELECT  item FROM PackageCollaborator item order by item.nbrStudentBase asc")
    List<PackageCollaborator> findAll();

    @Query("SELECT NEW PackageCollaborator(item.id,item.libelle) FROM PackageCollaborator item")
    List<PackageCollaborator> findAllOptimized();

}
